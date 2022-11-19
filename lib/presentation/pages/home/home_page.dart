import 'package:clean_architecture/core/value/AppTextStyle.dart';
import 'package:clean_architecture/core/value/colors/AppColors.dart';
import 'package:clean_architecture/core/value/strings/strings.dart';
import 'package:clean_architecture/domain/entities/topics/Topics.dart';
import 'package:clean_architecture/presentation/pages/home/home_state.dart';
import 'package:clean_architecture/presentation/pages/tab/tab_view_model.dart';
import 'package:clean_architecture/presentation/pages/tab/tab_view_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'home_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{
  TextEditingController cityName = TextEditingController();
  @override
  bool get wantKeepAlive => true;


  @override
  Widget build(BuildContext context) {
    return Consumer<HomeVM>(builder: (context, data, child) {
      return Scaffold(
        body: loadDataStatus(data, data.homeState.topics),
      );
    });
  }

  Widget loadDataStatus(HomeVM state, List<Topics>? topic) {
    switch (state.homeState.homeStatus) {
      case HomeStatus.initial:
        return const Text(Strings.nullData);
      case HomeStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case HomeStatus.success:
        return DefaultTabController(
          initialIndex: 0,
          length: topic!.length,
          child: Container(
            color: Colors.black,
            child: Stack(
              children: [
                TabBarView(
                  dragStartBehavior: DragStartBehavior.down,
                  children: topic.map((e) {
                    return Center(
                      child: TabViewPage(id: e.id),
                    );
                  }).toList(),
                ),
                Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: const [
                                0.5,
                                0.7,
                                0.8
                              ],
                              colors: <Color>[
                                AppColors.beginBgAppbar.withOpacity(0.7),
                                AppColors.midBgAppbar.withOpacity(0.5),
                                AppColors.endBgAppbar.withOpacity(0.3)
                              ]),
                        ),
                        child: AppBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          bottom: TabBar(
                              indicatorColor: Colors.white,
                              indicatorPadding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              isScrollable: true,
                              onTap: (value) {
                                context
                                    .read<TabVM>()
                                    .getTopicPhoto(id: topic[value].slug);
                              },
                              tabs: topic.map((e) {
                                return Tab(
                                  child: Text(e.slug),
                                );
                              }).toList()),
                          title: Center(
                            child: Text(
                              Strings.unsplash,
                              style: GoogleFonts.ubuntu(
                                  textStyle: AppTextStyle.textStyleNameApp),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 8,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
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
