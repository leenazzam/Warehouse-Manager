import 'package:flutter/material.dart';
import 'package:warehouse_management/core/widgets/appbar.dart';

class EmpScreen extends StatelessWidget {
  const EmpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CoustomAppBar(
          txt: 'Employees',
          action: ElevatedButton(onPressed: () {}, child: const Text('+')),
        ),
      ),
    );
  }
}
