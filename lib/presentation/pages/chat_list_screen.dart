import 'dart:developer';
import 'package:clean_architecture/core/value/strings.dart';
import 'package:clean_architecture/data/models/firebase/chat_user.dart';
import 'package:clean_architecture/presentation/bloc/chat/chat_bloc.dart';
import 'package:clean_architecture/presentation/bloc/chat/chat_state.dart';
import 'package:clean_architecture/presentation/pages/chat_screen.dart';
import 'package:clean_architecture/presentation/widgets/dot_loading.dart';
import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/value/image.dart';
import '../../data/models/firebase/chat.dart';
import '../bloc/chat/chat_event.dart';
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
    context.read<ChatBloc>()
      ..add(GetAllMatch())
      ..add(GetAllChat());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(builder: (context, state) {
      if (state.loadListMatchStatus == LoadListMatchStatus.loading) {
        return const Center(child: DotLoading());
      } else if (state.loadListMatchStatus == LoadListMatchStatus.error) {
        return const Center(
          child: Text(Strings.error),
        );
      } else if (state.loadListMatchStatus == LoadListMatchStatus.loaded) {
        if (state.allUserMatch.isEmpty) {
          return Center(
            child: Image.asset(
              ImageSrc.noMessage,
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
          );
        }
        return Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 100,
              child: ListView.builder(
                  itemCount: state.allUserMatch.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Center(
                              child: DashedCircle(
                                color: Colors.deepOrangeAccent,
                                child: Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: CircleAvatar(
                                    radius: 45,
                                    backgroundImage: NetworkImage(state.allUserMatch[index].user.photoUrl!),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          state.allUserMatch[index].user.name!,
                          style: GoogleFonts.aBeeZee(
                              fontSize: 13, color: Colors.black54),
                        )
                      ],
                    );
                  }),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.allUserMatch.length,
                itemBuilder: (context, index) {
                  final List<ChatUser> listChat = [];
                  for (var chat in state.listChat) {
                    var chatData = state.allUserMatch.where(
                        (element) => element.match.chatId == chat.chatId);
                    listChat.addAll(chatData);
                  }
                  return InkWell(
                    onTap: () {
                      context.read<ChatBloc>().add(GetAllMessage(
                          groupChatId: listChat[index].match.chatId));
                      Navigator.pushNamed(
                        context,
                        ChatScreen.routeName,
                        arguments: index,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UserImage.small(
                            margin: const EdgeInsets.only(top: 10, right: 10),
                            height: 70,
                            width: 70,
                            url: listChat[index].user.photoUrl,
                          ),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  listChat[index].user.name!,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black),
                                ),
                                Text(
                                    listChat.isNotEmpty
                                        ? state.listChat[index].lastMessage ??
                                            Strings.startChat
                                        : Strings.startChat,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                    overflow: TextOverflow.ellipsis),
                                const SizedBox(height: 10),
                                const Divider(
                                  height: 1,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }
      return const Center(
        child: Text("data"),
      );
    });
  }
}
