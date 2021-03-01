import 'package:agendamento_consulta_medica/app_database/app_database.dart';
import 'package:agendamento_consulta_medica/controller/controller_item.dart';
import 'package:agendamento_consulta_medica/mobX/refresh_item_list.dart';
import 'package:flutter/material.dart';

String _operacao = '';
Item _item_atualizado = Item();

class OperacaoItem extends StatefulWidget {
  OperacaoItem({String operacao, Item item_atualizado}) {
    _operacao = operacao;
    _item_atualizado = item_atualizado;
  }

  @override
  _OperacaoItemState createState() => _OperacaoItemState();
}

class _OperacaoItemState extends State<OperacaoItem> {
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
        title: Text(_operacao == 'Adicionar'
            ? 'Adicionar' + ' um novo item'
            : 'Atualizar' + ' um novo item'),
        actions: [
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () async {
              Item item = Item(
                  descricao: controller.controller_descricao.text,
                  quantidade:
                      int.tryParse(controller.controller_quantidade.text),
                  valor: double.tryParse(controller.controller_valor.text));

              if (_operacao == 'Adicionar') {
                await refresh.insertItem(item);
              } else {
                await refresh.updateItem(Item(
                    id: _item_atualizado.id,
                    descricao: item.descricao,
                    valor: item.valor,
                    quantidade: item.quantidade));
              }
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            textField(
                'Descrição', 'Descrição', controller.controller_descricao),
            textField('Valor', 'Valor', controller.controller_valor),
            textField(
                'Quantidade', 'Quantidade', controller.controller_quantidade),
          ],
        ),
      ),
    );
  }
}

Widget textField(
    String label, String hintText, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
      controller: controller,
    ),
  );
}
