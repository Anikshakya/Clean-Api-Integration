import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

class CatBlogTile extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final imgUrl, title, desc;
  const CatBlogTile({
    Key? key,
    @required this.imgUrl,
    @required this.title,
    @required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(imageUrl: imgUrl)),
            const SizedBox(
              height: 7,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(221, 32, 32, 32)),
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              desc,
              style: const TextStyle(fontSize: 13, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
