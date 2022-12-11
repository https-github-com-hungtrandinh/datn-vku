import 'package:clean_architecture/core/value/image.dart';
import 'package:clean_architecture/presentation/pages/chat_list_screen.dart';
import 'package:clean_architecture/presentation/pages/home_screen.dart';
import 'package:clean_architecture/presentation/pages/likes_screen.dart';
import 'package:clean_architecture/presentation/pages/profile_screen.dart';
import 'package:clean_architecture/presentation/pages/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/util/text_utils.dart';
import '../../core/value/app_color.dart';

class InitialApp extends StatefulWidget {
  const InitialApp({Key? key}) : super(key: key);

  static const initialAppPushName = "/InitialScreen";

  @override
  State<StatefulWidget> createState() {
    return InitialAppState();
  }
}

class InitialAppState extends State<InitialApp> {
  final TextUtils _textUtils = TextUtils();
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    ChatsList(),
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
      backgroundColor: AppColors.kPrimaryPink[100],
      appBar: getAppBar(),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.colorC4B1F8,
                  AppColors.colorFDB1D5,
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
          ),
          Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ],
      ),
    );
  }

  AppBar getAppBar() {
    List bottomItems = [
      _selectedIndex == 0 ? ImageSrc.exploreActive : ImageSrc.explore,
      _selectedIndex == 1 ? ImageSrc.likeIconActive : ImageSrc.likeIcon,
      _selectedIndex == 2 ? ImageSrc.chatActive : ImageSrc.chat,
      _selectedIndex == 3 ? ImageSrc.accountActive : ImageSrc.account,
    ];
    return AppBar(
      automaticallyImplyLeading: false,
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
