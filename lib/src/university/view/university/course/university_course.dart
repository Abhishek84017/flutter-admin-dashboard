import 'package:admin_dashboard/src/university/view/university/course/course_list.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

import '../../../../admin/constant/custom_text.dart';
import '../../../constant/colors.dart';
import '../../../constant/string.dart';
import '../../../widget/route_title.dart';
import 'add_course.dart';

@RoutePage()
class UniversityCourse extends StatefulWidget {
  const UniversityCourse({super.key});

  @override
  State<UniversityCourse> createState() => _UniversityCourseState();
}

class _UniversityCourseState extends State<UniversityCourse> {
  int changePageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: Column(
          children: [
            const SizedBox(height: 15.0),
            Row(
              children: [
                const RouteTitle(),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    changePageIndex = 1;
                    setState(() {});
                  },
                  child: CustomText(
                    title: UniversityString.listView,
                    fontSize: 16.0,
                    textColor: changePageIndex == 1
                        ? UniversityColor.blue
                        : UniversityColor.boxgreylight,
                  ),
                ),
                FxBox.w24,
                GestureDetector(
                  onTap: () {
                    changePageIndex = 2;
                    setState(() {});
                  },
                  child: CustomText(
                    title: UniversityString.add,
                    fontSize: 16.0,
                    textColor: changePageIndex == 2
                        ? UniversityColor.blue
                        : UniversityColor.boxgreylight,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            if (changePageIndex == 1) const CourseList(),
            if (changePageIndex == 2) const UniversityAddCourse(),
          ],
        ),
      ),
    );
  }
}
