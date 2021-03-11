import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movedor/controllers/main_controller.dart';
import 'package:movedor/models/Chapter.dart';
import 'components/custom_app_bar.dart';

class Chapter06 extends StatefulWidget {
  static String routeName = "/chapter-01";
  @override
  _Chapter06State createState() => _Chapter06State();
}

class _Chapter06State extends State<Chapter06> {
  bool aux;
  Size mediaSize;
  MainController controller = MainController();
  TextEditingController textController;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(chapters[0]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: mediaSize.height * 0.05,
              ),
              child: Text("Você faz uso de algum \n       medicamento?",
                  style: TextStyle(
                    color: Color(0xff36a9b0),
                    fontSize: mediaSize.width * 0.07,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: mediaSize.width * 0.35, top: mediaSize.height * 0.03),
              child: Column(
                children: [
                  componentFormsMedication(context, "Sim", true, controller),
                  componentFormsMedication(context, "Não", false, controller),
                ],
              ),
            ),
            controller.medication
                ? Container(
                    margin: EdgeInsets.only(top: mediaSize.height * 0.04),
                    child: Text("Qual/Quais?",
                        style: TextStyle(
                          color: Color(0xff36a9b0),
                          fontSize: mediaSize.width * 0.05,
                        )),
                  )
                : Container(),
            controller.medication
                ? Container(
                    margin: EdgeInsets.only(top: mediaSize.height * 0.04),
                    width: mediaSize.width * 0.7,
                    child: TextField(
                      controller: textController,
                      minLines: 2,
                      maxLines: 5,
                      onChanged: (value) {
                        controller.nameMedications = value;
                      },
                    ))
                : Container(),
            Container(
              margin: EdgeInsets.only(top: mediaSize.height * 0.1),
              child: RaisedButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xffa9d6c2), Color(0xff36a9b0)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "CONTINUAR",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'MontserratRegular',
                          fontSize: mediaSize.width * 0.09,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  componentFormsMedication(BuildContext context, String label, bool value,
      MainController controller) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Color(0xff36a9b0)),
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
                controller.changedMedication(value);
                aux = controller.medication;
                print(controller.medication);
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
