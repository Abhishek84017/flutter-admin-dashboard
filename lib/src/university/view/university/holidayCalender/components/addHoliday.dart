import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/widget/expansion_tile.dart';
import 'package:admin_dashboard/src/university/widget/university_card.dart';
import 'package:admin_dashboard/src/university/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class AddHoliday extends StatefulWidget {
  const AddHoliday({super.key});

  @override
  State<AddHoliday> createState() => _AddHolidayState();
}

class _AddHolidayState extends State<AddHoliday> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _holidayType = TextEditingController();
  final TextEditingController _holidayStart = TextEditingController();
  final TextEditingController _holidayEnd = TextEditingController();
  // final TextEditingController _headOfDepartment = TextEditingController();
  // final TextEditingController _noOfStudent = TextEditingController();
  // final TextEditingController _departmentStartDate = TextEditingController();
  final TextEditingController _brief = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UniversityCard(
          child: CustomeWidgetExpand(
            title: 'ADD HOLIDAY',
            content: Column(
              children: [
                textFeild(
                  controller: _titleController,
                  hintText: 'Enter Title',
                ),
                FxBox.h16,
                textFeild(
                  controller: _holidayType,
                  hintText: 'Holiday Type',
                ),
                FxBox.h16,
                Row(
                  children: [
                    Expanded(
                      child: textFeild(
                        controller: _holidayStart,
                        hintText: 'Holiday Start Date',
                      ),
                    ),
                    FxBox.w16,
                    Expanded(
                      child: textFeild(
                          controller: _holidayEnd,
                          hintText: 'Holiday End Date'),
                    ),
                  ],
                ),
                FxBox.h16,
                textFeild(
                    controller: _brief,
                    hintText: 'Please type what you want....',
                    maxLines: 5),
                FxBox.h16,
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(60, 40),
                          backgroundColor: UniversityColor.primary),
                      onPressed: () {},
                      child: const Text(
                        'Add Holiday',
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
