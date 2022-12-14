import 'package:clean_architecture/core/value/app_color.dart';
import 'package:clean_architecture/presentation/bloc/authen/auth_bloc.dart';
import 'package:clean_architecture/presentation/bloc/authen/auth_event.dart';
import 'package:clean_architecture/presentation/bloc/authen/auth_state.dart';
import 'package:clean_architecture/presentation/bloc/profile/profile_bloc.dart';
import 'package:clean_architecture/presentation/bloc/profile/profile_event.dart';
import 'package:clean_architecture/presentation/bloc/profile/profile_state.dart';
import 'package:clean_architecture/presentation/pages/wellcome_screen.dart';
import 'package:clean_architecture/presentation/widgets/dot_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../core/value/strings.dart';
import '../../injection.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(sl())..add(GetUserProfile()),
      child: Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.2),
        body: getBody(),
      ),
    );
  }

  Widget getBody() {
    final size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        width: size.width,
        height: size.height * 0.60,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 10,
            blurRadius: 10,
            // changes position of shadow
          ),
        ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
          child:
              BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
            if (state.profileStatus == ProfileStatus.loading) {
              return const Center(child: DotLoading());
            } else if (state.profileStatus == ProfileStatus.loaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 140,
                    height: 140,
                    decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(state.userModel!.photoUrl!),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    state.userModel!.name!,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 10,
                                    blurRadius: 15,
                                    // changes position of shadow
                                  ),
                                ]),
                            child: BlocBuilder<AuthBloc, AuthState>(
                                builder: (context, state) {
                              return IconButton(
                                onPressed: () {
                                  context.read<AuthBloc>().add(LogOut());
                                  Navigator.pushReplacementNamed(
                                      context, WelcomePage.routeName);
                                },
                                icon: Icon(
                                  Icons.settings,
                                  size: 35,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                              );
                            }),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            Strings.settings,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.withOpacity(0.8)),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Container(
                              width: 85,
                              height: 85,
                              child: Stack(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: const LinearGradient(
                                          colors: [
                                            AppColors.primaryOne,
                                            AppColors.primaryTwo
                                          ],
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 10,
                                            blurRadius: 15,
                                            // changes position of shadow
                                          ),
                                        ]),
                                    child: const Icon(
                                      Icons.camera_alt,
                                      size: 45,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 8,
                                    right: 0,
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              spreadRadius: 10,
                                              blurRadius: 15,
                                              // changes position of shadow
                                            ),
                                          ]),
                                      child: const Center(
                                        child:
                                            Icon(Icons.add, color: Colors.grey),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              Strings.upDateAvatar,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.withOpacity(0.8)),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 10,
                                    blurRadius: 15,
                                    // changes position of shadow
                                  ),
                                ]),
                            child: Icon(
                              Icons.edit,
                              size: 35,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            Strings.editProfile,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.withOpacity(0.8)),
                          )
                        ],
                      )
                    ],
                  )
                ],
              );
            }
            return const SizedBox();
          }),
        ),
      ),
    );
  }
}
