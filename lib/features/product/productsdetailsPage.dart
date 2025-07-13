import 'dart:io';

import 'package:flutter/material.dart';
import 'package:warehouse_management/core/appcolors.dart';
import 'package:warehouse_management/core/fonts.dart';
import 'package:warehouse_management/core/widgets/details.dart';
import 'package:warehouse_management/models/productsModel.dart';

class Productsdetails extends StatelessWidget {
  final ProductsModel product;
  const Productsdetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 150,
                backgroundImage:
                    product.imageUrl.startsWith('http')
                        ? NetworkImage(product.imageUrl)
                        : FileImage(File(product.imageUrl)),
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    children: [
                      Details(title: 'Name', type: product.name),
                      Details(title: 'Price', type: product.price),
                    ],
                  ),
                  Row(
                    children: [
                      Details(
                        title: 'Expiry Date',
                        type:
                            product.expiryDate != null
                                ? "${product.expiryDate!.day}/${product.expiryDate!.month}/${product.expiryDate!.year}"
                                : null,
                      ),
                      Details(title: 'Quantity', type: product.quantity),
                    ],
                  ),
                  Details(
                    title: 'isFragile',
                    type: product.isFragile ? 'YES' : 'NO',
                  ),
                  SizedBox(
                    height: 80,
                    width: 350,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primary2,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Description: ${product.description}',
                          style: getBodyStyle(fontWeight: FontWeight.w500),
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
