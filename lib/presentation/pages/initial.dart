import 'package:clean_architecture/presentation/pages/home_screen.dart';
import 'package:clean_architecture/presentation/pages/likes_screen.dart';
import 'package:clean_architecture/presentation/pages/profile_screen.dart';
import 'package:clean_architecture/presentation/pages/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/util/text_utils.dart';

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
      appBar: getAppBar(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }

  AppBar getAppBar() {
    List bottomItems = [
      _selectedIndex == 0
          ? "assets/images/explore_active_icon.svg"
          : "assets/images/explore_icon.svg",
      _selectedIndex == 1
          ? "assets/images/likes_active_icon.svg"
          : "assets/images/likes_icon.svg",
      _selectedIndex == 2
          ? "assets/images/chat_active_icon.svg"
          : "assets/images/chat_icon.svg",
      _selectedIndex == 3
          ? "assets/images/account_active_icon.svg"
          : "assets/images/account_icon.svg",
    ];
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomItems.length, (index) {
            return IconButton(
              onPressed: () {
                _onItemTapped(index);
              },
              icon: SvgPicture.asset(
                bottomItems[index],
              ),
            );
          }),
        ),
      ),
    );
  }

}