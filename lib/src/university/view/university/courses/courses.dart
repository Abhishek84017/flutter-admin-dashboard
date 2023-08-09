import 'package:flutter/cupertino.dart';

class UniversityCourses extends StatefulWidget {
  const UniversityCourses({super.key});

  @override
  State<UniversityCourses> createState() => _UniversityCoursesState();
}

class _UniversityCoursesState extends State<UniversityCourses> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Courses'),
    );
  }
}
