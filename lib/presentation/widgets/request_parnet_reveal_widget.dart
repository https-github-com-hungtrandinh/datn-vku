
import 'package:flutter/material.dart';


class RequestPartnerRevealWidget extends StatelessWidget {
  const RequestPartnerRevealWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 300,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
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
            children: [
              const Icon(
                Icons.check,
                color: Color(0xFFA989FF),
                size: 32,
              ),
              const SizedBox(width: 16),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(width: 8),
                  Text(
                    'Your request has been\nsent',

                  ),
                  SizedBox(height: 4),
                  Text(
                    'Wait for your partner to accept',

                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
