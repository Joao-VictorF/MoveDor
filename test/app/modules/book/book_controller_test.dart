import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fisio_app/app/modules/book/book_controller.dart';
import 'package:fisio_app/app/modules/book/book_module.dart';

void main() {
  initModule(BookModule());
  BookController book;

  setUp(() {
    book = BookModule.to.get<BookController>();
  });

  group('ChatController Test', () {
    test("First Test", () {
      expect(book, isInstanceOf<BookController>());
    });

    test("Set Value", () {
      expect(book.value, equals(0));
      book.increment();
      expect(book.value, equals(1));
    });
  });
}
