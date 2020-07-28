import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:fisio_app/app/modules/about/about_page.dart';

main() {
  testWidgets('AboutPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(About()));
    final titleFinder = find.text('Calls');
    expect(titleFinder, findsOneWidget);
  });
}
