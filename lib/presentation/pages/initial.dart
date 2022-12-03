import 'package:clean_architecture/presentation/pages/home/home_page.dart';
import 'package:clean_architecture/presentation/pages/home_screen.dart';
import 'package:clean_architecture/presentation/pages/likes_screen.dart';
import 'package:clean_architecture/presentation/pages/main_screen.dart';
import 'package:clean_architecture/presentation/pages/profile/profile_page.dart';
import 'package:clean_architecture/presentation/pages/profile_screen.dart';
import 'package:clean_architecture/presentation/pages/search/search_page.dart';
import 'package:clean_architecture/presentation/pages/search_screen.dart';
import 'package:clean_architecture/presentation/pages/settings/settings_page.dart';
import 'package:flutter/material.dart';

import '../../core/util/text_utils.dart';
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
  final TextUtils _textUtils = TextUtils();
  int _selectedIndex =0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    LikesScreen(),
    ProfileScreen()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar(),
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
  AppBar showAppBar() {
    switch (_selectedIndex) {
      case 0:
        return AppBar(
          backgroundColor: Colors.black,
          elevation: 0.0,
          title: const Text(
            "Instagram",
            style: TextStyle(fontFamily: 'FontSpring', fontSize: 26),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                "assets/icons/messenger.png",
                color: Colors.white,
                width: 25,
                height: 25,
              ),
            )
          ],
        );

      case 1:
      case 3:
        return AppBar(
          toolbarHeight: 0.0,
          backgroundColor: Colors.black,
        );

      case 4:
        return AppBar(
            backgroundColor: Colors.black,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.lock_outline_rounded),
                    const SizedBox(width: 5),
                    _textUtils.bold18("junaidkhan892", Colors.white),
                    const Icon(Icons.keyboard_arrow_down),
                  ],
                ),
                Row(
                  children: [
                    Image.asset("assets/icons/add_post.png", width: 20, height: 20, color: Colors.white),
                    const SizedBox(width: 15),
                    const Icon(Icons.menu)
                  ],
                )
              ],
            ));

      default:
        return AppBar(
          toolbarHeight: 0.0,
        );
    }
  }

}