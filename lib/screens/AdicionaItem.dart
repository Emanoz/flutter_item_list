import 'package:agendamento_consulta_medica/app_database/app_database.dart';
import 'package:agendamento_consulta_medica/controller/controller_item.dart';
import 'package:agendamento_consulta_medica/mobX/refresh_item_list.dart';
import 'package:flutter/material.dart';

class AdicionaItem extends StatefulWidget {
  @override
  _AdicionaItemState createState() => _AdicionaItemState();
}

class _AdicionaItemState extends State<AdicionaItem> {
  ControllerItem controller = ControllerItem();

  @override
  void dispose() {
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
