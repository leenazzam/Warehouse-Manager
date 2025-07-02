import 'package:flutter/material.dart';
import 'package:warehouse_management/core/appcolors.dart';
import 'package:warehouse_management/core/widgets/appbar.dart';
import 'package:warehouse_management/features/attendance_screen.dart';
import 'package:warehouse_management/features/emp_screen.dart';
import 'package:warehouse_management/features/products_screen.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int selectedIndex = 0;
  List<Widget> bodyWidgets = [
    const ProductsScreen(),
    EmpScreen(),
    AttendanceScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyWidgets[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        selectedFontSize: 18,
        unselectedFontSize: 15,
        unselectedItemColor: AppColors.primary,
        backgroundColor: const Color.fromARGB(255, 182, 212, 241),
        selectedItemColor: AppColors.secondary,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_people_outlined),
            label: 'Employees',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_contact_calendar_rounded),
            label: 'Attendance ',
          ),
        ],
      ),
    );
  }
}
