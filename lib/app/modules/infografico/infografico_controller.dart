import 'package:mobx/mobx.dart';

part 'infografico_controller.g.dart';

class InfograficoController = _InfograficoBase with _$InfograficoController;

abstract class _InfograficoBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
