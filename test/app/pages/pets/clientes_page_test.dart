import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:petvac/app/pages/clientes/clientes_page.dart';

main() {
  testWidgets('ClientesPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(ClientesPage(title: 'Clientes')));
    final titleFinder = find.text('Clientes');
    expect(titleFinder, findsOneWidget);
  });
}


