import 'dart:developer';

import 'package:clean_architecture/core/value/strings.dart';
import 'package:clean_architecture/data/models/firebase/match.dart';
import 'package:clean_architecture/presentation/bloc/chat/chat_bloc.dart';

import 'package:clean_architecture/presentation/bloc/chat/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/avatar_lable_user.dart';

class ChatsList extends StatefulWidget {
  const ChatsList({Key? key}) : super(key: key);
  static const chatListPushName = "/chatList";

  @override
  State<ChatsList> createState() => _ChatsListState();
}

class _ChatsListState extends State<ChatsList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(builder: (context, state) {
      if (state.loadListMatchStatus == LoadListMatchStatus.loading) {
        return const CircularProgressIndicator();
      } else if (state.loadListMatchStatus == LoadListMatchStatus.error) {
        return const Center(
          child: Text("error"),
        );
      } else if (state.loadListMatchStatus == LoadListMatchStatus.loaded) {
        log("done ${state.allUserMatch.length}");
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.allUserMatch.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // Navigator.pushNamed(
                //   context,
                //   ChatScreen.routeName,
                //   arguments: activeMatches[index],
                // );
              },
              child: Row(
                children: [
                  UserImage.small(
                    margin: const EdgeInsets.only(top: 10, right: 10),
                    height: 70,
                    width: 70,
                    url: state.allUserMatch[index].photoUrl,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.allUserMatch[index].name!,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "1",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: 5),
                      Text(
                      Strings.startChat,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        );
      }
      return Center(
        child: Text("dataaaa"),
      );
    });
  }
}
