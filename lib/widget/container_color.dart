import 'package:flutter/material.dart';

class ContainerColor extends StatelessWidget {
  Color color;
  IconData? icon;
  VoidCallback onTap;
  ContainerColor({required this.color, this.icon, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Icon(icon, color: const Color(0xFF302D52)),
      ),
    );
  }
}
