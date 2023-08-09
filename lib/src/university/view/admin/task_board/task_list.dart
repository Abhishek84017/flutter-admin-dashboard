import 'package:admin_dashboard/src/admin/constant/custom_text.dart';

import 'package:admin_dashboard/src/ingrid/widget/datatable.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:admin_dashboard/src/university/utils/responsive.dart';
import 'package:admin_dashboard/src/university/view/admin/task_board/task_data.dart';
import 'package:admin_dashboard/src/university/widget/custom_slider.dart';
import 'package:admin_dashboard/src/university/widget/stack_user_image.dart';

import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final List<Map<String, dynamic>> _chartData = [
    {
      'header': UniversityString.planned,
      'fill_color': UniversityColor.bluelight,
      'percentage': 0.23,
    },
    {
      'header': UniversityString.inProgress,
      'fill_color': UniversityColor.orange,
      'percentage': 0.43,
    },
    {
      'header': UniversityString.completed,
      'fill_color': UniversityColor.green,
      'percentage': 0.83,
    },
    {
      'header': UniversityString.incompleted,
      'fill_color': UniversityColor.pink,
      'percentage': 0.12,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _chartBox(),
          FxBox.h24,
          _taskTable(),
        ],
      ),
    );
  }

  Widget _taskTable() {
    return DataTable3(
      showBottomBorder: true,
      columnSpacing: 12.0,
      minWidth: 1000.0,
      dataRowHeight: 66.0,
      headingRowHeight: 48.0,
      columns: [
        DataColumn2(
          size: ColumnSize.S,
          fixedWidth: 25,
          label: CustomText(
            title: taskHeader[0].toUpperCase(),
          ),
        ),
        DataColumn2(
          size: ColumnSize.L,
          fixedWidth: 400,
          label: CustomText(
            title: taskHeader[1].toUpperCase(),
          ),
        ),
        DataColumn2(
          size: ColumnSize.M,
          fixedWidth: 200,
          label: CustomText(
            title: taskHeader[2].toUpperCase(),
          ),
        ),
        DataColumn2(
          size: ColumnSize.L,
          fixedWidth: 150,
          label: CustomText(
            title: taskHeader[3].toUpperCase(),
          ),
        ),
        DataColumn2(
          size: ColumnSize.M,
          label: CustomText(
            title: taskHeader[4].toUpperCase(),
          ),
        ),
        DataColumn2(
          size: ColumnSize.M,
          fixedWidth: 100,
          label: CustomText(
            title: taskHeader[5].toUpperCase(),
          ),
        ),
      ],
      rows: List.generate(taskdata.length, (index) {
        return DataRow(
          cells: [
            DataCell(CustomText(title: '0${index + 1}')),
            DataCell(
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: CustomText(
                        title: taskdata[index]['task']['1'],
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: CustomText(
                        title: taskdata[index]['task']['2'],
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            DataCell(_teamLogo(taskdata[index]['team'])),
            DataCell(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    title: 'Start: ${taskdata[index]['duration']['start']}',
                    textColor: UniversityColor.primary,
                  ),
                  CustomText(
                    title: 'End: ${taskdata[index]['duration']['end']}',
                    textColor: UniversityColor.pink,
                  ),
                ],
              ),
            ),
            DataCell(
              Container(
                height: 26,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.0),
                  color: _statusColor(taskdata[index]['action']),
                ),
                child: CustomText(
                  title: taskdata[index]['action'],
                  textColor: UniversityColor.white,
                  fontSize: 12.0,
                ),
              ),
            ),
            DataCell(
              Column(
                children: [
                  CustomeSliderWithTextrow(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    leadingText: '${(taskdata[index]['progess'])}%',
                    trailingText: 'Progress',
                    percentage: taskdata[index]['progess'],
                    colors: const [
                      UniversityColor.green,
                      UniversityColor.blue,
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _teamLogo(int teamCount) {
    return SizedBox(
      width: 200,
      child: StackedUserRow(itemCount: teamCount),
    );
  }

  Widget _chartBox() {
    return GridView.builder(
      itemCount: _chartData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: UniversityResponsive.isMobile(context)
          ? const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              mainAxisExtent: 190.0,
            )
          : UniversityResponsive.isTablet(context)
              ? const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                  mainAxisExtent: 190.0,
                )
              : UniversityResponsive.isSmallWeb(context)
                  ? const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18,
                      mainAxisExtent: 190.0,
                    )
                  : SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent:
                          MediaQuery.of(context).size.width * 0.18,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18,
                      mainAxisExtent: 190.0,
                    ),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            children: [
              Expanded(
                child: CustomText(
                  title: _chartData[index]['header'],
                  fontSize: 17.0,
                  textColor: UniversityColor.boxgreylight,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              FxBox.h16,
              SizedBox(
                height: 100,
                width: 100,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator(
                        value: _chartData[index]['percentage'],
                        strokeWidth: 6.0,
                        backgroundColor: Colors.grey.shade300,
                        valueColor: AlwaysStoppedAnimation(
                            _chartData[index]['fill_color']),
                      ),
                    ),
                    Positioned(
                      top: 38,
                      right: 38,
                      child: CustomText(
                        title:
                            (_chartData[index]['percentage'] * 100).toString(),
                        fontSize: 17.0,
                        fontWeight: FontWeight.w500,
                        textColor: _chartData[index]['fill_color'],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Color _statusColor(String status) {
    if (status == UniversityString.planned) {
      return UniversityColor.bluelight;
    } else if (status == UniversityString.completed) {
      return UniversityColor.green;
    } else if (status == UniversityString.inProgress) {
      return UniversityColor.orange;
    } else {
      return UniversityColor.bluelight;
    }
  }
}
