import 'package:fisio_app/app/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:fisio_app/custom_icons_icons.dart';

class About extends StatefulWidget {
  About({Key key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {

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
              tooltip: 'Voltar',
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
                        new TextSpan(text: 'SOBRE', style: new TextStyle(fontWeight: FontWeight.bold, fontFamily: 'MontserratBold')),
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
                        new TextSpan(text: 'Olá! Nós somos o MOVEDOR! Um aplicativo gratuito com o objetivo de trazer educação em saúde com o tema Dor Lombar Crônica! O conteúdo do MOVEDOR é baseado em um estudo científico para desenvolvimento de material educativo para pessoas com dor lombar crônica.'),
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
                        new TextSpan(text: 'Somos fruto do trabalho conjunto de várias pessoas, que se dedicaram com muito carinho para trazer o melhor para você! Esta é uma parceria do Projeto MOVIMENTO, do Departamento de Fisioterapia da Universidade Federal do Ceará em parceria com alunos e professores do Instituto Federal do Ceará!'),
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
                        new TextSpan(text: 'Esse projeto foi desenvolvido por:'),
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
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 3,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'Conteúdo: ', style: new TextStyle(fontWeight: FontWeight.bold, fontFamily: 'MontserratBold')),
                        new TextSpan(text: 'Ana Carla Lima Nunes e Fabianna Moraleida.'),
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
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 3,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'Roteiro e funcionalidades: ', style: new TextStyle(fontWeight: FontWeight.bold, fontFamily: 'MontserratBold')),
                        new TextSpan(text: 'Ana Carla Lima Nunes, Fabianna Moraleida, Ana Ellen Nascimento e Mardeson Herculano Acácio.'),
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
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 3,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'Design e vídeos: ', style: new TextStyle(fontWeight: FontWeight.bold, fontFamily: 'MontserratBold')),
                        new TextSpan(text: 'Mardeson Herculano Acácio e '),
                        new TextSpan(text: 'Vanessa Soares Mota Vieira.'),
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
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 3,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'Narração: ', style: new TextStyle(fontWeight: FontWeight.bold, fontFamily: 'MontserratBold')),
                        new TextSpan(text: 'Mardeson Herculano Acácio e Anna Larissa Sena Gonçalves.'),
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
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 3,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'Edição de som: ', style: new TextStyle(fontWeight: FontWeight.bold, fontFamily: 'MontserratBold')),
                        new TextSpan(text: 'Johnnie Brian Santos da Costa.'),
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
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 3,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'Programação: ', style: new TextStyle(fontWeight: FontWeight.bold, fontFamily: 'MontserratBold')),
                        new TextSpan(text: 'João Victor Freitas R. De Sousa, Isaac Gondim Geraldo e César Olavo.'),
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
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 3,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'Infográfico: ', style: new TextStyle(fontWeight: FontWeight.bold, fontFamily: 'MontserratBold')),
                        new TextSpan(text: 'Ana Eloise Ferreira Neves, Andreza Deyse Leal de Sousa, Alice Fortes Pereira, Arthur Anthunes Rangel da Silva, Isaac Santos Félix, Narciso Ferreira de Menezes Filho e Mardeson Herculano Acácio.'),
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
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 3,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'Revisão: ', style: new TextStyle(fontWeight: FontWeight.bold, fontFamily: 'MontserratBold')),
                        new TextSpan(text: 'Ana Carla Lima Nunes'),
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
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 3,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'Imagens e sons adicionais: ', style: new TextStyle(fontWeight: FontWeight.bold, fontFamily: 'MontserratBold')),
                        new TextSpan(text: 'Freepik (www.freepik.com) e Bensound (www.bensound.com)'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
}