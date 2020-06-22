import 'package:fisio_app/app/modules/home/menu_page.dart';
import 'package:fisio_app/app/modules/home/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fisio_app/app/app_controller.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class BookPage extends StatefulWidget {
  const BookPage({Key key}) : super(key: key);

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getAnsweredSearchBool();
  }
  
  _getAnsweredSearchBool() async {
    final prefs = await SharedPreferences.getInstance();
    final appState = Provider.of<AppController>(context, listen: false);

    appState.changeSearch(prefs.getBool('answeredSearch') ?? false);
    // appState.changeSearch(false);
    
    setState(() {
      this.isLoading = false;
    });
  }


  Widget build(BuildContext context) {
    final appState = Provider.of<AppController>(context);

    return Scaffold(
      body: 
        Container(
          child: Observer(
            builder: (_) {
              return 
              isLoading ? 
              Container(
                color: 
                appState.isDarkMode ? 
                  Colors.black87
                  : 
                  Colors.white70,
                child: Center(
                  child: 
                  SizedBox(
                    height: 60.0,
                    width: 60.0,
                    child: 
                      CircularProgressIndicator(),
                    )
                ),
              )
              :
              appState.answeredSearch ?
              MenuPage()
              :
              Container (
                color: appState.isDarkMode ? Colors.black87 : Colors.white70,
                child: 
                Theme (
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: appState.isDarkMode ? Colors.white70 : Colors.black54,
                  ),
                  child: SearchPage()
                )
              );
            },
          ),
        ),
    );
  }
}
