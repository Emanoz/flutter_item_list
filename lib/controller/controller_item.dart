import 'package:agendamento_consulta_medica/app_database/app_database.dart';
import 'package:flutter/material.dart';

class ControllerItem {
  TextEditingController controller_descricao = TextEditingController();
  TextEditingController controller_valor = TextEditingController();
  TextEditingController controller_quantidade = TextEditingController();
  AppDatabase _db = AppDatabase();

  Future<void> insertItem(Item item) async {
    await _db.insertItem(item);
  }

  Future<List<Item>> getAllItems() async {
    return await _db.getAllItems();
  }

  Future<void> deleteItem(Item item) async {
    await _db.deleteItem(item);
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'ControllerItem{descricao: ${controller_descricao.text}; valor: ${controller_valor.text}; quantidade: ${controller_quantidade.text}}';
  }
}
