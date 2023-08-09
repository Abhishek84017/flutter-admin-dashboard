import 'package:admin_dashboard/src/university/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

import '../../../../admin/constant/custom_text.dart';
import '../../../constant/colors.dart';
import '../../../constant/string.dart';
import '../../../widget/widget.dart';

class UniversityAddCourse extends StatefulWidget {
  const UniversityAddCourse({super.key});

  @override
  State<UniversityAddCourse> createState() => _UniversityAddCourseState();
}

class _UniversityAddCourseState extends State<UniversityAddCourse> {
  final TextEditingController _departmentName = TextEditingController();
  final TextEditingController _headOfDepartment = TextEditingController();
  final TextEditingController _noOfStudent = TextEditingController();
  final TextEditingController _departmentStartDate = TextEditingController();
  final TextEditingController _brief = TextEditingController();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  title: 'DEPARTMENT BASIC INFO',
                  textColor: UniversityColor.primary,
                  fontSize: 17.0,
                ),
                FxBox.h24,
                if (UniversityResponsive.isMobile(context) ||
                    UniversityResponsive.isTablet(context)) ...[
                  textFeild(
                    controller: _departmentName,
                    hintText: 'Department Name',
                  ),
                  FxBox.h16,
                  textFeild(
                    controller: _headOfDepartment,
                    hintText: 'Head of Department',
                  ),
                  FxBox.h16,
                  textFeild(
                    controller: _noOfStudent,
                    hintText: 'No. of Student',
                  ),
                  FxBox.h16,
                  textFeild(
                    controller: _departmentStartDate,
                    hintText: 'Department Start Date',
                  ),
                ] else ...[
                  Row(
                    children: [
                      Expanded(
                        child: textFeild(
                          controller: _departmentName,
                          hintText: 'Department Name',
                        ),
                      ),
                      FxBox.w16,
                      Expanded(
                        child: textFeild(
                          controller: _headOfDepartment,
                          hintText: 'Head of Department',
                        ),
                      ),
                    ],
                  ),
                  FxBox.h16,
                  Row(
                    children: [
                      Expanded(
                        child: textFeild(
                          controller: _noOfStudent,
                          hintText: 'No. of Student',
                        ),
                      ),
                      FxBox.w16,
                      Expanded(
                        child: textFeild(
                          controller: _departmentStartDate,
                          hintText: 'Department Start Date',
                        ),
                      ),
                    ],
                  )
                ],
                FxBox.h16,
                textFeild(controller: _brief, hintText: 'Brief', maxLines: 4),
                FxBox.h16,
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(60, 40),
                        backgroundColor: UniversityColor.primary,
                      ),
                      onPressed: () {},
                      child: const CustomText(
                        title: UniversityString.submit,
                      ),
                    ),
                    FxBox.w8,
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: UniversityColor.white,
                        minimumSize: const Size(60, 40),
                        side: const BorderSide(
                          color: UniversityColor.boxgreylight,
                        ),
                      ),
                      onPressed: () {},
                      child: const CustomText(
                        title: UniversityString.cancel,
                        textColor: UniversityColor.boxgreylight,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        FxBox.h8,
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  title: 'STAFF MEMBER ACCOUNT INFO',
                  textColor: UniversityColor.primary,
                  fontSize: 17.0,
                ),
                FxBox.h24,
                textFeild(
                  controller: _email,
                  hintText: 'Email',
                ),
                FxBox.h16,
                textFeild(
                  controller: _phone,
                  hintText: 'Phone',
                ),
                FxBox.h16,
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(60, 40),
                        backgroundColor: UniversityColor.primary,
                      ),
                      onPressed: () {},
                      child: const CustomText(
                        title: UniversityString.submit,
                      ),
                    ),
                    FxBox.w8,
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: UniversityColor.white,
                        minimumSize: const Size(60, 40),
                        side: const BorderSide(
                          color: UniversityColor.boxgreylight,
                        ),
                      ),
                      onPressed: () {},
                      child: const CustomText(
                        title: UniversityString.cancel,
                        textColor: UniversityColor.boxgreylight,
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
