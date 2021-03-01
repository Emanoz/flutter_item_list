import 'package:agendamento_consulta_medica/app_database/app_database.dart';
import 'package:agendamento_consulta_medica/mobX/refresh_item_list.dart';
import 'package:agendamento_consulta_medica/screens/operacao_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moor_db_viewer/moor_db_viewer.dart';
import 'package:path/path.dart';

class ListaItemsCard extends StatefulWidget {
  @override
  _ListaItemsCardState createState() => _ListaItemsCardState();
}

class _ListaItemsCardState extends State<ListaItemsCard> {
  RefreshItemList refresh = RefreshItemList();
  AppDatabase _db = AppDatabase();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    refresh.refreshItemList();
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.home),
          title: Text('Itens adicionados'),
          actions: [
            IconButton(
                icon: Icon(Icons.archive),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MoorDbViewer(_db)));
                }),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () async {
                await refresh.refreshItemList();
              },
            )
          ],
        ),
        body: Observer(builder: (context) {
          return ListView(
            children: [_refreshItems(refresh, context)],
            scrollDirection: Axis.vertical,
          );
        }),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 30, right: 20),
          child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          OperacaoItem(operacao: 'Adicionar')));
            },
          ),
        ));
  }
}

Widget _refreshItems(RefreshItemList refresh, BuildContext context) {
  refresh.refreshItemList();

  return Column(
    children: List.generate(refresh.listaItems.length,
        (int index) => _itemCard(refresh.listaItems[index], context)),
  );
}

Widget _itemCard(Item item, BuildContext context) {
  RefreshItemList refresh = RefreshItemList();

  return Card(
    margin: EdgeInsets.all(16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: Icon(Icons.add_shopping_cart_rounded),
          title: Text(item.descricao),
          subtitle: RichText(
            text: TextSpan(
                text: 'Preço: ' + item.valor.toString(),
                style: TextStyle(color: Colors.black54),
                children: [
                  TextSpan(text: '\nQuantidade: ' + item.quantidade.toString()),
                ]),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              child: Text('Atualizar'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => OperacaoItem(
                            operacao: 'Atualizar', item_atualizado: item)));
              },
            ),
            TextButton(
              child: Text('Excluir'),
              onPressed: () async {
                await refresh.deleteItem(item);
              },
            ),
          ],
        ),
      ],
    ),
  );
}
