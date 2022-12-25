import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_architecture/core/value/image.dart';
import 'package:clean_architecture/data/models/firebase/user.dart';
import 'package:clean_architecture/data/models/firebase/view.dart';
import 'package:clean_architecture/presentation/bloc/home/home_bloc.dart';
import 'package:clean_architecture/presentation/bloc/home/home_event.dart';
import 'package:clean_architecture/presentation/pages/view_profile.dart';
import 'package:clean_architecture/presentation/widgets/dot_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/util/location.dart';
import '../bloc/home/home_state.dart';

class CardSwipe extends StatelessWidget {
  final UserModel user;

  const CardSwipe({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: CupertinoColors.white,
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.systemGrey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            )
          ],
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: user.photoUrl != null
                    ? CachedNetworkImage(
                        imageUrl: user.photoUrl!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                const Center(child: DotLoading()),
                        errorWidget: (context, url, error) {
                          return const Icon(Icons.error);
                        },
                      )
                    : Image.asset(
                        ImageSrc.maleAvatar,
                        fit: BoxFit.fitWidth,
                      ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name ?? "",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        BlocBuilder<HomeBloc, HomeState>(
                            builder: (context, state) {
                          if (state.userData != null) {
                            final distance = calculateDistance(
                                location1: state.userData!.location!,
                                location2: user.location!);
                            return Text(
                              "${distance.toInt()} KM",
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            );
                          }
                          return const SizedBox();
                        }),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          user.major ?? "",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                  _clickView()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _clickView() {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return IconButton(
          onPressed: () {
            context.read<HomeBloc>().add(UserViewEvent(
                userView:
                    UserView(myUidView: state.uid, uidOwenView: [user.uid!])));
            Navigator.pushNamed(context, ViewProfile.routeName);
          },
          icon: const Icon(
            Icons.remove_red_eye_outlined,
            color: Colors.deepOrange,
          ));
    });
  }
}
