import 'package:fisio_app/app/app_controller.dart';
import 'package:fisio_app/app/modules/book/caps_page.dart';
import 'package:fisio_app/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

class CapPage extends StatefulWidget {
  final int cap;
  CapPage({
    int cap
  }) : this.cap = cap;

  @override
  State<StatefulWidget> createState() { 
    return _CapPageState(cap);
  }
}

class _CapPageState extends State<CapPage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  _CapPageState(this.cap);
  final int cap;

  final capitulos = [
    {
      'video': true,
      'title': 'Conceitos Básicos',
      'path_video': 'cap1.mp4',
    },
    {
      'video': false,
      'title': 'Movimento é\n saúde!',
      'path_video': '',
    },
    {
      'video': true,
      'title': 'Exercício físico como tratamento',
      'path_video': 'cap3.mp4',
    },
    {
      'video': false,
      'title': 'Você não está sozinho!',
      'path_video': '',
    },
    {
      'video': false,
      'title': 'Desmitificando a DLC',
      'path_video': '',
    },
  ];

  VideoPlayerController _controller;

  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    if(capitulos[cap]['video']) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
      ]);

      _controller = VideoPlayerController.asset('assets/videos/${capitulos[cap]['path_video']}');

      _controller.addListener(() {
        setState(() {});
      });
      _controller.setLooping(false);
      _controller.initialize().then((_) => setState(() {}));
    }
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppController>(context); 

    return 
    Observer(
      builder: (_) {
      return
      Scaffold(
        backgroundColor: appState.isDarkMode ? Colors.black87 : Colors.white,
        body: 
         ListView(
           children: <Widget>[
              Container(
                color: appState.isDarkMode ? Colors.black87 : Colors.white70,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[ 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: appState.isDarkMode ? Colors.white70 : Colors.black54),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  Container(
                    child: 
                    RichText(
                      textAlign: TextAlign.center,
                      text: 
                      new TextSpan(
                        style: TextStyle(
                          fontFamily: 'MontserratRegular',
                          color: Color(0xFF36a9b0),
                          fontSize: 30
                        ),
                        children: <TextSpan>[
                          new TextSpan(text: capitulos[cap]['title']),
                        ],
                      ),
                    ),
                  ),
                  capitulos[cap]['video'] ?
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            VideoPlayer(_controller),
                            _PlayPauseOverlay(controller: _controller),
                            VideoProgressIndicator(_controller, allowScrubbing: true),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child: 
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  RaisedButton(
                                    onPressed: () async {
                                      final SharedPreferences prefs = await _prefs;
                                      cap == 0 ?
                                        prefs.setBool("cap1", true)
                                      : 
                                      cap == 2 ?
                                        prefs.setBool("cap3", true)
                                      : 
                                      print("");

                                      SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
                                      SystemChrome.setPreferredOrientations([
                                        DeviceOrientation.portraitUp,
                                      ]);

                                      await _controller.pause();

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => CapsPage()),
                                      );

                                      // _con.dispose();
                                      // super.dispose();
                                      
                                      
                                    },
                                    color: Colors.green[300],
                                    elevation: 10,
                                    child:
                                      Text(
                                        "Concluir",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w300
                                        ),
                                      ),
                                  ),
                                 
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  :
                  cap == 1 ? // Capitulo 2
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          RichText(
                            textAlign: TextAlign.center,
                            text: 
                            new TextSpan(
                              style: TextStyle(
                                fontFamily: 'MontserratRegular',
                                color: appState.isDarkMode ? Colors.white70 : Colors.black87,
                                fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 3,
                              ),
                              children: <TextSpan>[
                                new TextSpan(text: "Posso me movimentar mesmo com dor?\n"),
                              ],
                            ),
                          ),

                          RichText(
                            textAlign: TextAlign.center,
                            text: 
                            new TextSpan(
                              style: TextStyle(
                                fontFamily: 'MontserratRegular',
                                color: Color(0xFF36a9b0),
                                fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 3,
                              ),
                              children: <TextSpan>[
                                new TextSpan(text: "Sim, é seguro se movimentar!\n"),
                              ],
                            ),
                          ),
                         
                          RichText(
                            textAlign: TextAlign.center,
                            text: 
                            new TextSpan(
                              style: TextStyle(
                                fontFamily: 'MontserratRegular',
                                color: appState.isDarkMode ? Colors.white70 : Colors.black87,
                                fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble(),
                              ),
                              children: <TextSpan>[
                                new TextSpan(text: 
                                "Se você já sentiu dor ao fazer um determinado movimento, o seu corpo pode guardar esta informação como uma memória ruim associada ao movimento.",
                                ),
                              ],
                            ),
                          ),

                          Container(
                            child: Image(
                              image:  AssetImage('assets/caps_illustrations/cap2-01.png'),
                            )
                          ),

                          RichText(
                            textAlign: TextAlign.center,
                            text: 
                            new TextSpan(
                              style: TextStyle(
                                fontFamily: 'MontserratRegular',
                                color: appState.isDarkMode ? Colors.white70 : Colors.black87,
                                fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble(),
                              ),
                              children: <TextSpan>[
                                new TextSpan(text: 
                                "Em algumas pessoas, essa memória pode levar a comportamentos como evitar um movimento ou atividade, colaborando para a persistência da dor e da incapacidade.",
                                ),
                              ],
                            ),
                          ),
                            
                          Container(
                            child: Image(
                              image:  AssetImage('assets/caps_illustrations/cap2-02.png'),
                            )
                          ),

                          RichText(
                            textAlign: TextAlign.center,
                            text: 
                            new TextSpan(
                              style: TextStyle(
                                fontFamily: 'MontserratRegular',
                                color: Color(0xFF36a9b0),
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                              ),
                              children: <TextSpan>[
                                new TextSpan(text: "O movimento pode romper esse ciclo!\n"),
                              ],
                            ),
                          ),

                          RichText(
                            textAlign: TextAlign.center,
                            text: 
                            new TextSpan(
                              style: TextStyle(
                                fontFamily: 'MontserratRegular',
                                color: appState.isDarkMode ? Colors.white70 : Colors.black87,
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                              ),
                              children: <TextSpan>[
                                new TextSpan(text: "Você não precisa começar pelo movimento mais desafiador!\n"),
                              ],
                            ),
                          ),

                          RichText(
                            textAlign: TextAlign.center,
                            text: 
                            new TextSpan(
                              style: TextStyle(
                                fontFamily: 'MontserratRegular',
                                color: appState.isDarkMode ? Colors.white70 : Colors.black87,
                                fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble(),
                              ),
                              children: <TextSpan>[
                                new TextSpan(text: 
                                  "Inicie por um movimento mais fácil e simples e avance para um mais difícil.\n"
                                ),
                              ],
                            ),
                          ),

                          RichText(
                            textAlign: TextAlign.center,
                            text: 
                            new TextSpan(
                              style: TextStyle(
                                fontFamily: 'MontserratRegular',
                                color: Color(0xFF36a9b0),
                                fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble(),
                              ),
                              children: <TextSpan>[
                                new TextSpan(text: "Vá aos poucos e lembre-se dos limites do seu corpo\n"),
                              ],
                            ),
                          ),
                        
                          
                          RichText(
                            textAlign: TextAlign.center,
                            text: 
                            new TextSpan(
                              style: TextStyle(
                                fontFamily: 'MontserratRegular',
                                color: appState.isDarkMode ? Colors.white70 : Colors.black87,
                                fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble(),
                              ),
                              children: <TextSpan>[
                                new TextSpan(text:
                                  "A dor pode acontecer durante a atividade, mas não deve se manter nem aumentar após sua conclusão.\n"
                                ),
                              ],
                            ),
                          ),

                          RichText(
                            textAlign: TextAlign.center,
                            text: 
                            new TextSpan(
                              style: TextStyle(
                                fontFamily: 'MontserratRegular',
                                color: Color(0xFF36a9b0),
                                fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble(),
                              ),
                              children: <TextSpan>[
                                new TextSpan(text: 
                                  "Ao se sentir seguro, progrida aos poucos, até ganhar confiança para fazer o movimento livremente em toda a sua amplitude.\n"
                                ),
                              ],
                            ),
                          ),
                        
                        ]
                      ),
                    )
                  :
                  cap == 3 ? // Capitulo 4 
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          RichText(
                            textAlign: TextAlign.center,
                            text: 
                            new TextSpan(
                              style: TextStyle(
                                fontFamily: 'MontserratRegular',
                                color: appState.isDarkMode ? Colors.white70 : Colors.black87,
                                fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble(),
                              ),
                              children: <TextSpan>[
                                new TextSpan(text:
                                  "Caso você tenha feito algum tipo de exercício que não o ajudou, isso não significa que o exercício físico não funciona ou não serve para você.\n"
                                ),
                              ],
                            ),
                          ),

                          RichText(
                            textAlign: TextAlign.center,
                            text: 
                            new TextSpan(
                              style: TextStyle(
                                fontFamily: 'MontserratRegular',
                                color: Color(0xFF36a9b0),
                                fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble(),
                              ),
                              children: <TextSpan>[
                                new TextSpan(text:
                                  "Converse com os profissionais de saúde da Unidade Básica de Saúde (UBS) próxima da sua casa e peça orientações sobre as possibilidades de programas de exercícios.\n",
                                ),
                              ],
                            ),
                          ),
                          
                          Container(
                            child: Image(
                              image:  AssetImage('assets/caps_illustrations/cap4-01.png'),
                            )
                          ),

                          RichText(
                            textAlign: TextAlign.center,
                            text: 
                            new TextSpan(
                              style: TextStyle(
                                fontFamily: 'MontserratRegular',
                                color: Color(0xFF36a9b0),
                                fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble(),
                              ),
                              children: <TextSpan>[
                                new TextSpan(text:
                                  "\nExercícios e atividades que promovam o relaxamento e a consciência corporal são importantes para o alívio da dor.\n"
                                ),
                              ],
                            ),
                          ),

                          RichText(
                            textAlign: TextAlign.center,
                            text: 
                            new TextSpan(
                              style: TextStyle(
                                color: appState.isDarkMode ? Colors.white70 : Colors.black87,
                                fontFamily: 'MontserratRegular',
                                fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble(),
                              ),
                              children: <TextSpan>[
                                new TextSpan(text:
                                  "Exercícios de respiração, técnicas de relaxamento e meditação são opções que podem fazer parte do seu dia à dia.\n",
                                ),
                              ],
                            ),
                          ),
                        ]
                      ),
                    )
                  :
                    Container(),

                  capitulos[cap]['video'] == false ?
                    Center(
                    child:
                      Container(
                        margin: EdgeInsets.only(bottom: 80),
                        child: 
                        RaisedButton(
                          onPressed: () async {
                            final SharedPreferences prefs = await _prefs;

                            cap == 1 ? // Capitulo 2
                              prefs.setBool("cap2", true)
                            : 
                            cap == 3 ? // Capitulo 4
                              prefs.setBool("cap4", true)
                            : 
                            print("");

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
                                "Concluir leitura",
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
                      )
                    )
                  :
                    Container()  
                          
                ],
              ),
            ),
          ],
        ),

        floatingActionButton: 
          cap == 0 || cap == 2 ? 
            Container()
          :
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
  
}

class _PlayPauseOverlay extends StatelessWidget {
  const _PlayPauseOverlay({Key key, this.controller}) : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
      ],
    );
  }
}