import 'package:flutter/material.dart';
import 'package:movedor/components/default_button.dart';
import 'package:movedor/models/Chapter.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'components/custom_app_bar.dart';
import 'components/top_rounded_container.dart';

class Chapter00 extends StatefulWidget {
  static String routeName = "/chapter-00";
  @override
  _Chapter00State createState() => _Chapter00State();
}

class _Chapter00State extends State<Chapter00> {
  String nivelDor = "Muita dor";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF5F6F9),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text("Como está o seu nível de dor?",
                    style: TextStyle(
                      fontSize: 24,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              componentForms(context, "Muita dor", nivelDor),
              componentForms(context, "Média dor", nivelDor),
              componentForms(context, "Pouca dor", nivelDor),
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
              child: value == label
                  ? Icon(
                      Icons.check,
                      size: 30,
                      color: Colors.black,
                    )
                  : Container(
                      height: 30,
                      width: 30,
                    ),
            ),
            onTap: () {
              setState(() {
                value = label;
              });
            },
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(label,
                style: TextStyle(
                  fontSize: 20,
                )),
          )
        ],
      ),
    );
  }
}
