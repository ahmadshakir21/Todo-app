import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ContainerColor extends StatelessWidget {
  String title;
  String description;
  String time;
  Color color;
  VoidCallback onTap;
  ContainerColor(
      {required this.title,
      required this.description,
      required this.time,
      required this.color,
      required this.onTap});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: width * 1,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            time,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            description,
            style: Theme.of(context).textTheme.headline3,
          )
        ]),
      ),
    );
  }
}
