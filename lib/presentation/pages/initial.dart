import 'package:clean_architecture/presentation/pages/home/home_page.dart';
import 'package:clean_architecture/presentation/pages/profile/profile_page.dart';
import 'package:clean_architecture/presentation/pages/search/search_page.dart';
import 'package:clean_architecture/presentation/pages/settings/settings_page.dart';
import 'package:flutter/material.dart';

import '../../core/value/app_color.dart';

class InitialApp extends StatefulWidget{
  const InitialApp({Key? key}) : super(key: key);

  static const initialAppPushName="/InitialScreen";

  @override
  State<StatefulWidget> createState() {
    return InitialAppState();
  }

}
class InitialAppState extends State<InitialApp>{
  int _selectedIndex =0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    SettingPage(),
    ProfilePage()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type:  BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items:const <BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Icon(Icons.image,color: Colors.white),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search,color: Colors.white,),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.add_box,color: Colors.white,),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person_pin,color: Colors.white,),label: ""),

        ],
        backgroundColor: AppColors.bgNav,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

}