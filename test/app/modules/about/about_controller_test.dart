import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fisio_app/app/modules/about/about_controller.dart';
import 'package:fisio_app/app/modules/about/about_module.dart';

void main() {
  initModule(AboutModule());
  AboutController about;

  setUp(() {
    about = AboutModule.to.get<AboutController>();
  });

  group('AboutController Test', () {
    test("First Test", () {
      expect(about, isInstanceOf<AboutController>());
    });

    test("Set Value", () {
      expect(about.value, equals(0));
      about.increment();
      expect(about.value, equals(1));
    });
  });
}
