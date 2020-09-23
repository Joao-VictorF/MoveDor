import 'package:flutter/material.dart';

import 'components/body.dart';

class FavoritesScreen extends StatelessWidget {
  static String routeName = "/collection";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text("Favoritos"),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
