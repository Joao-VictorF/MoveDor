import 'package:fisio_app/app/app_controller.dart';
import 'package:flutter/material.dart';
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
