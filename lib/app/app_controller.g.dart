// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppBase, Store {
  final _$isDarkModeAtom = Atom(name: '_AppBase.isDarkMode');

  @override
  bool get isDarkMode {
    _$isDarkModeAtom.context.enforceReadPolicy(_$isDarkModeAtom);
    _$isDarkModeAtom.reportObserved();
    return super.isDarkMode;
  }

  @override
  set isDarkMode(bool value) {
    _$isDarkModeAtom.context.conditionallyRunInAction(() {
      super.isDarkMode = value;
      _$isDarkModeAtom.reportChanged();
    }, _$isDarkModeAtom, name: '${_$isDarkModeAtom.name}_set');
  }

  final _$answeredSearchAtom = Atom(name: '_AppBase.answeredSearch');

  @override
  bool get answeredSearch {
    _$answeredSearchAtom.context.enforceReadPolicy(_$answeredSearchAtom);
    _$answeredSearchAtom.reportObserved();
    return super.answeredSearch;
  }

  @override
  set answeredSearch(bool value) {
    _$answeredSearchAtom.context.conditionallyRunInAction(() {
      super.answeredSearch = value;
      _$answeredSearchAtom.reportChanged();
    }, _$answeredSearchAtom, name: '${_$answeredSearchAtom.name}_set');
  }

  final _$fontSizeAtom = Atom(name: '_AppBase.fontSize');

  @override
  int get fontSize {
    _$fontSizeAtom.context.enforceReadPolicy(_$fontSizeAtom);
    _$fontSizeAtom.reportObserved();
    return super.fontSize;
  }

  @override
  set fontSize(int value) {
    _$fontSizeAtom.context.conditionallyRunInAction(() {
      super.fontSize = value;
      _$fontSizeAtom.reportChanged();
    }, _$fontSizeAtom, name: '${_$fontSizeAtom.name}_set');
  }

  final _$_AppBaseActionController = ActionController(name: '_AppBase');

  @override
  void changeTheme() {
    final _$actionInfo = _$_AppBaseActionController.startAction();
    try {
      return super.changeTheme();
    } finally {
      _$_AppBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSearch(bool value) {
    final _$actionInfo = _$_AppBaseActionController.startAction();
    try {
      return super.changeSearch(value);
    } finally {
      _$_AppBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseFontSize() {
    final _$actionInfo = _$_AppBaseActionController.startAction();
    try {
      return super.increaseFontSize();
    } finally {
      _$_AppBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseFontSize() {
    final _$actionInfo = _$_AppBaseActionController.startAction();
    try {
      return super.decreaseFontSize();
    } finally {
      _$_AppBaseActionController.endAction(_$actionInfo);
    }
  }
}
