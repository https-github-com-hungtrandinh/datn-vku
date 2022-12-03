import 'package:clean_architecture/presentation/bloc/post/post_bloc.dart';
import 'package:clean_architecture/presentation/bloc/post/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/util/text_utils.dart';
import '../widgets/post_view_widget.dart';
import '../widgets/story_view_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final TextUtils _textUtils = TextUtils();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 10, right: 10),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < 20; i++)
                  Container(
                    width: 70,
                    margin: const EdgeInsets.only(right: 15),
                    child: Column(
                      children: [
                        const StoryViewWidget(),
                        const SizedBox(
                          height: 10,
                        ),
                        _textUtils.normal14Ellipsis(
                            "proglabsofficial", Colors.white)
                      ],
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<PostBloc, PostState>(builder: (context, state) {
            if (state.loadAllPostStatus == LoadAllPostStatus.loaded) {
              return ListView.builder(
                  itemCount: state.postAll!.posts.length,
                  itemBuilder: (context, index) {
                    return PostViewWidget(
                      posts: state.postAll!.posts[index],
                    );
                  });
            } else if (state.loadAllPostStatus == LoadAllPostStatus.loading) {
              return const Center(
                  child: CircularProgressIndicator(color: Colors.white));
            }
            return Center();
          })
        ],
      ),
    );
  }
}
