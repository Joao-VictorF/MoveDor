import 'package:fisio_app/app/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InfograficoPage extends StatefulWidget {
  final String title;
  const InfograficoPage({Key key, this.title = "Infografico"}) : super(key: key);
  
  @override
  _InfograficoPageState createState() => _InfograficoPageState();
}

class _InfograficoPageState extends State<InfograficoPage> {
  // WebViewController _webViewController;
  String filePath = 'assets/infografico/index.html';

  @override
  void initState() { 
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  // final appState = Provider.of<AppController>(context);
  
    return Scaffold(
      body:
        WebView(
          onWebViewCreated: (WebViewController controller) {
            controller.loadAssetHtmlFile(filePath);
            // controller.loadLocalHtmlFile(url);
          },
          javascriptMode: JavascriptMode.unrestricted,
        )
    );
  }
}
