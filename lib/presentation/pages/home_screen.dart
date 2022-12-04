import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../core/util/button_state_custom.dart';
import '../bloc/swiper/swiper_custom.dart';
import '../widgets/swiper_custom_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          alignment: Alignment.center,
          padding:
              const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 10),
          child: buildCard()),
    );
  }

  Widget getBottomSheet(
      {required bool isDislike,
      required bool isLike,
      required bool isSuperLike}) {
    var size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: 120,
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buttonAction(
                  color: Colors.white,
                  colorFocus: Colors.red,
                  icon: Icons.clear,
                  size: 30,
                  state: isDislike,
                ),
                buttonAction(
                  color: Colors.white,
                  colorFocus: Colors.blueAccent,
                  icon: Icons.star,
                  size: 20,
                  state: isSuperLike,
                ),
                buttonAction(
                  color: Colors.white,
                  colorFocus: Colors.tealAccent,
                  icon: Icons.favorite,
                  size: 30,
                  state: isLike,
                ),
              ],
            )));
  }

  Widget buildCard() {
    final provider = context.watch<CardProvider>();
    final images = provider.urlImages;
    final status = provider.getStatus();
    final isLike = status == CardStatus.like;
    final isDislike = status == CardStatus.dislike;
    final isSuperLike = status == CardStatus.superLike;
    return images.isEmpty
        ? Center(
            child: TextButton(
              onPressed: () {
                provider.resetUsers();
              },
              child: const Text("reset"),
            ),
          )
        : Column(
            children: [
              Expanded(
                flex: 8,
                child: Stack(
                  children: images
                      .map((urlImages) => TinderCard(
                          urlImages: urlImages,
                          isFont: images.last == urlImages))
                      .toList(),
                ),
              ),
              getBottomSheet(
                  isDislike: isDislike,
                  isLike: isLike,
                  isSuperLike: isSuperLike)
            ],
          );
  }
}
