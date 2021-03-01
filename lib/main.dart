import 'package:agendamento_consulta_medica/screens/ListItemsCard.dart';
import 'package:flutter/material.dart';
import 'app_database/app_database.dart';

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
      home: ListaItemsCard(),
    );
  }
}
