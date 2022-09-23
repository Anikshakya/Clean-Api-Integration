// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class CategoryTile extends StatefulWidget {
  final image, text, color, textColor, textSize;
  final VoidCallback onTap;
  const CategoryTile({
    Key? key,
    required this.image,
    required this.text,
    required this.onTap,
    required this.color,
    required this.textColor,
    required this.textSize,
  }) : super(key: key);

  @override
  State<CategoryTile> createState() => _CategoryState();
}

class _CategoryState extends State<CategoryTile> {
  bool onChange = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: size.height / 5.6,
        width: size.width / 3.5,
        color: Color(int.parse(widget.color)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: Image.asset(
                widget.image,
                height: 45,
                width: 45,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              widget.text,
              style: TextStyle(
                  fontSize: widget.textSize,
                  color: Color(int.parse(widget.textColor))),
            )
          ],
        ),
      ),
    );
  }
}
