import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:petvac/app/pages/funcionarios/funcionarios_page.dart';

main() {
  testWidgets('FuncionariosPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(FuncionarioPage(title: 'Funcionarios')));
    final titleFinder = find.text('Funcionarios');
    expect(titleFinder, findsOneWidget);
  });
}
