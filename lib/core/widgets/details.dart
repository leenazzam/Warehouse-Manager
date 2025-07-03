import 'package:flutter/material.dart';
import 'package:warehouse_management/core/appcolors.dart';
import 'package:warehouse_management/core/fonts.dart';
import 'package:warehouse_management/models/productsModel.dart';

class Details extends StatelessWidget {
  final String title;
  final dynamic type;
  const Details({super.key, required this.title, required this.type});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 200,
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.primary2,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            "$title: $type",
            style: getBodyStyle(fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
