import 'package:clean_architecture/core/value/app_color.dart';
import 'package:clean_architecture/presentation/widgets/grid_post_widgets.dart';
import 'package:flutter/material.dart';

import '../../core/value/strings.dart';

class EditTab extends StatefulWidget {
  const EditTab({Key? key}) : super(key: key);

  @override
  State<EditTab> createState() => _EditTabState();
}

class _EditTabState extends State<EditTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffeeeee4),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    Strings.image,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "5 post",
                    style: TextStyle(
                        color: AppColors.colorF54B64,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            const GridPostWidget(),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Text(
                Strings.needAddProfile,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                Strings.yourOpinion,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              color: Colors.white,
              child: TextFormField(
                maxLines: 3,
                maxLength: 400,
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                Strings.interests,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              color: Colors.white,
              child: TextFormField(
                maxLines: 2,
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                Strings.datingPurpose,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              color: Colors.white,
              child: TextFormField(
                maxLines: 2,
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            )
          ],
        ),
      ),
    );
  }
}