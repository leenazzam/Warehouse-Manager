import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:warehouse_management/core/appcolors.dart';
import 'package:warehouse_management/core/fonts.dart';
import 'package:warehouse_management/core/widgets/add_details.dart';
import 'package:warehouse_management/models/productsModel.dart';

class Editproductpage extends StatefulWidget {
  ProductsModel product;
  Editproductpage({super.key, required this.product});

  @override
  State<Editproductpage> createState() => _EditproductpageState();
}

class _EditproductpageState extends State<Editproductpage> {
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var quantityController = TextEditingController();
  var descriptionController = TextEditingController();
  var expirydateController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String? path;
  bool isFragile = false;
  @override
  void initState() {
    super.initState();
    nameController.text = widget.product.name;
    priceController.text = widget.product.price.toString();
    quantityController.text = widget.product.quantity.toString();
    descriptionController.text = widget.product.description;
    isFragile = widget.product.isFragile;
    if (widget.product.expiryDate != null) {
      expirydateController.text = DateFormat(
        'dd/MM/yyyy',
      ).format(widget.product.expiryDate!);
    }
    path = widget.product.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Edit Product',
          style: getTitleStyle(color: AppColors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    await ImagePicker()
                        .pickImage(source: ImageSource.gallery)
                        .then((value) {
                          if (value != null) {
                            setState(() {
                              path = value.path;
                            });
                          }
                        });
                  },
                  child: CircleAvatar(
                    radius: 150,
                    backgroundImage:
                        path != null
                            ? path!.startsWith('http')
                                ? NetworkImage(path!)
                                : FileImage(File(path!))
                            : const NetworkImage(
                              'https://cdn-icons-png.freepik.com/256/8467/8467062.png?semt=ais_hybrid',
                            ),
                  ),
                ),
                SizedBox(height: 5),

                Text('Add image', style: getCaptionStyle()),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        AddDetails(
                          controller: nameController,
                          lable: 'Name',
                          preicon: Icons.person,
                        ),
                        SizedBox(height: 8),
                        AddDetails(
                          controller: priceController,
                          lable: 'Price',
                          preicon: Icons.attach_money_outlined,
                        ),
                        SizedBox(height: 8),
                        AddDetails(
                          controller: quantityController,
                          lable: 'Quantity',
                          preicon: Icons.production_quantity_limits,
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: expirydateController,
                          onTap: () {
                            showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2028),
                              initialDate: DateTime.now(),
                            ).then((value) {
                              if (value != null) {
                                expirydateController.text = DateFormat(
                                  'dd/MM/yyyy',
                                ).format(value);
                              }
                            });
                          },
                          readOnly: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.date_range_rounded,
                              color: AppColors.primary,
                            ),
                            label: Text('Expiry Date'),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: AppColors.primary),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: AppColors.primary),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),

                        AddDetails(
                          controller: descriptionController,
                          lable: 'Description',
                          preicon: Icons.description,
                          maxlines: 3,
                        ),

                        TextButton(
                          onPressed: () {
                            setState(() {
                              isFragile = !isFragile;
                            });
                          },
                          child: Row(
                            children: [
                              Checkbox(
                                value: isFragile,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isFragile = value!;
                                  });
                                },
                              ),
                              Text(
                                'isFragile',
                                style: getBodyStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: AppColors.white,
                          ),
                          onPressed: () {
                            if (path == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text('Please Add image!'),
                                  action: SnackBarAction(
                                    label: 'Undo',
                                    onPressed: () {},
                                  ),
                                ),
                              );
                              return;
                            }
                            if (nameController.text.isEmpty ||
                                priceController.text.isEmpty ||
                                quantityController.text.isEmpty ||
                                descriptionController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                    'Please Add products info!',
                                  ),
                                  action: SnackBarAction(
                                    label: 'Undo',
                                    onPressed: () {},
                                  ),
                                ),
                              );
                            } else {
                              final ProductsModel newProduct = ProductsModel(
                                id: widget.product.id,
                                name: nameController.text,
                                price: double.parse(priceController.text),
                                quantity: int.parse(quantityController.text),
                                description: descriptionController.text,
                                isFragile: isFragile,
                                expiryDate:
                                    expirydateController.text.isNotEmpty
                                        ? DateFormat(
                                          'dd/MM/yyyy',
                                        ).parse(expirydateController.text)
                                        : null,
                                imageUrl: path!,
                              );
                              setState(() {
                                dummyProducts.removeWhere(
                                  (currentProduct) =>
                                      currentProduct.id == newProduct.id,
                                );
                                dummyProducts.add(newProduct);
                              });
                              Navigator.pop(context);
                            }
                          },
                          child: Text('Save Changes'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
