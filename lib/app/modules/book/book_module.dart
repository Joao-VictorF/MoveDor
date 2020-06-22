import 'package:flutter/src/widgets/framework.dart';
import 'package:fisio_app/app/modules/book/book_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fisio_app/app/modules/book/book_page.dart';

class BookModule extends ModuleWidget {
  @override
  List<Bind> get binds => [
        Bind((i) => BookController()),
      ];

  static Inject get to => Inject<BookModule>.of();

  @override
  Widget get view => BookPage();
}
