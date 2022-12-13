import 'dart:developer';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:clean_architecture/data/models/firebase/user.dart';
import 'package:clean_architecture/presentation/bloc/home/home_bloc.dart';
import 'package:clean_architecture/presentation/bloc/home/home_state.dart';
import 'package:clean_architecture/presentation/widgets/dot_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/value/image.dart';
import '../../injection.dart';

import '../bloc/home/home_event.dart';
import '../widgets/card_swiper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final AppinioSwiperController controller = AppinioSwiperController();


  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<HomeBloc, HomeState>(buildWhen: (oldState, newState) {
      return oldState.allUser != newState.allUser;
    }, builder: (context, state) {
      if (state.loadUserSwiper == LoadUserSwiper.loading) {
        return const DotLoading();
      } else if (state.loadUserSwiper == LoadUserSwiper.loaded) {
        final List<UserModel> userModel = state.allUser;
        return Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                child: AppinioSwiper(
                  threshold: 100,
                  maxAngle: 90,
                  unlimitedUnswipe: true,
                  controller: controller,
                  unswipe: _unSwipe,
                  cards: userModel.map((user) {
                    return CardSwipe(user: user);
                  }).toList(),
                  onSwipe: (int index, AppinioSwiperDirection direction) {
                    log("${state.allUser[index].name}");
                    _swipe(index, direction, uid: state.allUser[index].uid!);
                  },
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: 50,
                    bottom: 40,
                  ),
                )),
            getBottomSheet()
          ],
        );
      }
      return const SizedBox();
    });
  }

  Widget getBottomSheet() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 10,
            ),
            swiperDislike(),
            swiperUnDislike(),
            swiperLike(),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget swiperLike() {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return GestureDetector(
        onTap: () {
          controller.swipeRight();
        },
        child: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 10,
                  // changes position of shadow
                ),
              ]),
          child: SvgPicture.asset(
            ImageSrc.like,
            width: 25,
            height: 25,
            fit: BoxFit.none,
          ),
        ),
      );
    });
  }

  Widget swiperDislike() {
    return GestureDetector(
      onTap: () {
        controller.swipeLeft();
      },
      child: Container(
        width: 55,
        height: 65,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 10,
                // changes position of shadow
              ),
            ]),
        child: SvgPicture.asset(
          ImageSrc.dislike,
          width: 25,
          height: 25,
          fit: BoxFit.none,
        ),
      ),
    );
  }

  Widget swiperUnDislike() {
    return GestureDetector(
      onTap: () {
        controller.unswipe();
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 10,
                // changes position of shadow
              ),
            ]),
        child: SvgPicture.asset(
          ImageSrc.refresh,
          width: 25,
          height: 25,
          fit: BoxFit.none,
        ),
      ),
    );
  }

  void _swipe(int index, AppinioSwiperDirection direction,
      {required String uid}) {
    if (direction.name == "left" || direction.name == "bottom") {
    } else if (direction.name == "right" || direction.name == "top") {
      context.read<HomeBloc>().add(UserLikeEvent(uid));
    }
  }

  void _unSwipe(bool unswiped) {
    if (unswiped) {
      log("SUCCESS: card was unswiped");
    } else {
      log("FAIL: no card left to unswipe");
    }
  }
}
