import 'package:flutter/material.dart';

import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Image.asset(
          "assets/images/text_logo.png",
          height: getProportionateScreenHeight(130),
          width: getProportionateScreenWidth(115),
        ),
        Spacer(flex: 2),
        Image.asset(
          image,
          height: getProportionateScreenHeight(300),
          width: getProportionateScreenWidth(270),
        ),
        Text(
          text, 
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
          ),
        ),
      ],
    );
  }
}
