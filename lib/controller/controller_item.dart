import 'package:agendamento_consulta_medica/app_database/app_database.dart';
import 'package:flutter/material.dart';

class ControllerItem {
  TextEditingController controllerDescricao = TextEditingController();
  TextEditingController controllerValor = TextEditingController();
  TextEditingController controllerQuantidade = TextEditingController();
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

  Future<void> updateItem(Item item) async {
    await _db.updateItem(item);
  }

  @override
  String toString() {
    return 'ControllerItem{descricao: ${controllerDescricao.text}; valor: ${controllerValor.text}; quantidade: ${controllerQuantidade.text}}';
  }
}
