import 'package:agendamento_consulta_medica/app_database/app_database.dart';
import 'package:agendamento_consulta_medica/mobX/refresh_item_list.dart';
import 'package:agendamento_consulta_medica/screens/list_items_card.dart';
import 'package:agendamento_consulta_medica/widgets/app_dependencies.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(
    refreshItemList: RefreshItemList(),
  ));
}

class MyApp extends StatelessWidget {
  final RefreshItemList refreshItemList;

  MyApp({
    @required this.refreshItemList,
  });

  @override
  Widget build(BuildContext context) {
    return AppDependencies(
      refreshItemList: refreshItemList,
      child: MaterialApp(
        title: 'Agendamento Médico',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ListaItemsCard(),
      ),
    );
  }
}
