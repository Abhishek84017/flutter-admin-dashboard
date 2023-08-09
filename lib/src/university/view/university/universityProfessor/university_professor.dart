import 'package:admin_dashboard/src/university/view/university/staff/university_staff.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

@RoutePage()
class UniversityProfessor extends StatefulWidget {
  const UniversityProfessor({super.key});

  @override
  State<UniversityProfessor> createState() => _UniversityProfessorState();
}

class _UniversityProfessorState extends State<UniversityProfessor> {
  @override
  Widget build(BuildContext context) {
    return const UniversityStaff();
  }
}