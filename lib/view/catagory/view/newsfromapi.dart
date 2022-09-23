import 'dart:io';
import 'package:api_integration/view/catagory/services/newsapi_service.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:download_assets/download_assets.dart';

import '../model/newsapi_model.dart';
import '../tiles/news_tile.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _FoodsState();
}

class _FoodsState extends State<News> {
  NewsApi? newsapi;
  bool? loading;

  final box = GetStorage();

  DownloadAssetsController downloadAssetsController =
      DownloadAssetsController();
  String message = "Press the download button to start the download";
  bool downloaded = false;

  @override
  void initState() {
    NewsApiServices.geturl().then((value) {
      setState(() {
        newsapi = value;
        loading = false;
      });
    });
    _init();
    super.initState();
  }

  Future _init() async {
    await downloadAssetsController.init();
    downloaded = await downloadAssetsController.assetsDirAlreadyExists();
  }

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
                                      imgUrl: newsapi!
                                              .articles![index].urlToImage ??
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
                Text(message),
                const SizedBox(
                  height: 20,
                ),
                if (downloaded)
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(File(
                            "${downloadAssetsController.assetsDir}/dart.jpeg")),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                if (downloaded)
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(File(
                            "${downloadAssetsController.assetsDir}/flutter.png")),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(
                      onPressed: _downloadAssets,
                      tooltip: 'Increment',
                      child: const Icon(Icons.arrow_downward),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    FloatingActionButton(
                      onPressed: _refresh,
                      tooltip: 'Refresh',
                      child: const Icon(Icons.refresh),
                    ),
                  ],
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

  Future _refresh() async {
    await downloadAssetsController.clearAssets();
    await _downloadAssets();
  }

  Future _downloadAssets() async {
    bool assetsDownloaded =
        await downloadAssetsController.assetsDirAlreadyExists();

    if (assetsDownloaded) {
      setState(() {
        message = "Click in refresh button to force download";
      });
      return;
    }

    try {
      await downloadAssetsController.startDownload(
        assetsUrl:
            "https://github.com/edjostenes/download_assets/raw/master/assets.zip",
        onProgress: (progressValue) {
          downloaded = false;
          setState(() {
            if (progressValue < 100) {
              message = "Downloading - ${progressValue.toStringAsFixed(2)}";
            } else {
              message =
                  "Download completed\nClick in refresh button to force download";
              downloaded = true;
            }
          });
        },
      );
    } on DownloadAssetsException catch (e) {
      setState(() {
        downloaded = false;
        message = "Error: ${e.toString()}";
      });
    }
  }
}
