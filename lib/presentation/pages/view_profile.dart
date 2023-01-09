import 'package:clean_architecture/data/models/firebase/user.dart';
import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

class ViewProfile extends StatefulWidget {
  static String routeName = '/view-profile';
  final UserModel userModel;

  const ViewProfile({Key? key, required this.userModel}) : super(key: key);

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  final StoryController controller = StoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MoreStories(
        userModel: widget.userModel,
      ),
    );
  }
}

class MoreStories extends StatefulWidget {
  const MoreStories({super.key, required this.userModel});

  final UserModel userModel;

  @override
  _MoreStoriesState createState() => _MoreStoriesState();
}

class _MoreStoriesState extends State<MoreStories> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.userModel.name!,),
      ),
      body: SingleChildScrollView(
        child:Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: StoryView(
                storyItems: [
                  StoryItem.pageImage(
                    imageFit: BoxFit.cover,
                    url: widget.userModel.photoUrl!,
                    controller: storyController,
                  )
                ],
                controller: storyController,
                progressPosition: ProgressPosition.top,
                repeat: false,
              ),
            ),

          ],
        )
      )
    );
  }
}
