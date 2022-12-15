import 'package:clean_architecture/core/value/image.dart';
import 'package:clean_architecture/presentation/bloc/home/home_bloc.dart';
import 'package:clean_architecture/presentation/bloc/home/home_event.dart';
import 'package:clean_architecture/presentation/pages/chat_list_screen.dart';
import 'package:clean_architecture/presentation/pages/home_screen.dart';
import 'package:clean_architecture/presentation/pages/profile_screen.dart';
import 'package:clean_architecture/presentation/pages/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class InitialApp extends StatefulWidget {
  const InitialApp({Key? key}) : super(key: key);

  static const initialAppPushName = "/InitialScreen";

  @override
  State<StatefulWidget> createState() {
    return InitialAppState();
  }
}

class InitialAppState extends State<InitialApp> {
  @override
  void initState() {
    context.read<HomeBloc>().add(UpdateLocation());
    super.initState();
  }

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
      backgroundColor: Colors.white,
      appBar: getAppBar(),
      body: Stack(
        children: [
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
      elevation: 1,
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
