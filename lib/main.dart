import 'package:flutter/material.dart';
import 'package:warehouse_management/core/appcolors.dart';
import 'package:warehouse_management/features/nav.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Nav(),
      color: AppColors.background,
    );
  }
}
