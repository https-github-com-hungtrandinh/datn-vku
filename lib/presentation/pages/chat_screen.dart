import 'dart:developer';
import 'package:clean_architecture/data/models/firebase/messages.dart';
import 'package:clean_architecture/presentation/bloc/chat/chat_bloc.dart';
import 'package:clean_architecture/presentation/bloc/chat/chat_event.dart';
import 'package:clean_architecture/presentation/bloc/chat/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/util/format_time.dart';
import '../widgets/left_chat_widget.dart';
import '../widgets/message_text_field.dart';
import '../widgets/right_chat_widget.dart';

class ChatScreen extends StatefulWidget {
  static String routeName = '/chat-page';
  final int index;

  const ChatScreen({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      bottomSheet: buildBottomSheet(),
      body: Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: buildListMessage()),
    );
  }

  Widget buildListMessage() {
    return BlocBuilder<ChatBloc, ChatState>(builder: (context, state) {
      return ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (_, __) => const SizedBox(height: 24),
        padding: const EdgeInsets.all(24),
        itemBuilder: (context, index) => buildItem(index: index),
        itemCount: state.listMessage.length,
        reverse: true,
      );
    });
  }

  Widget buildItem({required int index}) {
    return BlocBuilder<ChatBloc, ChatState>(builder: (context, state) {
      if (state.listMessage[index].senderId == state.uid) {
        return RightChatWidget(
            content: Text(state.listMessage[index].message),
            time: formatDate(state.listMessage[index].dateTime));
      } else {
        return LeftChatWidget(
            profileImage:
                NetworkImage(state.allUserMatch[widget.index].photoUrl!),
            content: Text(state.listMessage[index].message),
            time: formatDate(state.listMessage[index].dateTime));
      }
    });
  }

  Widget buildBottomSheet() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF8F8F8F).withOpacity(0.15),
            offset: const Offset(0, -4),
            blurRadius: 27,
          ),
        ],
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 100,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                  color: Color(0xFFF4F4F4), shape: BoxShape.circle),
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.image),
                color: const Color(0xFFA6A6A6),
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child:
                  BlocBuilder<ChatBloc, ChatState>(builder: (context, state) {
                final List<String> receiverId =
                    state.listChat[widget.index].userIds;
                var receiver = receiverId.where((element) {
                  return element != state.uid;
                });
                log("${receiver.first} ${state.uid}");
                return MessageTextFieldWidget(
                  textEditingController: textEditingController,
                  onChanged: (message) {
                    context.read<ChatBloc>().add(ChangedMessage(message));
                  },
                  onSendPressed: () {
                    context.read<ChatBloc>().add(SeenMessageEvent(
                        chat: state.listChat[widget.index],
                        message: Message(
                          senderId: state.uid,
                          receiverId: receiver.first,
                          message: state.message,
                          dateTime: DateTime.now(),
                        ),
                        groupChatId: state.listChat[widget.index].chatId));
                    textEditingController.clear();
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: Container(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: 16,
          top: MediaQuery.of(context).padding.top + 16,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF8F8F8F).withOpacity(0.15),
              offset: const Offset(0, 4),
              blurRadius: 27,
            ),
          ],
        ),
        child: BlocBuilder<ChatBloc, ChatState>(builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                        state.allUserMatch[widget.index].photoUrl!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.allUserMatch[widget.index].name!,
                    style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              // Icon(Icons.more_vert),
              Expanded(child: Container()),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          );
        }),
      ),
    );
  }
}
