import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

class AppController = _AppBase with _$AppController;

abstract class _AppBase with Store {
  @observable
  bool isDarkMode = false;

  @observable
  bool answeredSearch = false;

  @observable
  int fontSize = 18;

  @action
  void changeTheme() {
    isDarkMode = !isDarkMode;
  }
  
  @action
  void changeSearch(bool value) {
    answeredSearch = value;
  }

  @action
  void increaseFontSize() {
    if(fontSize < 30) {
      fontSize++;
    }
  }

  @action
  void decreaseFontSize() {
    if(fontSize > 15) {
      fontSize--;
    }
  }
}
