import 'package:clean_architecture/presentation/widgets/item_list_post.dart';
import 'package:flutter/material.dart';

class GridPostWidget extends StatefulWidget {
  const GridPostWidget({super.key});

  @override
  State<GridPostWidget> createState() => _GridPostWidgetState();
}

class _GridPostWidgetState extends State<GridPostWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        primary: false,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
              child: const ItemListPost(url: "",));
        });
  }

}

