import 'package:fisio_app/app/app_controller.dart';
import 'package:fisio_app/app/modules/home/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:fisio_app/custom_icons_icons.dart';
import 'package:rich_alert/rich_alert.dart';

class DiaryPage extends StatefulWidget {
  DiaryPage({Key key}) : super(key: key);

  @override
  _DiaryPageState createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  bool hasSelectedActivites = false;
  bool hasSelectedActivitesTime = false;
  bool hasSelectedActivitesDays = false;

  bool showTimeSelectBtn = false;

  Map<String, bool> activities = {
    'Exercícios aeróbicos\n(caminhada, corrida, bicicleta)': false,
    'Exercícios de fortalecimento\n(musculação, ginástica, funcional)': false,
    'Exercícios na água': false,
  };

  List<Map> selectedActivities = [];
  
  List<Map<String, bool>> activitiesTime = [
    {
      '10 a 25 minutos': false,
      '30 minutos': false,
      '45 minutos': false,
      '60 minutos': false,
    },
    {
      '10 a 25 minutos': false,
      '30 minutos': false,
      '45 minutos': false,
      '60 minutos': false,
    },
    {
      '10 a 25 minutos': false,
      '30 minutos': false,
      '45 minutos': false,
      '60 minutos': false,
    }
  ];

  List<Map<String, bool>> activitiesDays = [
    {
      'Domingo': false,
      'Segunda': false,
      'Terça': false,
      'Quarta': false,
      'Quinta': false,
      'Sexta': false,
      'Sábado': false,
    },
    {
      'Domingo': false,
      'Segunda': false,
      'Terça': false,
      'Quarta': false,
      'Quinta': false,
      'Sexta': false,
      'Sábado': false,
    },
    {
      'Domingo': false,
      'Segunda': false,
      'Terça': false,
      'Quarta': false,
      'Quinta': false,
      'Sexta': false,
      'Sábado': false,
    }
  ];

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppController>(context); 
    
