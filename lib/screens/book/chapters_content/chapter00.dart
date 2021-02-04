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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF5F6F9),
        // appBar: CustomAppBar(chapters[0]),
        body: SingleChildScrollView(
          child: Column(),
        ));
  }
}
