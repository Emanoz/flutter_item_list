// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_item_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RefreshItemList on _RefreshItemList, Store {
  final _$listaItemsAtom = Atom(name: '_RefreshItemList.listaItems');

  @override
  ObservableList<dynamic> get listaItems {
    _$listaItemsAtom.reportRead();
    return super.listaItems;
  }

  @override
  set listaItems(ObservableList<dynamic> value) {
    _$listaItemsAtom.reportWrite(value, super.listaItems, () {
      super.listaItems = value;
    });
  }

  final _$refreshItemListAsyncAction =
      AsyncAction('_RefreshItemList.refreshItemList');

  @override
  Future<void> refreshItemList() {
    return _$refreshItemListAsyncAction.run(() => super.refreshItemList());
  }

  final _$insertItemAsyncAction = AsyncAction('_RefreshItemList.insertItem');

  @override
  Future<void> insertItem(dynamic item) {
    return _$insertItemAsyncAction.run(() => super.insertItem(item));
  }

  final _$deleteItemAsyncAction = AsyncAction('_RefreshItemList.deleteItem');

  @override
  Future<void> deleteItem(dynamic item) {
    return _$deleteItemAsyncAction.run(() => super.deleteItem(item));
  }

  @override
  String toString() {
    return '''
listaItems: ${listaItems}
    ''';
  }
}