    return 
    Observer(
      builder: (_) {
        return 
        Scaffold(
          backgroundColor: appState.isDarkMode ? Colors.black87 : Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: appState.isDarkMode ? Colors.black87 : Colors.white,
            leading: IconButton(
              tooltip: 'Menu',
              icon: Icon(Icons.arrow_back, color: appState.isDarkMode ? Colors.white : Colors.black54),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: 
          Container (
            color: appState.isDarkMode ? Colors.black87 : Colors.white70,
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.only(bottom: 20),
            child:
            hasSelectedActivites == false ?
              ListView(
                children: <Widget>[
                Container (
                  margin: EdgeInsets.only(bottom: 40),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: 
                  RichText(
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                      style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Color(0xFF36a9b0),
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 3,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'Seja bem vindo ao '),
                        new TextSpan(text: 'Diário de atividade física ', style: new TextStyle(fontWeight: FontWeight.bold, fontFamily: 'MontserratBold')),
                        new TextSpan(text: 'do MoveDor!'),
                      ],
                    ),
                  ),
                ),

                Container (
                  margin: EdgeInsets.only(bottom: 40),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: 
                  RichText(
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                      style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Color(0xFF36a9b0),
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 2,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'Informe abaixo quais tipos de atividades você pretende realizar:'),
                      ],
                    ),
                  ),
                ),

                Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: appState.isDarkMode ? Colors.white70 : Colors.black54,
                  ),
                  child: 
                    Container (
                      margin: EdgeInsets.only(bottom: 20),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(
                        children: 
                        activities.keys.map((String key) {
                          return 
                          CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: Color(0xFF36a9b0),
                            title: 
                            Text(
                              key, 
                              style: TextStyle(
                                fontFamily: 'MontserratRegular',
                                color: appState.isDarkMode ? Colors.white70 : Colors.black54,
                                fontSize: appState.fontSize.toDouble(),
                              ),
                            ),
                            value: activities[key],
                            onChanged: (bool value) {
                              if(value) {
                                setState(() {
                                  selectedActivities.add(
                                   {
                                     "atividade": key,
                                     "tempo": "",
                                     "dias": []
                                   }
                                  );
                                });
                              } else {
                                for (var i = 0; i <= selectedActivities.length; i++) {
                                  if(selectedActivities[i]["atividade"] == key) {
                                    setState(() {
                                      selectedActivities.removeAt(i);
                                    });
                                  }
                                }
                              }
                              setState(() {
                                activities[key] = value;
                              });
                            },
                          );
                        }).toList(),
                      ),
                    ),
                ),

                Center(
                  child: 
                  RaisedButton(
                    onPressed: () {
                      if(selectedActivities.length > 0) {
                        setState(() {
                          hasSelectedActivites = true;
                          showTimeSelectBtn = true;

                          selectedActivities.add({
                            "nextBtn": "",
                            "show": "true"
                          });
                        });
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
                            "Avançar",
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
              ],
            )
            :
            hasSelectedActivitesDays == false ?
              ListView.builder (
                shrinkWrap: true,
                itemCount: selectedActivities.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return
                  showTimeSelectBtn && index == selectedActivities.length - 1 ?
                    Container (
                      margin: EdgeInsets.only(bottom: 30),
                      child: Center(
                        child: 
                        RaisedButton(
                          onPressed: () {
                            setState(() {
                              hasSelectedActivitesDays = true;
                            });
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
                                  "Avançar",
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
                    )
                  :   
                    Container (
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: timeActivitieSelect(index, selectedActivities[index]["atividade"]),
                    );
                }
              )
            : 
              ListView.builder (
                shrinkWrap: true,
                itemCount: selectedActivities.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return
                  showTimeSelectBtn && index == selectedActivities.length - 1 ?
                    Container (
                      margin: EdgeInsets.only(bottom: 30),
                      child: Center(
                        child: 
                        RaisedButton(
                          onPressed: () {
                            setState(() {
                              hasSelectedActivitesDays = true;
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return
                                    RichAlertDialog( 
                                      alertTitle: richTitle(
                                        Text(
                                          "Muito bem!",
                                          textAlign: TextAlign.center,
                                            style: TextStyle (
                                              fontSize: 24,
                                              color: Colors.black87
                                            ),
                                        )
                                      ),
                                      alertSubtitle: richSubtitle(
                                        Text(
                                          'Agora você pode iniciar o seu Diário de Atividades!',
                                          textAlign: TextAlign.center,
                                            style: TextStyle (
                                              fontSize: 18,
                                              color: Colors.black54
                                            ),
                                          )
                                        ),
                                      alertType: RichAlertType.SUCCESS,
                                      dialogIcon: Icon(
                                        Icons.check,
                                        size: 60,
                                        color: Colors.green[300],
                                      ), 
                                      actions: <Widget>[
                                        RaisedButton(
                                          child: Text("OK", style: TextStyle(color: Colors.white),),
                                          color: Colors.green[300],
                                          onPressed: (){ 
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => MenuPage()),
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                }
                              );
                            });
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
                                  "Avançar",
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
                    )
                  :   
                    Container (
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: daysActivitieSelect(index, selectedActivities[index]["atividade"]),
                    );
                }
              )

          ), 

          floatingActionButton: 
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
              ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        );
      }
    );
  }

  Widget timeActivitieSelect(int index, String activitie) {
    final appState = Provider.of<AppController>(context); 

    return 
      Observer(
      builder: (_) {
        return 
        Column(
          children: <Widget>[
          Container (
            margin: EdgeInsets.only(bottom: 40),
            width: MediaQuery.of(context).size.width * 0.8,
            child: 
            RichText(
              textAlign: TextAlign.center,
              text: new TextSpan(
                style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: Color(0xFF36a9b0),
                  fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 3,

                ),
                children: <TextSpan>[
                  new TextSpan(text: 'Por quanto tempo você pretende realizar '),
                  new TextSpan(text: "$activitie?"),
                ],
              ),
            ),
          ),

          Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: appState.isDarkMode ? Colors.white70 : Colors.black54,
            ),
            child: 
              Container (
                margin: EdgeInsets.only(bottom: 20),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: 
                  activitiesTime[index].keys.map((String key) {
                    return 
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Color(0xFF36a9b0),
                      title: 
                      Text(
                        key, 
                        style: TextStyle(
                          fontFamily: 'MontserratRegular',
                          color: appState.isDarkMode ? Colors.white70 : Colors.black54,
                          fontSize: appState.fontSize.toDouble(),
                        ),
                      ),
                      value: activitiesTime[index][key],
                      onChanged: (bool value) {
                        if(value) {
                          activitiesTime[index].forEach((k,v) => {
                            activitiesTime[index][k] = false
                          });

                          setState(() {
                            activitiesTime[index][key] = value;
                            selectedActivities[index]["tempo"] = key;
                          });
                          
                        } else {
                          setState(() {
                            selectedActivities[index]["tempo"] = "";
                          });
                        }

                        print(selectedActivities);
                      },
                    );
                  }).toList(),
                ),
              ),
          ),

          
        ],
      );
    });
  }

  Widget daysActivitieSelect(int index, String activitie) {
    final appState = Provider.of<AppController>(context); 

    return 
      Observer(
      builder: (_) {
        return 
        Column(
          children: <Widget>[
          Container (
            margin: EdgeInsets.only(bottom: 40),
            width: MediaQuery.of(context).size.width * 0.8,
            child: 
            RichText(
              textAlign: TextAlign.center,
              text: new TextSpan(
                style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: Color(0xFF36a9b0),
                  fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 3,

                ),
                children: <TextSpan>[
                  new TextSpan(text: 'Em quais dias da semana você pretende praticar '),
                  new TextSpan(text: "$activitie?"),
                  new TextSpan(text: '\nVocê pode marcar mais de uma opção!', style: TextStyle(fontSize: 15)),

                ],
              ),
            ),
          ),

          Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: appState.isDarkMode ? Colors.white70 : Colors.black54,
            ),
            child: 
              Container (
                margin: EdgeInsets.only(bottom: 20),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: 
                  activitiesDays[index].keys.map((String key) {
                    return 
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Color(0xFF36a9b0),
                      title: 
                      Text(
                        key, 
                        style: TextStyle(
                          fontFamily: 'MontserratRegular',
                          color: appState.isDarkMode ? Colors.white70 : Colors.black54,
                          fontSize: appState.fontSize.toDouble(),
                        ),
                      ),
                      value: activitiesDays[index][key],
                      onChanged: (bool value) {
                        if(value) {
                          setState(() {
                            selectedActivities[index]["dias"].add(key);
                          });
                          activitiesDays[index][key] = true;
                        } 
                        else {
                          var i = selectedActivities[index]["dias"].indexOf(key);
                          setState(() {
                            selectedActivities[i]["dias"].removeAt(i);
                          });
                          activitiesDays[index][key] = false;
                        }
                        print(selectedActivities);
                      },
                    );
                  }).toList(),
                ),
              ),
          ),

          
        ],
      );
    });
  }
}
