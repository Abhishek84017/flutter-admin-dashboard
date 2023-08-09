import 'package:admin_dashboard/src/admin/constant/custom_text.dart';

import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:admin_dashboard/src/university/view/admin/task_board/add_task.dart';
import 'package:admin_dashboard/src/university/view/admin/task_board/scrum_type.dart';
import 'package:admin_dashboard/src/university/view/admin/task_board/task_list.dart';
import 'package:admin_dashboard/src/university/widget/route_title.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class TaskBoard extends StatefulWidget {
  const TaskBoard({super.key});

  @override
  State<TaskBoard> createState() => _TaskBoardState();
}

class _TaskBoardState extends State<TaskBoard> {
  int changePageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const RouteTitle(),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    changePageIndex = 0;
                    setState(() {});
                  },
                  child: CustomText(
                    title: UniversityString.taskList,
                    fontSize: 16.0,
                    textColor: changePageIndex == 0
                        ? UniversityColor.blue
                        : UniversityColor.boxgreylight,
                  ),
                ),
                FxBox.w24,
                GestureDetector(
                  onTap: () {
                    changePageIndex = 1;
                    setState(() {});
                  },
                  child: CustomText(
                    title: UniversityString.scrumType,
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
                    title: UniversityString.addtask,
                    fontSize: 16.0,
                    textColor: changePageIndex == 2
                        ? UniversityColor.blue
                        : UniversityColor.boxgreylight,
                  ),
                ),
              ],
            ),
            FxBox.h24,
            changePageIndex == 0
                ? const TaskList()
                : changePageIndex == 1
                    ? const ScrumType()
                    : const AddTask(),
          ],
        ),
      ),
    );
  }
}
