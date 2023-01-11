import 'package:clean_architecture/data/models/firebase/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

import '../../core/util/location.dart';
import '../../core/value/strings.dart';

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
    final distance = calculateDistance(
        location1: widget.userModel.location!,
        location2: widget.userModel.location!);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: Row(
            children: [
              Text("${widget.userModel.name!} ,",
                  style: GoogleFonts.aBeeZee(fontSize: 24)),
              const SizedBox(width: 10,),
              Text("${DateTime.now().year -widget.userModel.birthday!.year} YearOld",
                  style: GoogleFonts.aBeeZee(fontSize: 18))
            ],
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 70,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                Strings.location,
                style: GoogleFonts.aBeeZee(
                  textStyle:
                      const TextStyle(color: Colors.black54, fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              child: Row(
                children: [
                  Text(
                    "${distance.toInt()} KM",
                    style: GoogleFonts.aBeeZee(
                        textStyle: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    )),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                Strings.interests,
                style: GoogleFonts.aBeeZee(
                  textStyle:
                      const TextStyle(color: Colors.black54, fontSize: 20),
                ),
              ),
            ),
            Wrap(
                children: widget.userModel.interests!.map((e) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: FilterChip(
                  label: Text(e),
                  pressElevation: 0,
                  backgroundColor: Colors.white,
                  checkmarkColor: Colors.white,
                  onSelected: (bool value) {},
                ),
              );
            }).toList()),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
              child: Divider(
                height: 1,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                Strings.major,
                style: GoogleFonts.aBeeZee(
                  textStyle:
                      const TextStyle(color: Colors.black54, fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FilterChip(
                label: Text(widget.userModel.major!),
                pressElevation: 0,
                backgroundColor: Colors.white,
                checkmarkColor: Colors.white,
                onSelected: (bool value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                Strings.gender,
                style: GoogleFonts.aBeeZee(
                  textStyle:
                  const TextStyle(color: Colors.black54, fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FilterChip(
                label: Text(widget.userModel.gender!),
                pressElevation: 0,
                backgroundColor: Colors.white,
                checkmarkColor: Colors.white,
                onSelected: (bool value) {},
              ),
            )

          ],
        )));
  }
}
