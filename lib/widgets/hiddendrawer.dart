// import 'package:diss_app/pages/aboutUs.dart';
// import 'package:diss_app/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
// import 'package:diss_app/pages/map.dart';
import 'package:app2/pages/home.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({Key? key}) : super(key: key);

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];
  //styling fonts for drawer
  final nameTextStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  @override
  void initState() {
    super.initState();
    //list containing screens for the drawer
    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Home',
          baseStyle: nameTextStyle,
          selectedStyle: nameTextStyle,
        ),
        HomePage(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      screens: _pages,
      backgroundColorMenu: Colors.blue,
      slidePercent: 55,
      verticalScalePercent: 90,

      initPositionSelected: 0, //makes landing page the home page
    );
  }
}
