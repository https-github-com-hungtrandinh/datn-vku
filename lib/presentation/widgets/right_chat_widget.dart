import 'package:flutter/material.dart';

class RightChatWidget extends StatelessWidget {
  final Widget content;
  final String time;

  const RightChatWidget({
    Key? key,
    required this.content,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.6,
            ),
            child: Container(
              padding: const EdgeInsets.only(bottom: 8, top: 16, left: 16, right: 16),
              decoration: BoxDecoration(
                color: Color(0xFFDED6F4),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF8F8F8F).withOpacity(0.15),
                    offset: const Offset(0, 4),
                    blurRadius: 27,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  content,
                  const SizedBox(height: 4),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      time,
                      style: const TextStyle(
                        color: Color(0xFF737373),
                        fontSize: 9,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
