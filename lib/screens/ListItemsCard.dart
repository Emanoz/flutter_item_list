import 'package:agendamento_consulta_medica/app_database/app_database.dart';
import 'package:agendamento_consulta_medica/mobX/refresh_item_list.dart';
import 'package:agendamento_consulta_medica/screens/AdicionaItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moor_db_viewer/moor_db_viewer.dart';

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
            children: [_refreshItems(refresh)],
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
                      builder: (BuildContext context) => AdicionaItem()));
            },
          ),
        ));
  }
}

Widget _refreshItems(RefreshItemList refresh) {
  refresh.refreshItemList();

  return Column(
    children: List.generate(refresh.listaItems.length,
        (int index) => _itemCard(refresh.listaItems[index])),
  );
}

Widget _itemCard(Item item) {
  RefreshItemList refresh = RefreshItemList();

  return Card(
    margin: EdgeInsets.all(16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: Icon(Icons.payment),
          title: Text(item.descricao),
          subtitle: Text('Preço: ' + item.valor.toString()),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              child: Text('Atualizar'),
              onPressed: () {},
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
