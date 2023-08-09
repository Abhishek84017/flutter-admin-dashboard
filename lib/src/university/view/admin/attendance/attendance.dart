import 'dart:math';

import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/widget/datatable.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/icons.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:admin_dashboard/src/university/widget/route_title.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class AttendanceView extends StatefulWidget {
  const AttendanceView({super.key});

  @override
  State<AttendanceView> createState() => _AttendanceViewState();
}

class _AttendanceViewState extends State<AttendanceView> {
  DateTime now = DateTime.now();
  int totalDaysInMonth = 0;
  final List<Map<String, dynamic>> _iconList = [
    {
      'icon': UniversityIcon.personCheck,
      'color': UniversityColor.boxgreylight,
    },
    {
      'icon': UniversityIcon.personUncheck,
      'color': UniversityColor.yellow,
    },
    {
      'icon': UniversityIcon.personUncheck,
      'color': UniversityColor.red,
    },
    {
      'icon': UniversityIcon.personCheck,
      'color': UniversityColor.boxgreylight,
    },
    {
      'icon': UniversityIcon.personUncheck,
      'color': UniversityColor.yellow,
    },
    {
      'icon': UniversityIcon.personUncheck,
      'color': UniversityColor.red,
    },
    {
      'icon': UniversityIcon.personCheck,
      'color': UniversityColor.boxgreylight,
    },
    {
      'icon': UniversityIcon.personUncheck,
      'color': UniversityColor.yellow,
    },
    {
      'icon': UniversityIcon.personUncheck,
      'color': UniversityColor.red,
    },
    {
      'icon': UniversityIcon.personCheck,
      'color': UniversityColor.boxgreylight,
    },
    {
      'icon': UniversityIcon.personUncheck,
      'color': UniversityColor.yellow,
    },
    {
      'icon': UniversityIcon.personUncheck,
      'color': UniversityColor.red,
    },
  ];
  int randomIndex() => Random().nextInt(_iconList.length);
  final List<String> _attendanceHeader = [
    'John Doe',
    'Tim Hank',
    'Frank Camly',
    'Gary Camara',
    'Fidel Tonn',
    'Tim Hank',
    'Maryam Amiri',
    'Hossein Shams',
  ];

  @override
  void initState() {
    totalDaysInMonth = DateTime(now.year, now.month + 1, 0).day;

    super.initState();
  }

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
              Container(
                height: 32.0,
                width: 110.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      UniversityColor.primary,
                      UniversityColor.green,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: const CustomText(
                  title: UniversityString.exportExcel,
                  textColor: UniversityColor.white,
                ),
              ),
            ],
          ),
          FxBox.h24,
          _attendanceTable(),
        ],
      ),
    );
  }

  Widget _attendanceTable() {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: DataTable3(
        showBottomBorder: true,
        columnSpacing: 6.0,
        minWidth: 900.0,
        dataRowHeight: 42.0,
        headingRowHeight: 46.0,
        columns: [
          const DataColumn2(
            fixedWidth: 140.0,
            label: CustomText(
              title: 'EMPLOYEE',
              textColor: UniversityColor.boxgreylight,
            ),
          ),
          ...List.generate(totalDaysInMonth, (index) {
            return DataColumn2(
              size: ColumnSize.S,
              label: CustomText(
                title: '${index + 1}',
                textColor: UniversityColor.boxgreylight,
              ),
            );
          }).toList(),
        ],
        rows: [
          ..._attendanceHeader.map((attendanceHeader) {
            return DataRow(
              cells: [
                DataCell(
                  CustomText(
                    title: attendanceHeader,
                  ),
                ),
                ...List.generate(totalDaysInMonth, (index) {
                  return DataCell(
                    SvgIcon(
                      icon: _iconList[randomIndex()]['icon'],
                      size: 16,
                      color: _iconList[randomIndex()]['color'],
                    ),
                  );
                }).toList(),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}
