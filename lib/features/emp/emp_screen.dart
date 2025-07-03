import 'package:flutter/material.dart';
import 'package:warehouse_management/core/appcolors.dart';
import 'package:warehouse_management/core/fonts.dart';
import 'package:warehouse_management/core/widgets/appbar.dart';
import 'package:warehouse_management/core/widgets/navigator.dart';
import 'package:warehouse_management/features/empDetails.dart';
import 'package:warehouse_management/models/employeeModel.dart';

class EmpScreen extends StatelessWidget {
  const EmpScreen({super.key});

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
              onPressed: () {},
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
                    backgroundImage: NetworkImage(
                      dummyEmployees[index].imageUrl,
                    ),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(dummyEmployees[index].name, style: getTitleStyle()),
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
          );
        },
      ),
    );
  }
}
