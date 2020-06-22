import 'package:flutter/src/widgets/framework.dart';
import 'package:fisio_app/app/modules/infografico/infografico_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fisio_app/app/modules/infografico/infografico_page.dart';

class InfograficoModule extends ModuleWidget {
  @override
  List<Bind> get binds => [
        Bind((i) => InfograficoController()),
      ];

  static Inject get to => Inject<InfograficoModule>.of();

  @override
  // TODO: implement view
  Widget get view => InfograficoPage();
}
