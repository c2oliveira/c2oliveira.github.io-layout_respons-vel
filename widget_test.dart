import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart'; // Substitua pelo caminho correto do seu arquivo principal

void main() {
  testWidgets('Testa interação com os botões', (WidgetTester tester) async {
    // Carrega o aplicativo principal
    await tester.pumpWidget(const MyApp());

    // Verifica se os títulos dos botões são exibidos na tela
    expect(find.text('Item 1'), findsOneWidget);
    expect(find.text('Item 2'), findsOneWidget);
    expect(find.text('Item 3'), findsOneWidget);
    expect(find.text('Item 4'), findsOneWidget);

    // Simula o clique no botão "Item 1"
    await tester.tap(find.text('Item 1'));
    await tester.pump(); // Aguarda o SnackBar ser exibido

    // Verifica se o SnackBar com a mensagem correta foi exibido
    expect(find.text('Item 1 clicado!'), findsOneWidget);

    // Simula o clique no botão "Item 3"
    await tester.tap(find.text('Item 3'));
    await tester.pump(); // Aguarda o SnackBar ser exibido

    // Verifica se o SnackBar com a mensagem correta foi exibido
    expect(find.text('Item 3 clicado!'), findsOneWidget);
  });
}
