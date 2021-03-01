import 'package:agendamento_consulta_medica/app_database/app_database.dart';
import 'package:agendamento_consulta_medica/controller/controller_item.dart';
import 'package:mobx/mobx.dart';
part 'refresh_item_list.g.dart';

class RefreshItemList = _RefreshItemList with _$RefreshItemList;

ControllerItem controller = ControllerItem();

abstract class _RefreshItemList with Store {
  @observable
  ObservableList<dynamic> listaItems = ObservableList<Item>();

  @action
  Future<void> refreshItemList() async {
    List<Item> lista = await controller.getAllItems();
    listaItems.clear();
    listaItems.addAll(lista);
  }

  @action
  Future<void> insertItem(Item item) async {
    await controller.insertItem(item);
  }

  @action
  Future<void> deleteItem(Item item) async {
    await controller.deleteItem(item);
  }
}
