import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:petvac/app/pages/tiposservicos/tiposservicos_page.dart';

main() {
  testWidgets('TiposservicosPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(TiposServicosPage(title: 'Tiposservicos')));
    final titleFinder = find.text('Tiposservicos');
    expect(titleFinder, findsOneWidget);
  });
}


