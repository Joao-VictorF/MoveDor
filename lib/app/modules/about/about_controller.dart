import 'package:mobx/mobx.dart';

part 'about_controller.g.dart';

class AboutController = _AboutBase with _$AboutController;

abstract class _AboutBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
