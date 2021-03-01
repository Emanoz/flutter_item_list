import 'package:agendamento_consulta_medica/app_database/app_database.dart';
import 'package:agendamento_consulta_medica/controller/controller_item.dart';
import 'package:agendamento_consulta_medica/mobX/refresh_item_list.dart';
import 'package:flutter/material.dart';

String _operacao = '';
Item _itemAtualizado;

class OperacaoItem extends StatefulWidget {
  OperacaoItem({String operacao, Item itemAtualizado}) {
    _operacao = operacao;

    if (itemAtualizado != null)
      _itemAtualizado = itemAtualizado;
    else
      _itemAtualizado = Item(id: null, descricao: '', valor: 0, quantidade: 0);
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
                  id: null,
                  descricao: controller.controllerDescricao.text,
                  quantidade:
                      int.tryParse(controller.controllerQuantidade.text),
                  valor: double.tryParse(controller.controllerValor.text));

              if (_operacao == 'Adicionar') {
                await refresh.insertItem(item);
              } else {
                await refresh.updateItem(Item(
                    id: _itemAtualizado.id,
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
          textField('Descrição', 'Descrição', controller.controllerDescricao,
              TextInputType.text, _itemAtualizado.descricao),
          textField('Valor', 'Valor', controller.controllerValor,
              TextInputType.number, _itemAtualizado.valor.toString()),
          textField('Quantidade', 'Quantidade', controller.controllerQuantidade,
              TextInputType.number, _itemAtualizado.quantidade.toString()),
        ],
      )),
    );
  }
}

Widget textField(
    String label,
    String hintText,
    TextEditingController controller,
    TextInputType keyboard,
    String initialText) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
      controller: controller..text = initialText,
      keyboardType: keyboard,
    ),
  );
}
