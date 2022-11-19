import 'package:clean_architecture/presentation/pages/search/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Consumer<SearchVM>(
          builder: (context, data,build) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
                      onChanged: (value){
                        data.forcus(value.isNotEmpty);
                      },
                      controller: textEditingController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        labelStyle: const TextStyle(color: Colors.white),
                        hintText: "Search Photos, collections, users",
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        suffixIcon: Visibility(
                          visible:data.searchState.focus,
                          child: IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              textEditingController.clear();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          }
        ));
  }
}
