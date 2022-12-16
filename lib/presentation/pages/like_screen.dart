import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_architecture/presentation/bloc/like/like_bloc.dart';
import 'package:clean_architecture/presentation/bloc/like/like_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/value/app_color.dart';
import '../../core/value/strings.dart';
import '../bloc/like/like_state.dart';

class LikesScreen extends StatefulWidget {
  const LikesScreen({super.key});

  @override
  _LikesPageState createState() => _LikesPageState();
}

class _LikesPageState extends State<LikesScreen> {
  @override
  void initState() {
    context.read<LikeBloc>().add(GetAllIdUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
      bottomSheet: getFooter(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<LikeBloc, LikeState>(builder: (context, state) {
      if (state.likeStatus == LikeStatus.loaded) {
        return ListView(
          padding: const EdgeInsets.only(bottom: 90),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "${state.listIdLike!.uidLiked.length} Likes",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Top Picks",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 0.8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Wrap(
                spacing: 5,
                runSpacing: 5,
                children: List.generate(state.listUser.length, (index) {
                  return SizedBox(
                    width: (size.width - 15) / 2,
                    height: 250,
                    child: Stack(
                      children: [
                        Container(
                          width: (size.width - 15) / 2,
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      (state.listUser[index].photoUrl!)),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          width: (size.width - 15) / 2,
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.25),
                                    Colors.black.withOpacity(0),
                                  ],
                                  end: Alignment.topCenter,
                                  begin: Alignment.bottomCenter)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, bottom: 8),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: (state.listUser[index].status ==
                                                "online")
                                            ? Colors.green
                                            : Colors.grey,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      state.listUser[index].status!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
              ),
            )
          ],
        );
      }
      return const SizedBox();
    });
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 90,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Container(
              width: size.width - 70,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [AppColors.colorF78361, AppColors.colorF54B64],
                ),
              ),
              child: const Center(
                child: Text(
                  Strings.whoLikes,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
