import 'package:flutter/material.dart';

import '../../core/consts.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {Key? key, required this.image, required this.color, required this.title})
      : super(key: key);
  final String image;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      height: 146,
      width: 128,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 65,
          ),
          smallerVerticalSpacing(),
          Text(
            title,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
