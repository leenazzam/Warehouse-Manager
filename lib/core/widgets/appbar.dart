import 'package:flutter/material.dart';

class CoustomAppBar extends StatelessWidget {
  final String txt;
  final Widget action;

  const CoustomAppBar({super.key, required this.txt, required this.action});

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 182, 212, 241),
      title: Text(txt),
      centerTitle: true,
      actions: [action],
    );
  }
}
