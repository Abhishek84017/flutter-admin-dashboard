import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:admin_dashboard/src/university/view/university/departments/components/department_add.dart';
import 'package:admin_dashboard/src/university/view/university/departments/components/department_list.dart';
import 'package:admin_dashboard/src/university/widget/route_title.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class DepartmentView extends StatefulWidget {
  const DepartmentView({super.key});

  @override
  State<DepartmentView> createState() => _DepartmentViewState();
}

class _DepartmentViewState extends State<DepartmentView> {
  int changePageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
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
                  title: '${UniversityString.list} View',
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
                  title: 'Add Department',
                  fontSize: 16.0,
                  textColor: changePageIndex == 1
                      ? UniversityColor.blue
                      : UniversityColor.boxgreylight,
                ),
              ),
            ],
          ),
          FxBox.h24,
          changePageIndex == 0 ? const DepartmentList() : const DepartmentAdd()
        ],
      ),
    );
  }
}