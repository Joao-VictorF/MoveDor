import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:fisio_app/app/modules/infografico/infografico_page.dart';

main() {
  testWidgets('InfograficoPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(InfograficoPage(title: 'Infografico')));
    final titleFinder = find.text('Infografico');
    expect(titleFinder, findsOneWidget);
  });
}
