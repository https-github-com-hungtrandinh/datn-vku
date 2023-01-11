import 'package:clean_architecture/core/value/app_color.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';

class ItemListPost extends StatelessWidget {
  final String? url;

  const ItemListPost({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20, right: 20, left: 10),
          child: url == null
              ? DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(12),
            padding: const EdgeInsets.all(6),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width * 0.38,
                color: Colors.grey,
              ),
            ),
          )
              : ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: SizedBox(
              height: 250,
              width: MediaQuery.of(context).size.width * 0.38,

            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 5,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.colorF78361,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 10,
                    blurRadius: 15,
                    // changes position of shadow
                  ),
                ]),
            child: Center(
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add, color: Colors.white)),
            ),
          ),
        )
      ],
    );
  }
}
