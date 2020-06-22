import 'package:fisio_app/app/app_controller.dart';
import 'package:fisio_app/app/modules/book/caps_page.dart';
import 'package:fisio_app/app/modules/infografico/infografico_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rich_alert/rich_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() { 
    super.initState();
    getReadCaps();
  }
  bool canAccessDiary = false;
  bool canAccessInfo = false;

  getReadCaps() async {
    final SharedPreferences prefs = await _prefs;

    canAccessDiary = prefs.getBool('cap3');
    canAccessInfo = prefs.getBool('cap6');
  }

  Widget build(BuildContext context) {
    final appState = Provider.of<AppController>(context);
    
    return Container(
      child:       
       Observer(
        builder: (_) {
          return 
          Container (
            color: appState.isDarkMode ? Colors.black87 : Colors.white70,
            height: MediaQuery.of(context).size.height,
            child:
             Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                
                Container (
                  margin: EdgeInsets.only(bottom: 40),
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: 
                  Image(
                    image: AssetImage('assets/logo/logo_com_nome_ftransparente.png')
                  ),
                ),

                Center(
                  child: 
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CapsPage()),
                      );
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Color(0xff36a9b0), Color(0xffa9d6c2)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Livreto",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'MontserratRegular',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Center(
                  child: 
                  RaisedButton(
                    onPressed: () {
                      if(canAccessDiary) {
                        print('a');
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return
                              RichAlertDialog( 
                                alertTitle: richTitle(
                                  Text(
                                    "Calma!",
                                    textAlign: TextAlign.center,
                                      style: TextStyle (
                                        fontSize: 24,
                                        color: Colors.black87
                                      ),
                                  )
                                ),
                                alertSubtitle: richSubtitle(
                                  Text(
                                    'Você poderá acessar essa funcionalidade depois de ler o 3° capítulo do livreto!',
                                    textAlign: TextAlign.center,
                                      style: TextStyle (
                                        fontSize: 18,
                                        color: Colors.black54
                                      ),
                                    )
                                  ),
                                alertType: RichAlertType.WARNING,
                                dialogIcon: Icon(
                                  Icons.assignment_late,
                                  size: 60,
                                  color: Colors.blueGrey,
                                ), 
                                actions: <Widget>[
                                  RaisedButton(
                                    child: Text("OK", style: TextStyle(color: Colors.white),),
                                    color: Colors.green[300],
                                    onPressed: (){Navigator.pop(context);},
                                  ),
                                ],
                              );
                          }
                        );
                      }
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Color(0xff36a9b0), Color(0xffa9d6c2)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: 
                        Container(
                          constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: Text(
                            "Diário de Exercícios",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'MontserratRegular',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                        )
                    ),
                  ),
                ),

                Center(
                  child: 
                  RaisedButton(
                    onPressed: () {
                      if(canAccessInfo) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => InfograficoPage()),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return
                              RichAlertDialog( 
                                alertTitle: richTitle(
                                  Text(
                                    "Calma!",
                                    textAlign: TextAlign.center,
                                      style: TextStyle (
                                        fontSize: 24,
                                        color: Colors.black87
                                      ),
                                  )
                                ),
                                alertSubtitle: richSubtitle(
                                  Text(
                                    'Você poderá acessar essa funcionalidade depois de ler o 5° capítulo do livreto!',
                                    textAlign: TextAlign.center,
                                      style: TextStyle (
                                        fontSize: 18,
                                        color: Colors.black54
                                      ),
                                    )
                                  ),
                                alertType: RichAlertType.WARNING,
                                dialogIcon: Icon(
                                  Icons.assignment_late,
                                  size: 60,
                                  color: Colors.blueGrey,
                                ), 
                                actions: <Widget>[
                                  RaisedButton(
                                    child: Text("OK", style: TextStyle(color: Colors.white),),
                                    color: Colors.green[300],
                                    onPressed: (){Navigator.pop(context);},
                                  ),
                                ],
                              );
                          }
                        );
                      }
                      
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Color(0xff36a9b0), Color(0xffa9d6c2)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: 
                        Container(
                          constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: Text(
                            "Infográfico",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'MontserratRegular',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                        )
                    ),
                  ),
                ),

                Center(
                  child: 
                  RaisedButton(
                    onPressed: () {
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Color(0xff36a9b0), Color(0xffa9d6c2)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Sobre",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'MontserratRegular',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]

            ),
          );
        }
      ),
    );
  }
}