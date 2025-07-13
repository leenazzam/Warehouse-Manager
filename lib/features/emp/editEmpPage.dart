import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:warehouse_management/core/appcolors.dart';
import 'package:warehouse_management/core/fonts.dart';
import 'package:warehouse_management/core/widgets/add_details.dart';
import 'package:warehouse_management/models/employeeModel.dart';

class Editemppage extends StatefulWidget {
  final EmployeeModel employee;
  const Editemppage({super.key, required this.employee});

  @override
  State<Editemppage> createState() => _EditemppageState();
}

class _EditemppageState extends State<Editemppage> {
  String? path;
  var nameController = TextEditingController();
  var salaryController = TextEditingController();
  var ageController = TextEditingController();
  var positionController = TextEditingController();
  var startTimeController = TextEditingController(
    text: DateFormat('hh:mm a').format(DateTime.now()),
  );
  var endTimeController = TextEditingController(
    text: DateFormat('hh:mm a').format(DateTime.now()),
  );

  @override
  void initState() {
    super.initState();
    nameController.text = widget.employee.name;
    ageController.text = widget.employee.age.toString();
    salaryController.text = widget.employee.salary.toString();
    positionController.text = widget.employee.position;
    startTimeController.text = widget.employee.startTime;
    endTimeController.text = widget.employee.endTime;
    path = widget.employee.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Edit Employee',
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
                  child: Column(
                    children: [
                      AddDetails(
                        lable: 'Name',
                        preicon: Icons.person,
                        controller: nameController,
                      ),
                      SizedBox(height: 8),
                      AddDetails(
                        lable: 'Age',
                        preicon: Icons.assignment_ind_rounded,
                        controller: ageController,
                      ),
                      SizedBox(height: 8),
                      AddDetails(
                        controller: salaryController,
                        lable: 'Salary',
                        preicon: Icons.attach_money_outlined,
                      ),
                      SizedBox(height: 8),
                      AddDetails(
                        lable: 'Position',
                        preicon: Icons.work,
                        controller: positionController,
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: startTimeController,
                              onTap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  if (value != null) {
                                    startTimeController.text = value.format(
                                      context,
                                    );
                                  }
                                });
                              },
                              readOnly: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.access_time_outlined,
                                  color: AppColors.primary,
                                ),
                                label: Text('Start Time'),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextFormField(
                              controller: endTimeController,
                              onTap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  if (value != null) {
                                    startTimeController.text = value.format(
                                      context,
                                    );
                                  }
                                });
                              },
                              readOnly: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.access_time_outlined,
                                  color: AppColors.primary,
                                ),
                                label: Text('End Time'),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),

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
                              ageController.text.isEmpty ||
                              salaryController.text.isEmpty ||
                              positionController.text.isEmpty ||
                              startTimeController.text.isEmpty ||
                              endTimeController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text(
                                  'Please Add Employee info!',
                                ),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {},
                                ),
                              ),
                            );
                          } else {
                            final EmployeeModel newEmp = EmployeeModel(
                              id: widget.employee.id,
                              name: nameController.text,
                              age: int.parse(ageController.text),
                              startTime: startTimeController.text,
                              endTime: endTimeController.text,
                              salary: double.parse(salaryController.text),
                              position: positionController.text,
                              imageUrl: path!,
                            );
                            setState(() {
                              dummyEmployees.removeWhere(
                                (currentEmp) => currentEmp.id == newEmp.id,
                              );
                              dummyEmployees.add(newEmp);
                            });
                            Navigator.pop(context);
                          }
                        },
                        child: Text('Save Changes'),
                      ),
                    ],
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
