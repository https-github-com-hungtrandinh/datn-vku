import 'package:clean_architecture/presentation/pages/tab/tab_view_model.dart';
import 'package:clean_architecture/presentation/pages/tab/tab_view_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/util/custom_route.dart';
import '../../../core/value/AppTextStyle.dart';
import '../../../core/value/strings/strings.dart';
import '../detailtopics/detail_page.dart';

class TabViewPage extends StatelessWidget {
  final String id;

  const TabViewPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = context.read<TabVM>();
    return loadTabView(data);
  }

  Widget loadTabView(TabVM data) {
    switch (data.tabViewState.tabViewStatus) {
      case TabViewStatus.initial:
        return const Text(Strings.oops);
      case TabViewStatus.loading:
        return const CircularProgressIndicator();
      case TabViewStatus.success:
        return ListView.builder(
            itemCount: data.tabViewState.topicPhoto.length,
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
                              topicPhoto: data.tabViewState.topicPhoto[index],
                            )));
                  },
                  child: Image.network(
                    data.tabViewState.topicPhoto[index].topicPhotoUrls.full,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            });
      default:
        return Center(
          child: Column(
            children: [
              Text(
                Strings.oops,
                style:
                    GoogleFonts.ubuntu(textStyle: AppTextStyle.textStyleOops),
              )
            ],
          ),
        );
    }
  }
}
