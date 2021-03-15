// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:agendamento_consulta_medica/app_database/app_database.dart';
import 'package:agendamento_consulta_medica/main.dart';
import 'package:agendamento_consulta_medica/screens/list_items_card.dart';
import 'package:agendamento_consulta_medica/screens/operacao_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'matchers.dart';
import 'mock.dart';

void main() {
  testWidgets('Deve salvar um novo item', (tester) async {
    final mockItemList = MockItemList();

    await tester.pumpWidget(MyApp(
      refreshItemList: mockItemList,
    ));

    // Testa se o widget ListaItemsCard foi instanciado (se existe)
    final listItemsCard = find.byType(ListaItemsCard);
    expect(listItemsCard, findsOneWidget);

    // Testa se o widget FAB foi instanciado, clica nele e espera carregar os microserviços (animações, nova tela instanciada, etc.)
    final fabNewItem = find.widgetWithIcon(FloatingActionButton, Icons.add);
    expect(fabNewItem, findsOneWidget);
    await tester.tap(fabNewItem);
    await tester.pumpAndSettle();

    // Testa se foi instanciada a tela OperacaoItem
    final operacaoItem = find.byType(OperacaoItem);
    expect(operacaoItem, findsOneWidget);

    // Testa se o textfield 'Descrição' foi instanciado e digita o texto 'Estojo' nele
    final descricaoTextField = find
        .byWidgetPredicate((widget) => textFieldMatcher(widget, 'Descrição'));
    expect(descricaoTextField, findsOneWidget);
    await tester.enterText(descricaoTextField, 'Estojo');

    // Testa se o textfield 'Valor' foi instanciado e digita o texto '115.5' nele
    final valorTextField =
        find.byWidgetPredicate((widget) => textFieldMatcher(widget, 'Valor'));
    expect(valorTextField, findsOneWidget);
    await tester.enterText(valorTextField, '115.5');

    // Testa se o textfield 'Quantidade' foi instanciado e digita o texto '3' nele
    final quantidadeTextField = find
        .byWidgetPredicate((widget) => textFieldMatcher(widget, 'Quantidade'));
    expect(quantidadeTextField, findsOneWidget);
    await tester.enterText(quantidadeTextField, '3');

    //Testa se o botão de criar um novo item foi instanciado; clica nele e espera carregar os microserviços
    final sendButton = find.widgetWithIcon(IconButton, Icons.send);
    expect(sendButton, findsOneWidget);
    await tester.tap(sendButton);
    await tester.pumpAndSettle();

    // Verifica se o método insertItem foi chamado
    verify(mockItemList.insertItem(
        Item(id: null, descricao: 'Estojo', valor: 115.5, quantidade: 3)));

    // Volta no ListaItemCard e testa se o widget foi instanciado (se existe)
    final listItemsCardBack = find.byType(ListaItemsCard);
    expect(listItemsCardBack, findsOneWidget);
    //tester.pumpAndSettle();

    // Verifica se o método refreshItemList foi chamado
    verify(mockItemList.refreshItemList());
  });
}
