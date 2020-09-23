import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:reboot/constants.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: BottomNav(0),
    );
  }
}

class BottomNav extends StatefulWidget {
  final int index;
  BottomNav(this.index);
  
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex;

  void initState() {
    _selectedIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
      ]),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            gap: 8,
            activeColor: Colors.white,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            duration: Duration(milliseconds: 800),
            tabBackgroundColor: kPrimaryColor,
            tabs: [
              GButton(
                icon: LineIcons.home,
                text: 'Inicio',
              ),
              GButton(
                icon: LineIcons.archive,
                text: 'Coleção',
              ),
              GButton(
                icon: LineIcons.user,
                text: 'João',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              if(_selectedIndex != index) {
                print("diferente");
              }
            }
          ),
        ),
      ),
    );
  }

  
}