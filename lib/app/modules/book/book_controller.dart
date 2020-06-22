import 'package:mobx/mobx.dart';

part 'book_controller.g.dart';

class BookController = _BookBase with _$BookController;

abstract class _BookBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
