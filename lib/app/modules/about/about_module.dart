import 'package:flutter/src/widgets/framework.dart';
import 'package:fisio_app/app/modules/about/about_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fisio_app/app/modules/about/about_page.dart';

class AboutModule extends ModuleWidget {
  @override
  List<Bind> get binds => [
        Bind((i) => AboutController()),
      ];

  static Inject get to => Inject<AboutModule>.of();

  @override
  // TODO: implement view
  Widget get view => About();
}
