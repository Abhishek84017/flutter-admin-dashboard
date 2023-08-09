import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/widget/expansion_tile.dart';
import 'package:admin_dashboard/src/university/widget/university_card.dart';
import 'package:admin_dashboard/src/university/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class DepartmentAdd extends StatefulWidget {
  const DepartmentAdd({super.key});

  @override
  State<DepartmentAdd> createState() => _DepartmentAddState();
}

class _DepartmentAddState extends State<DepartmentAdd> {
  final TextEditingController _departmentCtr = TextEditingController();
  final TextEditingController _headOfDepartment = TextEditingController();
  final TextEditingController _noOfStudent = TextEditingController();
  final TextEditingController _departmentStartDate = TextEditingController();
  final TextEditingController _brief = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UniversityCard(
          child: CustomeWidgetExpand(
            title: 'DEPARTMENT BASIC INFO',
            content: Column(
              children: [
                FxBox.h16,
                Row(
                  children: [
                    Expanded(
                      child: textFeild(
                          controller: _departmentCtr,
                          hintText: 'Department Name'),
                    ),
                    FxBox.w16,
                    Expanded(
                      child: textFeild(
                          controller: _headOfDepartment,
                          hintText: 'Head of Department'),
                    ),
                  ],
                ),
                FxBox.h16,
                Row(
                  children: [
                    Expanded(
                      child: textFeild(
                        controller: _noOfStudent,
                        hintText: 'No. of Students',
                      ),
                    ),
                    FxBox.w16,
                    Expanded(
                      child: textFeild(
                          controller: _departmentStartDate,
                          hintText: 'Department Start Date'),
                    ),
                  ],
                ),
                FxBox.h16,
                textFeild(controller: _brief, hintText: 'Brief', maxLines: 5),
                FxBox.h16,
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(60, 40),
                          backgroundColor: UniversityColor.primary),
                      onPressed: () {},
                      child: const Text(
                        'Submit',
                      ),
                    ),
                    FxBox.w10,
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(60, 40),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: UniversityColor.grey),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
