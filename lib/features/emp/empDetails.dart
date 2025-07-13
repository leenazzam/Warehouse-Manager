import 'dart:io';

import 'package:flutter/material.dart';
import 'package:warehouse_management/core/widgets/details.dart';
import 'package:warehouse_management/models/employeeModel.dart';

class Empdetails extends StatelessWidget {
  final EmployeeModel emp;
  const Empdetails({super.key, required this.emp});

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
                    emp.imageUrl.startsWith('http')
                        ? NetworkImage(emp.imageUrl)
                        : FileImage(File(emp.imageUrl)),
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    children: [
                      Details(title: 'Name', type: emp.name),
                      Details(title: 'Salary', type: emp.salary),
                    ],
                  ),
                  Row(
                    children: [
                      Details(title: 'Position', type: emp.position),
                      Details(title: 'Age', type: emp.age),
                    ],
                  ),
                  Row(
                    children: [
                      Details(title: 'Start time', type: "${emp.startTime}"),
                      Details(title: 'End time', type: "${emp.endTime}"),
                    ],
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
