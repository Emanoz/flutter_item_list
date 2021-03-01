import 'package:agendamento_consulta_medica/controller_item.dart';
import 'package:agendamento_consulta_medica/refresh_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:moor_db_viewer/moor_db_viewer.dart';

import 'app_database.dart';

AppDatabase _db = AppDatabase();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agendamento Médico',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ListaItens(),
    );
  }
}

class ListaItens extends StatefulWidget {
  @override
  _ListaItensState createState() => _ListaItensState();
}

class _ListaItensState extends State<ListaItens> {
  RefreshItemList refresh = RefreshItemList();

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
            /*IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () async {
                await refresh.refreshItemList();
              },
            )*/
          ],
        ),
        body: Observer(builder: (context) {
          refresh.refreshItemList();
          return refreshItems(refresh);
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

Widget refreshItems(RefreshItemList refresh) {
  RefreshItemList _refresh = refresh;
  ObservableList<Item> list = _refresh.listaItems;

  return ListView(
    children: [
      Column(
        children:
            List.generate(list.length, (int index) => _itemCard(list[index])),
      )
    ],
    scrollDirection: Axis.vertical,
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

class AdicionaItem extends StatefulWidget {
  @override
  _AdicionaItemState createState() => _AdicionaItemState();
}

class _AdicionaItemState extends State<AdicionaItem> {
  ControllerItem controller = ControllerItem();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    RefreshItemList refresh = RefreshItemList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Adicionar um novo item'),
        actions: [
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () async {
              await refresh.insertItem(Item(
                descricao: controller.controller_descricao.text,
                quantidade: int.tryParse(controller.controller_quantidade.text),
                valor: double.tryParse(controller.controller_valor.text),
              ));
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Descrição',
                  hintText: 'Descrição',
                  border: OutlineInputBorder(),
                ),
                controller: controller.controller_descricao,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Valor',
                  hintText: 'Valor',
                  border: OutlineInputBorder(),
                ),
                controller: controller.controller_valor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Quantidade',
                  hintText: 'Quantidade',
                  border: OutlineInputBorder(),
                ),
                controller: controller.controller_quantidade,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
