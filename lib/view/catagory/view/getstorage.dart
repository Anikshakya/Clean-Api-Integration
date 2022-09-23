import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

import '../services/jsonurl_services.dart';
import '../tiles/news_tile.dart';

class TravelandTech extends StatefulWidget {
  const TravelandTech({Key? key}) : super(key: key);

  @override
  State<TravelandTech> createState() => _HomeAndLivingState();
}

class _HomeAndLivingState extends State<TravelandTech> {
  // ignore: prefer_typing_uninitialized_variables
  late final newsapi;
  bool? loading;

  @override
  void initState() {
    setState(() {
      JsonurlServices.geturl();
      newsapi = box.read('localStorage');
      loading = false;
    });
    super.initState();
  }

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return loading == false && newsapi != null
        ? SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 15, right: 15, bottom: 10),
                  child: Container(
                    color: Colors.white,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return Wrap(
                            children: List.generate(
                                newsapi!.articles!.length,
                                (index) => CatBlogTile(
                                      imgUrl: newsapi!.articles![index].urlToImage ??
                                          "https://images.pexels.com/photos/531880/pexels-photo-531880.jpeg?cs=srgb&dl=pexels-pixabay-531880.jpg&fm=jpg",
                                      title:
                                          newsapi!.articles![index].title ?? "",
                                      desc: newsapi!
                                          .articles![index].publishedAt
                                          .toString(),
                                    )),
                          );
                        }),
                  ),
                ),
                const SizedBox(
                  height: 80,
                )
              ],
            ),
          )
        : Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height - 90,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
