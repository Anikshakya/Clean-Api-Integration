// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BeverageUrlTile extends StatefulWidget {
  final image, title, text;
  final VoidCallback onTap;
  const BeverageUrlTile({
    Key? key,
    required this.image,
    required this.title,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  State<BeverageUrlTile> createState() => _FoodsState();
}

class _FoodsState extends State<BeverageUrlTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 25, bottom: 0.8, left: 19),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: CachedNetworkImage(
                imageUrl: widget.image,
                height: MediaQuery.of(context).size.height * 0.113,
                width: MediaQuery.of(context).size.width * 0.175,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 62,
              child: Text(
                widget.title,
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 2.5,
            ),
            SizedBox(
              width: 62,
              child: Text(
                widget.text,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
