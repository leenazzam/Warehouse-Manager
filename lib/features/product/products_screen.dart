import 'dart:io';

import 'package:flutter/material.dart';
import 'package:warehouse_management/core/appcolors.dart';
import 'package:warehouse_management/core/fonts.dart';
import 'package:warehouse_management/core/widgets/appbar.dart';
import 'package:warehouse_management/core/widgets/navigator.dart';
import 'package:warehouse_management/features/product/addProductPage.dart';
import 'package:warehouse_management/features/product/editProductPage.dart';
import 'package:warehouse_management/features/product/productsdetailsPage.dart';
import 'package:warehouse_management/models/productsModel.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CoustomAppBar(
          txt: 'Products',
          action: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                pushTO(context, Addproduct());
              },
              child: Text(
                '+Add',
                style: getCaptionStyle(
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: dummyProducts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              pushTO(context, Productsdetails(product: dummyProducts[index]));
            },
            child: Dismissible(
              onDismissed: (direction) {
                if (direction == DismissDirection.startToEnd) {
                  dummyProducts.removeAt(index);
                } else {
                  pushTO(
                    context,
                    Editproductpage(product: dummyProducts[index]),
                  );
                }
              },
              key: UniqueKey(),
              background: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 20, left: 8, right: 8),
                decoration: BoxDecoration(
                  color: AppColors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.delete, color: AppColors.white),
                    Text('Delete', style: getBodyStyle(color: AppColors.white)),
                  ],
                ),
              ),
              secondaryBackground: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 20, left: 8, right: 8),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.edit, color: AppColors.white),
                    Text('Edite', style: getBodyStyle(color: AppColors.white)),
                  ],
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 20, left: 8, right: 8),

                decoration: BoxDecoration(
                  color: AppColors.primary2,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          dummyProducts[index].imageUrl.startsWith('http')
                              ? NetworkImage(dummyProducts[index].imageUrl)
                              : FileImage(File(dummyProducts[index].imageUrl)),
                    ),
                    SizedBox(width: 20),
                    Text(dummyProducts[index].name, style: getTitleStyle()),
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          '${dummyProducts[index].price.toString()}\$',
                          style: getBodyStyle(
                            fontSize: 17,
                            color: AppColors.secondary,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'x${dummyProducts[index].quantity.toString()}',
                          style: getBodyStyle(
                            fontSize: 17,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
