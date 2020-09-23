import 'package:flutter/material.dart';
import 'package:reboot/components/default_button.dart';
import 'package:reboot/size_config.dart';

import '../../../constants.dart';
import 'profile_items.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);
  
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: 
      Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: 
                Image.asset(
                  "assets/images/Profile Image.png",
                  fit: BoxFit.cover,
                  width: getProportionateScreenWidth(100),
                  height: getProportionateScreenWidth(100),
                ),
            ),
            Text(
              "João Victor",
              style: headingStyle,
            ),
            Text(
              "freitasjoaovictor@gmail.com",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(height: getProportionateScreenHeight(15)),
            ProfileItems(),
            DefaultButton(
              color: Colors.red[300],
              text: "Sair",
              press: () {},
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
          ],
        ),
      ),
    );
  }
}

