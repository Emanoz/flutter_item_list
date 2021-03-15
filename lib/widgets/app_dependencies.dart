import 'package:agendamento_consulta_medica/mobX/refresh_item_list.dart';
import 'package:flutter/material.dart';

class AppDependencies extends InheritedWidget {
  final RefreshItemList refreshItemList;

  AppDependencies({
    @required this.refreshItemList,
    @required Widget child,
  }) : super(child: child);

  // Método responsável pela injeção de dependencia; Serve para notificar os Widgets do app de qual é a instancia mais próxima deles de AppDependencies. Assim todos os Widgets desde a raiz do aplicativo podem acessá-lo.
  static AppDependencies of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppDependencies>();

  @override
  bool updateShouldNotify(AppDependencies oldWidget) {
    return refreshItemList != oldWidget.refreshItemList;
  }
}
