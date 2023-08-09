import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/ingrid/widget/datatable.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:admin_dashboard/src/university/widget/custom_dailog.dart';
import 'package:admin_dashboard/src/university/widget/university_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class DepartmentList extends StatefulWidget {
  const DepartmentList({super.key});

  @override
  State<DepartmentList> createState() => _DepartmentListState();
}

class _DepartmentListState extends State<DepartmentList> {
  final List<Map<String, dynamic>> _departmentList = [
    {
      'dp': 'Mechanical Engg.',
      'hod': 'Emmett L Johnson',
      'phone': '+123 4567890',
      'email': 'test@example.com',
      'establish': '1998',
      'sc': '150',
    },
    {
      'dp': 'Computer Engg.',
      'hod': 'Corrine M Johnson',
      'phone': '+123 4567890',
      'email': 'test@example.com',
      'establish': '2011',
      'sc': '205',
    },
    {
      'dp': 'M.B.A.',
      'hod': 'Gladys J Smith',
      'phone': '+123 4567890',
      'email': 'test@example.com',
      'establish': '2009',
      'sc': '128',
    },
    {
      'dp': '	M.C.A.',
      'hod': 'Patricia Smith',
      'phone': '+123 4567890',
      'email': 'test@example.com',
      'establish': '2014',
      'sc': '98',
    },
    {
      'dp': 'Civil Engg.',
      'hod': 'Danny M Johnson',
      'phone': '+123 4567890',
      'email': 'test@example.com',
      'establish': '2016',
      'sc': '231',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return UniversityCard(
      child: _departmentList.isNotEmpty
          ? DataTable3(
              showBottomBorder: true,
              columnSpacing: 20.0,
              minWidth: 950.0,
              dataRowHeight: 52.0,
              headingRowHeight: 44.0,
              columns: [
                const DataColumn2(
                  fixedWidth: 20.0,
                  size: ColumnSize.S,
                  label: CustomText(
                    title: '#',
                  ),
                ),
                DataColumn2(
                  fixedWidth: 140,
                  size: ColumnSize.L,
                  label: CustomText(
                    title: UniversityString.deptName.toUpperCase(),
                  ),
                ),
                DataColumn2(
                  fixedWidth: 150,
                  size: ColumnSize.L,
                  label: CustomText(
                    title: UniversityString.headOfDept.toUpperCase(),
                  ),
                ),
                DataColumn2(
                  fixedWidth: 120,
                  size: ColumnSize.L,
                  label: CustomText(
                    title: UniversityString.phone.toUpperCase(),
                  ),
                ),
                DataColumn2(
                  size: ColumnSize.M,
                  fixedWidth: 150,
                  label: CustomText(
                    title: UniversityString.email.toUpperCase(),
                  ),
                ),
                DataColumn2(
                  fixedWidth: 100.0,
                  size: ColumnSize.S,
                  label: CustomText(
                    title: UniversityString.establish.toUpperCase(),
                  ),
                ),
                DataColumn2(
                  fixedWidth: 130.0,
                  size: ColumnSize.S,
                  label: CustomText(
                    title: UniversityString.stdCapacity.toUpperCase(),
                  ),
                ),
                DataColumn2(
                  size: ColumnSize.S,
                  label: CustomText(
                    title: UniversityString.edit.toUpperCase(),
                  ),
                ),
              ],
              rows: List.generate(_departmentList.length, (index) {
                return DataRow(
                  color: MaterialStateProperty.all(
                      index % 2 == 0 + 1 ? Colors.grey.shade100 : null),
                  cells: [
                    DataCell(CustomText(
                      title: '${index + 1}',
                    )),
                    DataCell(CustomText(
                      title: _departmentList[index]['dp'],
                    )),
                    DataCell(CustomText(
                      title: _departmentList[index]['hod'],
                    )),
                    DataCell(CustomText(
                      title: _departmentList[index]['phone'],
                    )),
                    DataCell(CustomText(
                      title: _departmentList[index]['email'],
                    )),
                    DataCell(CustomText(
                      title: _departmentList[index]['establish'],
                    )),
                    DataCell(CustomText(
                      title: _departmentList[index]['sc'],
                    )),
                    DataCell(
                      Row(
                        children: [
                          const Icon(
                            Icons.remove_red_eye_outlined,
                            color: UniversityColor.black,
                            size: 18,
                          ),
                          FxBox.w10,
                          const Icon(
                            Icons.edit_square,
                            color: UniversityColor.black,
                            size: 18,
                          ),
                          FxBox.w10,
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return CustomDailog(
                                    onPressed: () {
                                      _departmentList.removeAt(index);
                                      setState(() {});
                                    },
                                  );
                                },
                              );
                            },
                            child: const Icon(
                              CupertinoIcons.delete,
                              color: UniversityColor.red,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
            )
          : const Center(child: Text('No data Found')),
    );
  }
}
