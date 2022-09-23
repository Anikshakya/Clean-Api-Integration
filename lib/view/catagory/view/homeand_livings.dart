
import 'package:api_integration/view/catagory/list/list.dart';
import 'package:api_integration/view/catagory/model/jsonurl.dart';
import 'package:api_integration/view/catagory/services/jsonurl_services.dart';
import 'package:api_integration/view/catagory/tiles/home_travel.dart';
import 'package:flutter/material.dart';

class HomeAndLiving extends StatefulWidget {
  const HomeAndLiving({Key? key}) : super(key: key);

  @override
  State<HomeAndLiving> createState() => _FoodsState();
}

class _FoodsState extends State<HomeAndLiving> {
  var jsonurl = <Jsonurl>[];

  @override
  void initState() {
    JsonurlServices.geturl().then((value) {
      setState(() {
        jsonurl = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return jsonurl.isNotEmpty
        ? SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0.0, bottom: 20),
                  child: Container(
                    color: Colors.white,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return Wrap(
                            children: List.generate(
                                6,
                                (index) => HomeTile(
                                      image: jsonurl[index].url,
                                      title: jsonurl[index].title,
                                      text: jsonurl[index].id.toString(),
                                      onTap: () {},
                                    )),
                          );
                        }),
                  ),
                ),
                const Divider(
                  endIndent: 16,
                  indent: 16,
                  thickness: 1.8,
                  color: Color.fromARGB(255, 236, 236, 236),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(top: 8.0, bottom: 20),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return Wrap(
                          children: List.generate(
                              3,
                              (index) => HomeTile(
                                    image: jsonurl[index].url,
                                    title: jsonurl[index].title,
                                    text: jsonurl[index].id.toString(),
                                    onTap: () {},
                                  )),
                        );
                      }),
                ),
                const Divider(
                  endIndent: 16,
                  indent: 16,
                  thickness: 1.8,
                  color: Color.fromARGB(255, 236, 236, 236),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(top: 8.0, bottom: 20),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return Wrap(
                          children: List.generate(
                              9,
                              (index) => HomeTile(
                                    image: jsonurl[index].url,
                                    title: jsonurl[index].title,
                                    text: jsonurl[index].id.toString(),
                                    onTap: () {},
                                  )),
                        );
                      }),
                ),
                const Divider(
                  endIndent: 16,
                  indent: 16,
                  thickness: 1.8,
                  color: Color.fromARGB(255, 236, 236, 236),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(top: 8.0, bottom: 20),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return Wrap(
                          children: List.generate(
                              data2.length,
                              (index) => HomeTile(
                                    image: jsonurl[index].url,
                                    title: jsonurl[index].title,
                                    text: jsonurl[index].id.toString(),
                                    onTap: () {},
                                  )),
                        );
                      }),
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
