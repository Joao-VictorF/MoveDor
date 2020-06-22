import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fisio_app/app/modules/infografico/infografico_controller.dart';
import 'package:fisio_app/app/modules/infografico/infografico_module.dart';

void main() {
  initModule(InfograficoModule());
  InfograficoController infografico;

  setUp(() {
    infografico = InfograficoModule.to.get<InfograficoController>();
  });

  group('InfograficoController Test', () {
    test("First Test", () {
      expect(infografico, isInstanceOf<InfograficoController>());
    });

    test("Set Value", () {
      expect(infografico.value, equals(0));
      infografico.increment();
      expect(infografico.value, equals(1));
    });
  });
}
