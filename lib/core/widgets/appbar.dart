import 'package:flutter/material.dart';
import 'package:warehouse_management/core/appcolors.dart';
import 'package:warehouse_management/core/fonts.dart';

class CoustomAppBar extends StatelessWidget {
  final String txt;
  final Widget action;

  const CoustomAppBar({super.key, required this.txt, required this.action});

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 182, 212, 241),
      title: Text(
        txt,
        style: getTitleStyle(
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 15, 82, 150),
        ),
      ),
      actions: [action],
    );
  }
}
