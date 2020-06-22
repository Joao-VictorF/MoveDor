import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:fisio_app/app/modules/book/book_page.dart';

main() {
  testWidgets('bookPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(BookPage()));
    final titleFinder = find.text('Book');
    expect(titleFinder, findsOneWidget);
  });
}
