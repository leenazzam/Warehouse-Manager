import 'package:flutter/material.dart';
import 'package:warehouse_management/core/appcolors.dart';

class AddDetails extends StatelessWidget {
  final int? maxlines;
  final String lable;
  final IconData preicon;
  final TextEditingController controller;
  const AddDetails({
    super.key,
    required this.lable,
    required this.preicon,
    required this.controller,
    this.maxlines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxlines,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(preicon, color: AppColors.primary),
        label: Text('$lable'),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.primary),
        ),
      ),
    );
  }
}
