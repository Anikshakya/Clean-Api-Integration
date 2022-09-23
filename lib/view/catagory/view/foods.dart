
import 'package:api_integration/view/catagory/list/list.dart';
import 'package:flutter/material.dart';

import '../tiles/foods_tile.dart';

class Foods extends StatefulWidget {
  const Foods({Key? key}) : super(key: key);

  @override
  State<Foods> createState() => _FoodsState();
}

class _FoodsState extends State<Foods> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                          4,
                          (index) => FoodsTile(
                                image: data2[index]['url'],
                                title: data2[index]['name'],
                                text: data2[index]['rs'].toString(),
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
                        5,
                        (index) => FoodsTile(
                              image: data2[index]['url'],
                              title: data2[index]['name'],
                              text: data2[index]['rs'].toString(),
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
                        (index) => FoodsTile(
                              image: data2[index]['url'],
                              title: data2[index]['name'],
                              text: data2[index]['rs'].toString(),
                              onTap: () {},
                            )),
                  );
                }),
          ),
          const SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
