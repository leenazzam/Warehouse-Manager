import 'dart:io';

import 'package:flutter/material.dart';
import 'package:warehouse_management/core/appcolors.dart';
import 'package:warehouse_management/core/fonts.dart';
import 'package:warehouse_management/core/widgets/appbar.dart';
import 'package:warehouse_management/core/widgets/navigator.dart';
import 'package:warehouse_management/features/emp/addEmpPage.dart';
import 'package:warehouse_management/features/emp/editEmpPage.dart';
import 'package:warehouse_management/features/emp/empDetails.dart';
import 'package:warehouse_management/models/employeeModel.dart';

class EmpScreen extends StatefulWidget {
  const EmpScreen({super.key});

  @override
  State<EmpScreen> createState() => _EmpScreenState();
}

class _EmpScreenState extends State<EmpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CoustomAppBar(
          txt: 'Employees',
          action: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                pushTO(context, Addemppage());
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
        itemCount: dummyEmployees.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              pushTO(context, Empdetails(emp: dummyEmployees[index]));
            },
            child: Dismissible(
              onDismissed: (direction) {
                if (direction == DismissDirection.startToEnd) {
                  dummyEmployees.removeAt(index);
                } else {
                  pushTO(context, Editemppage(employee: dummyEmployees[index]));
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          dummyEmployees[index].imageUrl.startsWith('http')
                              ? NetworkImage(dummyEmployees[index].imageUrl)
                              : FileImage(File(dummyEmployees[index].imageUrl)),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dummyEmployees[index].name,
                          style: getTitleStyle(),
                        ),
                        Text(
                          '${dummyEmployees[index].position.toString()}',
                          style: getBodyStyle(
                            fontSize: 17,
                            color: AppColors.primary,
                          ),
                        ),
                        Text(
                          'Salary :${dummyEmployees[index].salary.toString()}\$',
                          style: getBodyStyle(
                            fontSize: 17,
                            color: AppColors.secondary,
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
