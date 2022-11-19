import 'package:clean_architecture/presentation/pages/detailtopics/detail_page.dart';
import 'package:clean_architecture/presentation/pages/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/util/custom_route.dart';

class ItemTopic extends StatelessWidget {
  const ItemTopic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeVM>(builder: (context, data, child) {
      return ListView.builder(
          itemCount: data.homeState.topicPhoto!.length,
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(bottom: 1),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      EnterExitRouter(
                          exitPage: this,
                          enterPage: DetailPage(
                            topicPhoto: data.homeState.topicPhoto![index],
                          )));
                },
                child: Image.network(
                  data.homeState.topicPhoto![index].topicPhotoUrls.full,
                  fit: BoxFit.cover,
                ),
              ),
            );
          });
    });
  }
}
