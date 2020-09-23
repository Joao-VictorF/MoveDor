import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../constants.dart';

class BottomNav extends StatefulWidget {
  int index;
  final PageController _pageController;
  BottomNav(this.index, this._pageController);
  
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  Color _getTabBackgroundColor () {
    Color color;
    switch (widget.index) {
      case 0:
        color = Color.fromRGBO(133, 102, 235, 1);
        break;
      case 1:
        color = Colors.red[300];
        break;
      case 2:
        color = kPrimaryColor;
        break;
      case 3:
        color = Colors.green[300];
    }

    return color;
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
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              duration: Duration(milliseconds: 800),
              tabBackgroundColor: _getTabBackgroundColor(),
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Inicio',
                ),
                GButton(
                  icon: LineIcons.heart_o,
                  text: 'Favoritos',
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
              selectedIndex: widget.index,
              onTabChange: (index) {
                if(widget.index != index) {
                  setState(() {
                    widget.index = index;
                  });

                  widget._pageController.jumpToPage(index);
                  
                }
              }
            ),
          ),
        ),
      );
  }
}