import 'package:flutter/material.dart';

class EmployeeModel {
  final String name;
  final int age;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final double salary;
  final String position;
  final String imageUrl;

  EmployeeModel({
    required this.name,
    required this.age,
    required this.startTime,
    required this.endTime,
    required this.salary,
    required this.position,
    required this.imageUrl,
  });
}

final List<EmployeeModel> dummyEmployees = [
  EmployeeModel(
    name: 'Ahmed Ali',
    age: 30,
    startTime: TimeOfDay(hour: 8, minute: 0),
    endTime: TimeOfDay(hour: 17, minute: 0),
    salary: 500.0,
    position: 'Warehouse Manager',
    imageUrl:
        'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?auto=format&fit=crop&w=400&q=80',
  ),
  EmployeeModel(
    name: 'Sara Hassan',
    age: 25,
    startTime: TimeOfDay(hour: 9, minute: 0),
    endTime: TimeOfDay(hour: 18, minute: 0),
    salary: 400.0,
    position: 'Inventory Clerk',
    imageUrl:
        'https://images.unsplash.com/photo-1520813792240-56fc4a3765a7?auto=format&fit=crop&w=400&q=80',
  ),
  EmployeeModel(
    name: 'Mohammed Saleh',
    age: 28,
    startTime: TimeOfDay(hour: 7, minute: 30),
    endTime: TimeOfDay(hour: 16, minute: 30),
    salary: 450.0,
    position: 'Stock Supervisor',
    imageUrl:
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=400&q=80',
  ),
];
