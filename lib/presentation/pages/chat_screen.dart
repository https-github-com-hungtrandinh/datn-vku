import 'package:clean_architecture/presentation/bloc/chat/chat_bloc.dart';
import 'package:clean_architecture/presentation/bloc/chat/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/left_chat_widget.dart';
import '../widgets/message_text_field.dart';
import '../widgets/right_chat_widget.dart';

class ChatPage extends StatefulWidget {
  static String routeName = '/chat-page';

  const ChatPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              BlocBuilder<ChatBloc,ChatState>(
                builder: (context,state) {
                  return Container(
                    width: 42,
                    height: 42,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image:NetworkImage("https://firebasestorage.googleapis.com/v0/b/inductive-mind-335403.appspot.com/o/images%2Fprofile-picture%2F2I6QK9wzVYeEXGPynZrwJbBkn2u1.jpg?alt=media&token=3686202c-9e0b-4f48-8511-71a8ab075329"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [

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
          ),
        ),
      ),
      bottomSheet: Container(
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
                child: MessageTextFieldWidget(
                  onChanged: (message) {},
                  onSendPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: buildListMessage()),
    );
  }

  Widget buildListMessage() {
    return  ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (_, __) => const SizedBox(height: 24),
                    padding: const EdgeInsets.all(24),
                    itemBuilder: (context, index) => buildItem(
                        context, ),
                    itemCount: 0,
                    reverse: true,

                  );

  }

  Widget buildItem(
      BuildContext context) {
    if (2==1) {
      return RightChatWidget(
        content: const Text("1"),
        time: formatHour(
            DateTime.fromMillisecondsSinceEpoch(111111111)),
      );
    } else {
      return LeftChatWidget(
          profileImage: const NetworkImage("https://firebasestorage.googleapis.com/v0/b/inductive-mind-335403.appspot.com/o/images%2Fprofile-picture%2F2I6QK9wzVYeEXGPynZrwJbBkn2u1.jpg?alt=media&token=3686202c-9e0b-4f48-8511-71a8ab075329"),
          content: const Text("2"),
          time: formatHour(
              DateTime.fromMillisecondsSinceEpoch(111111111)));
    }

  }
}
 String formatHour(DateTime time) {
return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
}

