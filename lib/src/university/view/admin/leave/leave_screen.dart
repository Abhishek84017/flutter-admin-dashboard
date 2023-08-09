import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/ingrid/widget/datatable.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:admin_dashboard/src/university/view/admin/leave/leave_data.dart';
import 'package:admin_dashboard/src/university/widget/route_title.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class LeaveScreen extends StatefulWidget {
  const LeaveScreen({super.key});

  @override
  State<LeaveScreen> createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
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
          _leaveTable(),
        ],
      ),
    );
  }

  Widget _leaveTable() {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: DataTable3(
        showBottomBorder: true,
        columnSpacing: 30.0,
        minWidth: 728.0,
        dataRowHeight: 52.0,
        headingRowHeight: 44.0,
        columns: [
          const DataColumn2(
            size: ColumnSize.S,
            label: CustomText(
              title: '#',
            ),
          ),
          DataColumn2(
            size: ColumnSize.L,
            label: CustomText(
              title: UniversityString.name.toUpperCase(),
            ),
          ),
          DataColumn2(
            size: ColumnSize.S,
            fixedWidth: 120,
            label: CustomText(
              title: UniversityString.studentId.toUpperCase(),
            ),
          ),
          DataColumn2(
            fixedWidth: 250,
            size: ColumnSize.L,
            label: CustomText(
              title: UniversityString.date.toUpperCase(),
            ),
          ),
          DataColumn2(
            fixedWidth: 200,
            size: ColumnSize.L,
            label: CustomText(
              title: UniversityString.leaveReason.toUpperCase(),
            ),
          ),
          DataColumn2(
            size: ColumnSize.S,
            label: CustomText(
              title: UniversityString.action.toUpperCase(),
            ),
          ),
        ],
        rows: List.generate(leaveData.length, (index) {
          return DataRow(
            color: MaterialStateProperty.all(
                index % 2 == 0 + 1 ? Colors.grey.shade100 : null),
            cells: [
              const DataCell(
                CircleAvatar(
                  radius: 16.0,
                  backgroundImage: AssetImage(Images.profileImage),
                ),
              ),
              DataCell(CustomText(
                title: leaveData[index]['name'],
              )),
              DataCell(CustomText(
                title: leaveData[index]['student_id'],
              )),
              DataCell(CustomText(
                title: leaveData[index]['date'],
              )),
              DataCell(CustomText(
                title: leaveData[index]['leave_reason'],
              )),
              DataCell(Row(
                children: [
                  const Icon(
                    Icons.done,
                    color: UniversityColor.green,
                    size: 18,
                  ),
                  IconButton(
                    splashRadius: 20.0,
                    onPressed: () {
                      leaveData.removeAt(index);
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.delete_outline,
                      color: UniversityColor.red,
                      size: 18,
                    ),
                  ),
                ],
              )),
            ],
          );
        }).toList(),
      ),
    );
  }
}
