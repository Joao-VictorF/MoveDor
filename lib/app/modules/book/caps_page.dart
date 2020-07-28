import 'package:fisio_app/app/modules/book/cap_page.dart';
import 'package:fisio_app/app/modules/book/responderQuiz.dart';
import 'package:fisio_app/app/modules/home/menu_page.dart';
import 'package:fisio_app/app/modules/infografico/infografico_page.dart';
import 'package:fisio_app/custom_icons_icons.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fisio_app/app/app_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:rich_alert/rich_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:shared_preferences/shared_preferences.dart';

class CapsPage extends StatefulWidget {
  const CapsPage({Key key}) : super(key: key);

  @override
  _CapsPageState createState() => _CapsPageState();
}

class _CapsPageState extends State<CapsPage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool isLoading = true;

  @override
  void initState() { 
    super.initState();
    getReadCaps();
  }
  
  List<Map> capitulos = [
    {
      'text': 'Conceitos Básicos',
      'key': '',
      'canRead': true,
      'imageName': 'cap1_illustration.png',
    },
    { 
      'text': 'Movimento é saúde!',
      'key': '',
      'canRead': false,
      'imageName': 'cap2_illustration.png',
    },
    {
      'text': 'Exercício físico como tratamento',
      'key': '',
      'canRead': false,
      'imageName': 'cap3_illustration.png',
    },
    {
      'text': 'Você não está sozinho!',
      'key': '',
      'canRead': false,
      'imageName': 'cap4_illustration.png',
    },
    {
      'text': 'Desmitificando a DLC',
      'key': '',
      'canRead': false,
      'imageName': 'cap5_illustration.png',
    },
    {
      'text': 'Infográfico',
      'key': '',
      'canRead': false,
      'imageName': 'cap6_illustration.png',
    },
  ];  

  getReadCaps() async {
    final SharedPreferences prefs = await _prefs;

    capitulos[1]['canRead'] = prefs.getBool("cap1");
    capitulos[2]['canRead'] = prefs.getBool("cap2");
    capitulos[3]['canRead'] = prefs.getBool("cap3");
    capitulos[4]['canRead'] = prefs.getBool("cap4");
    capitulos[5]['canRead'] = prefs.getBool("cap5");

    setState(() {
      isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    final appState = Provider.of<AppController>(context);
    
    return 
    Observer(
      builder: (_) {
      return
      Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appState.isDarkMode ? Colors.black87 : Colors.white,
          leading: IconButton(
            tooltip: 'Menu',
            icon: Icon(Icons.arrow_back, color: appState.isDarkMode ? Colors.white : Colors.black54),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenuPage()),
              );
            },
          ),
        ),
        body: 
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            
            child:
              isLoading ?
              Center(
                child: CircularProgressIndicator(
                ),
              )
              :
              Container (
                color: appState.isDarkMode ? Colors.black87 : Colors.white70,
                child: 
                ListView(
                  padding: const EdgeInsets.all(20),
                  children: getCaps(context),
                )
              )
              
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
  
  List<Widget> getCaps(context) {
    List listings = new List<Widget>();
    final appState = Provider.of<AppController>(context);
    
    for (var cap in capitulos) {
      listings.add (
        Container(
          height: 140,
          width: MediaQuery.of(context).size.width,
          child: new GestureDetector(
            onTap: () {
              cap['canRead'] == false ?
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
                            'Termine de ver o capitulo anterior',
                            textAlign: TextAlign.center,
                              style: TextStyle (
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
              )
              :
              capitulos.indexOf(cap) == 4 ?
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResponderQuiz()),
                )
              :
              capitulos.indexOf(cap) == 5 ?
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InfograficoPage()),
                )
              :  
                // Navigator.pushAndRemoveUntil(
                //   MaterialPageRoute(builder: (BuildContext context) => CapPage(cap: capitulos.indexOf(cap))),
                //   ModalRoute.withName('/'),
                // );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CapPage(cap: capitulos.indexOf(cap))),
                );
            },
            child: 
              new Row(
              children: <Widget>[
                new Expanded(
                  flex: 3,
                  child: 
                  Container(
                    height: 125,
                    child: new Card(
                      child: 
                        cap['imageName'].length > 1 ?
                          Stack(
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage('assets/caps_illustrations/${cap['imageName']}')
                                ),
                              ),
                              cap['canRead'] == false ?
                              Center(
                                child: Icon(
                                  Icons.lock,
                                  size: 40,
                                  color: Colors.black54,
                                ),
                              )
                              :
                              Text('')
                            ],
                          )
                        : 
                          Text(''),
                      // color: Color.fromRGBO(227, 151, 151, 1),
                      color: Colors.white60,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                  ),
                ),
                new Expanded(
                  flex: 7,
                  child: 
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    height: 110,
                    child: Column(
                      children: <Widget>[
                        Text(
                          cap['text'],
                          textAlign: TextAlign.center,
                          style: TextStyle (
                            color: appState.isDarkMode ? Colors.white70 : Colors.black87,
                            fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble(),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  )
                )
              ],
            ),
          )
        ),
      );
    }
    
    return listings;
  }
}
