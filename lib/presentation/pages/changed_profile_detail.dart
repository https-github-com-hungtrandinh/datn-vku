import 'package:clean_architecture/presentation/widgets/edit_tab.dart';
import 'package:flutter/material.dart';

import '../../core/value/strings.dart';

class ChangedProfileDetail extends StatefulWidget {
  const ChangedProfileDetail({Key? key}) : super(key: key);
  static const changedProfileDetailPushName = "/ChangedProfileDetailPage";

  @override
  State<ChangedProfileDetail> createState() => _ChangedProfileDetailState();
}

class _ChangedProfileDetailState extends State<ChangedProfileDetail> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  Strings.done,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ))
          ],
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: const Text(
            Strings.editProfileDetail,
            style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20),
          ),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Text(
                  Strings.edit,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                icon: Text(
                  Strings.preview,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            EditTab(),
            Center(),
          ],
        ),
      ),
    );
  }
}
