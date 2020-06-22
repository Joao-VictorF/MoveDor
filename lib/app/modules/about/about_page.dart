import 'package:fisio_app/app/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatefulWidget {
  final String title;
  const AboutPage({Key key, this.title = "About"}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppController>(context);

    return Scaffold(
      body: 
        Observer(
          builder: (_) {
            return 
            Center(
              child: 
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: appState.isDarkMode ? Colors.black87 : Colors.white70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Tela pra falar sobre o app',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: appState.isDarkMode ? Colors.white70 : Colors.black87,
                      fontSize: 18,
                    ),
                    )
                  ],
                ),
              )    
            );
        }),
      );
  }
}
