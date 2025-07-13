class EmployeeModel {
  int id;
  String name;
  int age;
  String startTime;
  String endTime;
  double salary;
  String position;
  String imageUrl;

  EmployeeModel({
    required this.id,
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
    id: 1,
    name: 'Ahmed Ali',
    age: 30,
    startTime: '08:00 AM',
    endTime: '05:00 PM',
    salary: 500.0,
    position: 'Warehouse Manager',
    imageUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
  ),
  EmployeeModel(
    id: 2,
    name: 'Sara Hassan',
    age: 25,
    startTime: '09:00 AM',
    endTime: '06:00 PM',
    salary: 400.0,
    position: 'Inventory Clerk',
    imageUrl: 'https://randomuser.me/api/portraits/women/44.jpg',
  ),
  EmployeeModel(
    id: 3,
    name: 'Mohammed Saleh',
    age: 28,
    startTime: '07:30 AM',
    endTime: '04:30 PM',
    salary: 450.0,
    position: 'Stock Supervisor',
    imageUrl: 'https://randomuser.me/api/portraits/men/56.jpg',
  ),
];
