import 'package:flutter/material.dart';
import 'package:movedor/models/Chapter.dart';

import 'components/custom_app_bar.dart';

class Chapter06Quiz extends StatefulWidget {
  static String routeName = "/chapter-06";
  @override
  _Chapter06QuizState createState() => _Chapter06QuizState();
}

class _Chapter06QuizState extends State<Chapter06Quiz> {
  Size mediaSize;
  String aux;
  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    String nivelDor = "Falsa";
    return Scaffold(
        backgroundColor: Color(0xFFF5F6F9),
        appBar: CustomAppBar(chapters[5]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text("É fácil de machucar as suas costas?",
                      style: TextStyle(
                        fontSize: 24,
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              componentForms(context, "Falsa", nivelDor),
              componentForms(context, "Possivelmente Falsa", nivelDor),
              componentForms(context, "Incerto", nivelDor),
              componentForms(context, "Possivelmente Verdadeira", nivelDor),
              componentForms(context, "Verdadeira", nivelDor),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                      "Se você não for cuidadoso, você pode machucar suas costas?",
                      style: TextStyle(
                        fontSize: 24,
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              componentForms(context, "Falsa", nivelDor),
              componentForms(context, "Possivelmente Falsa", nivelDor),
              componentForms(context, "Incerto", nivelDor),
              componentForms(context, "Possivelmente Verdadeira", nivelDor),
              componentForms(context, "Verdadeira", nivelDor),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                      "Dor nas costas significa que você lesionou nas costas?",
                      style: TextStyle(
                        fontSize: 24,
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              componentForms(context, "Falsa", nivelDor),
              componentForms(context, "Possivelmente Falsa", nivelDor),
              componentForms(context, "Incerto", nivelDor),
              componentForms(context, "Possivelmente Verdadeira", nivelDor),
              componentForms(context, "Verdadeira", nivelDor),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                      "Uma 'fisgadinha' nas costas pode ser o primeiro sinal de uma lesão séria?",
                      style: TextStyle(
                        fontSize: 24,
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              componentForms(context, "Falsa", nivelDor),
              componentForms(context, "Possivelmente Falsa", nivelDor),
              componentForms(context, "Incerto", nivelDor),
              componentForms(context, "Possivelmente Verdadeira", nivelDor),
              componentForms(context, "Verdadeira", nivelDor),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                      "Se você tem dor nas costas, você deve evitar exercícios físicos?",
                      style: TextStyle(
                        fontSize: 24,
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              componentForms(context, "Falsa", nivelDor),
              componentForms(context, "Possivelmente Falsa", nivelDor),
              componentForms(context, "Incerto", nivelDor),
              componentForms(context, "Possivelmente Verdadeira", nivelDor),
              componentForms(context, "Verdadeira", nivelDor),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                      "Se você tem dor nas costas, você deveria se manter ativo?",
                      style: TextStyle(
                        fontSize: 24,
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              componentForms(context, "Falsa", nivelDor),
              componentForms(context, "Possivelmente Falsa", nivelDor),
              componentForms(context, "Incerto", nivelDor),
              componentForms(context, "Possivelmente Verdadeira", nivelDor),
              componentForms(context, "Verdadeira", nivelDor),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                      "Focar em outras coisas que não sejam as suas costas ajuda você a recuperar-se de dor nas costas?",
                      style: TextStyle(
                        fontSize: 24,
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              componentForms(context, "Falsa", nivelDor),
              componentForms(context, "Possivelmente Falsa", nivelDor),
              componentForms(context, "Incerto", nivelDor),
              componentForms(context, "Possivelmente Verdadeira", nivelDor),
              componentForms(context, "Verdadeira", nivelDor),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                      "Ter a expectativa de que sua dor nas costas vai melhorar, ajuda você à recuperar-se de dor nas costas?",
                      style: TextStyle(
                        fontSize: 24,
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              componentForms(context, "Falsa", nivelDor),
              componentForms(context, "Possivelmente Falsa", nivelDor),
              componentForms(context, "Incerto", nivelDor),
              componentForms(context, "Possivelmente Verdadeira", nivelDor),
              componentForms(context, "Verdadeira", nivelDor),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                      "Uma vez que você tenha tido dor nas costas, sempre existirá uma fraqueza?",
                      style: TextStyle(
                        fontSize: 24,
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              componentForms(context, "Falsa", nivelDor),
              componentForms(context, "Possivelmente Falsa", nivelDor),
              componentForms(context, "Incerto", nivelDor),
              componentForms(context, "Possivelmente Verdadeira", nivelDor),
              componentForms(context, "Verdadeira", nivelDor),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                      "Existe uma grande chance de que um episódio de dor nas costas não se resolverá?",
                      style: TextStyle(
                        fontSize: 24,
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              componentForms(context, "Falsa", nivelDor),
              componentForms(context, "Possivelmente Falsa", nivelDor),
              componentForms(context, "Incerto", nivelDor),
              componentForms(context, "Possivelmente Verdadeira", nivelDor),
              componentForms(context, "Verdadeira", nivelDor),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }

  componentForms(BuildContext context, String label, String value) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.blue[200]),
                borderRadius: BorderRadius.circular(5),
              ),
              child: aux == value
                  ? Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xffa9d6c2), Color(0xff36a9b0)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ))
                  : Container(
                      height: 30,
                      width: 30,
                    ),
            ),
            onTap: () {
              setState(() {
                aux = value;
              });
            },
          ),
          Container(
            margin: EdgeInsets.only(
                left: mediaSize.width * 0.03, top: mediaSize.height * 0.007),
            child: Text(label,
                style: TextStyle(
                  fontSize: mediaSize.width * 0.05,
                  color: Color(0xff36a9b0),
                )),
          )
        ],
      ),
    );
  }
}
