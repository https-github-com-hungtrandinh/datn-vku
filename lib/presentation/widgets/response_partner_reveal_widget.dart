
import 'package:flutter/material.dart';

import '../../core/util/glow_button.dart';
import '../../core/value/app_color.dart';


class ResponsePartnerRevealWidget extends StatelessWidget {
  final VoidCallback onTap;
  const ResponsePartnerRevealWidget({
    Key? key,
    required this.onTap,
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 8),
              Text(
                'Your partner ask to reveal identity',

              ),
              const SizedBox(height: 4),
              Text(
                'Ignore to decline',

              ),
              const SizedBox(height: 16),
              GlowButtonWidget(
                height: 50,
                width: double.infinity,
                backgroundColor: const Color(0xFFA989FF),
                glowColor: AppColors.kPrimaryPurple[100]!,
                glowOffset: const Offset(0, 6),
                borderRadius: 12,
                blurRadius: 22,
                onPressed: onTap,
                child: Center(
                  child: Text(
                    "Accept",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
