import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fisio_app/app/modules/about/about_module.dart';
import 'package:fisio_app/app/modules/book/book_module.dart';
import 'package:fisio_app/app/modules/home/home_controller.dart';
import 'package:fisio_app/app/modules/infografico/infografico_module.dart';
import 'package:fisio_app/custom_icons_icons.dart';
import 'package:fisio_app/app/app_controller.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() { 
    super.initState();
    _getAnsweredSearchBool();
  }

  _getAnsweredSearchBool() async {
    final prefs = await SharedPreferences.getInstance();
    final appState = Provider.of<AppController>(context, listen: false);

    appState.changeSearch(prefs.getBool('answeredSearch') ?? false);
  }
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppController>(context);

    return 
    Observer(
      builder: (_) {
        return
          Scaffold(
            backgroundColor: Colors.white,
            body: 
            PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: controller.pageController,
              children: [
                BookModule(), 
                InfograficoModule(), 
                AboutModule()
              ],
            ),
            floatingActionButton: 
              Observer(
                builder: (_) {
                  return
                  appState.isDarkMode ?
                    SpeedDial (
                      closeManually: true,
                      marginRight: 10,
                      marginBottom: 10,
                      animatedIcon: AnimatedIcons.menu_close,
                      animatedIconTheme: IconThemeData(size: 22.0),
                      curve: Curves.bounceIn,
                      overlayOpacity: 0,
                      tooltip: 'Preferências',
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      elevation: 5,
                      shape: CircleBorder(),
                      children: [
                        SpeedDialChild(
                          labelWidget: 
                          Container(
                            width: 180,
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: new BorderRadius.circular(25)
                            ),
                            padding: EdgeInsets.all(10),
                            // color: Colors.white,
                            child: Text(
                              'Ativar modo claro',
                              textAlign: TextAlign.center,
                              style: 
                              TextStyle(
                                color: Colors.black54,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          backgroundColor: Colors.white,
                          onTap: () {
                            appState.changeTheme();
                          }, 
                          child: 
                          Icon(
                            CustomIcons.sun,
                            color: Colors.black54,
                          )
                        ),
                        
                        SpeedDialChild(
                          labelWidget: 
                          Container(
                            width: 180,
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: new BorderRadius.circular(25)
                            ),
                            padding: EdgeInsets.all(10),
                            // color: Colors.white,
                            child: Text(
                              'Diminuir fonte',
                              textAlign: TextAlign.center,
                              style: 
                              TextStyle(
                                color: Colors.black54,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          child: Icon(CustomIcons.remove, color: Colors.black54),
                          backgroundColor: Colors.white,
                          labelStyle: TextStyle(fontSize: 18.0),
                          onTap: () =>  appState.decreaseFontSize(),
                        ),
                        
                        SpeedDialChild(
                          labelWidget: 
                          Container(
                            width: 180,
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: new BorderRadius.circular(25)
                            ),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Aumentar fonte',
                              textAlign: TextAlign.center,
                              style: 
                              TextStyle(
                                color: Colors.black54,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          child: Icon(CustomIcons.plus, color: Colors.black45,),
                          backgroundColor: Colors.white,
                          labelStyle: TextStyle(fontSize: 18.0),
                          onTap: () => appState.increaseFontSize()
                        )
                      ],
                    )
                  :
                    SpeedDial (
                      closeManually: true,
                      marginRight: 10,
                      marginBottom: 10,
                      animatedIcon: AnimatedIcons.menu_close,
                      animatedIconTheme: IconThemeData(size: 22.0),
                      curve: Curves.bounceIn,
                      overlayOpacity: 0,
                      tooltip: 'Preferências',
                      backgroundColor: Colors.black87,
                      foregroundColor: Colors.white70,
                      elevation: 5,
                      shape: CircleBorder(),
                      children: [
                        SpeedDialChild(
                          labelWidget: 
                          Container(
                            width: 180,
                            decoration: new BoxDecoration(
                              color: Colors.black87,
                              shape: BoxShape.rectangle,
                              borderRadius: new BorderRadius.circular(25) 
                            ),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Ativar modo escuro',
                              textAlign: TextAlign.center,
                              style: 
                              TextStyle(
                                color: Colors.white70,
                                fontSize: 17,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                          backgroundColor: Colors.black87,
                          onTap: () {
                            appState.changeTheme();
                          }, 
                          child: 
                            Icon(
                              CustomIcons.moon_1,
                              color: Colors.white70,
                            )
                        ),
                        
                        SpeedDialChild(
                          labelWidget: 
                          Container(
                            width: 180,
                            decoration: new BoxDecoration(
                              color: Colors.black87,
                              shape: BoxShape.rectangle,
                              borderRadius: new BorderRadius.circular(25) 
                            ),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Diminuir fonte',
                              textAlign: TextAlign.center,
                              style: 
                              TextStyle(
                                color: Colors.white70,
                                fontSize: 17,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                          
                          child: Icon(CustomIcons.remove, color: Colors.white70),
                          backgroundColor: Colors.black87,
                          labelStyle: TextStyle(fontSize: 18.0),
                          onTap: () =>  appState.decreaseFontSize(),
                        ),

                        SpeedDialChild(
                          labelWidget: 
                          Container(
                            width: 180,
                            decoration: new BoxDecoration(
                              color: Colors.black87,
                              shape: BoxShape.rectangle,
                              borderRadius: new BorderRadius.circular(25) 
                            ),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Aumentar fonte',
                              textAlign: TextAlign.center,
                              style: 
                              TextStyle(
                                color: Colors.white70,
                                fontSize: 17,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                          child: Icon(CustomIcons.plus, color: Colors.white70,),
                          backgroundColor: Colors.black87,
                          labelStyle: TextStyle(fontSize: 18.0),
                          onTap: () => appState.increaseFontSize()
                        ),
                      ],
                    )
                  ;
                },
              ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          );
      }
    );    
  }
}
