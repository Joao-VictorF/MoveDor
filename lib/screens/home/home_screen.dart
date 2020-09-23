import 'package:flutter/material.dart';
import 'package:reboot/components/bottom_nav.dart';
import 'package:reboot/screens/collection/collection_screen.dart';
import 'package:reboot/screens/favorites/favorites_screen.dart';
import 'package:reboot/screens/profile/profile_screen.dart';

import 'components/body.dart';

class HomeScreen extends StatefulWidget  {
  static String routeName = "/home";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Body(),
      body: PageView(
          controller: _pageController,
          children: <Widget>[
            Body(),
            FavoritesScreen(),
            CollectionScreen(),
            ProfileScreen(),
          ],
          onPageChanged: (page) {
            setState(() {
              _selectedIndex = page;
            });
          },
      ),
      bottomNavigationBar: BottomNav(_selectedIndex, _pageController)
    );
  }
}