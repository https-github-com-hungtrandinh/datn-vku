import 'package:clean_architecture/data/models/post.dart';
import 'package:flutter/material.dart';

import '../../core/util/text_utils.dart';

class PostViewWidget extends StatefulWidget {
  final Posts posts;

  const PostViewWidget({Key? key, required this.posts}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PostViewWidgetState();
  }
}

class _PostViewWidgetState extends State<PostViewWidget> {
  final TextUtils _textUtils = TextUtils();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1564564295391-7f24f26f568b"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    _textUtils.bold16("junaidkhan", Colors.white)
                  ],
                ),
                const Icon(
                  Icons.more_vert_rounded,
                  color: Colors.white,
                )
              ],
            ),
          ),
          Image.asset(
            widget.posts.media[0],
            height: 300,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/like.png",
                      color: Colors.white,
                      width: 25,
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Image.asset(
                        "assets/icons/comment.png",
                        color: Colors.white,
                        width: 25,
                        height: 25,
                      ),
                    ),
                    Image.asset(
                      "assets/icons/share.png",
                      color: Colors.white,
                      width: 25,
                      height: 25,
                    ),
                  ],
                ),
                Image.asset(
                  "assets/icons/save.png",
                  color: Colors.white,
                  width: 25,
                  height: 25,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _textUtils.bold14("3,985 views", Colors.white),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    _textUtils.bold14("junaidkhan", Colors.white),
                    const SizedBox(
                      width: 5,
                    ),
                    _textUtils.normal14(
                       widget.posts.content , Colors.white)
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                _textUtils.normal14("View all 6 comments", Colors.grey),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    _textUtils.normal11("12 minutes ago", Colors.grey),
                    const SizedBox(
                      width: 5,
                    ),
                    _textUtils.normal11("See Translation", Colors.white),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}