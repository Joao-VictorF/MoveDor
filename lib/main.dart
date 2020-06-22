import 'package:animated_splash/animated_splash.dart';

import 'package:flutter/material.dart';
import 'package:fisio_app/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fisio_app/app/app_controller.dart';
import 'package:provider/provider.dart';

// import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // SharedPreferences.setMockInitialValues({});
  // runApp(
  //   AppWidget()
  // );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: 
      AnimatedSplash(
        imagePath: 'assets/logo/logo_com_nome_fbranco.png',
        home: AppWidget(),
        duration: 2500,
        type: AnimatedSplashType.StaticDuration,
      ),
    )
  );
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    MultiProvider(
      providers: [
        Provider<AppController>(
          create: (_) => AppController(),
        ),
      ],
      child: 
        ModularApp(
          module: AppModule(),
        ),
    );
  }
}
