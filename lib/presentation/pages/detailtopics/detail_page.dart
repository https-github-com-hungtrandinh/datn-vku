import 'package:clean_architecture/domain/entities/topicphoto/TopicPhoto.dart';
import 'package:clean_architecture/presentation/pages/detailtopics/detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class DetailPage extends StatefulWidget {
  final TopicPhoto topicPhoto;

  const DetailPage({Key? key, required this.topicPhoto}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DetailPageState();
  }
}

class DetailPageState extends State<DetailPage> with TickerProviderStateMixin {





  @override
  Widget build(BuildContext context) {
    return Consumer<DetailVM>(builder: (context, data, child) {
      return Scaffold(
        backgroundColor: Colors.black54,
        body: Stack(
          children: [

            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: GestureDetector(
                    onTap: () {
                      if (mounted) {
                        data.onClick();
                      }
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 80, bottom: 80),
                        child: Stack(
                          children: [
                            Center(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: PhotoView(
                                  imageProvider: NetworkImage(
                                    widget.topicPhoto.topicPhotoUrls.full,
                                  ),
                                ),
                              ),
                            ),
                            // AnimatedBuilder(
                            //     animation: animation, builder: (context,snapshot){
                            //   return CustomPaint(
                            //     painter: ShowIndicatorDownload(
                            //         width: data.detailState.showDownload ? 0: 0- animation.value,
                            //         height:data.detailState.showDownload ? 1 : 1+ animation.value ),
                            //     child: Container(),
                            //   );
                            // }),
                          ],
                        ),
                      ),
                    ))),
            Visibility(
                visible: data.detailState.onClick,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: AppBar(
                        backgroundColor: Colors.black.withOpacity(0.6),
                        title: Center(
                          child:
                              Text(widget.topicPhoto.topicPhotoUser.userName),
                        ),
                        actions: [
                          IconButton(
                              onPressed: () async {
                                // await Share.shareWithResult(widget.topicPhoto.topicPhotoUrls.full);
                                await Share.share(
                                    widget.topicPhoto.topicPhotoUrls.full,
                                    subject: 'any subject if you have');
                              },
                              icon: const Icon(
                                Icons.ios_share_outlined,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                  ],
                )),


            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                  icon: const Icon(Icons.error_outline_rounded),
                  onPressed: () {},
                ),
              ),
            ),

          ],
        ),
        floatingActionButton: Visibility(
          visible: data.detailState.onClick,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
                      primary: Colors.black),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
                      primary: Colors.black),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: ElevatedButton(
                  onPressed: () {
                    data.showDownload();
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
                      primary: Colors.white),
                  child: const Icon(
                    Icons.download,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

}
