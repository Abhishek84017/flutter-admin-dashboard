import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/ingrid/widget/datatable.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:admin_dashboard/src/university/widget/university_card.dart';
import 'package:flutter/material.dart';

class NewStudentList extends StatefulWidget {
  const NewStudentList({super.key});

  @override
  State<NewStudentList> createState() => _NewStudentListState();
}

class _NewStudentListState extends State<NewStudentList> {
  bool _isExpanded = true;
  final List<Map<String, dynamic>> _dataList = [
    {
      'no': '1',
      'name': 'Jens Brincker',
      'ap': 'Kenny Josh',
      'doa': '27/05/2016',
      'fees': 'paid',
      'branch': 'Mechanical',
    },
    {
      'no': '2',
      'name': 'Mark Hay',
      'ap': 'Mark',
      'doa': '26/05/2018',
      'fees': 'unpaid',
      'branch': 'Science',
    },
    {
      'no': '3',
      'name': 'Anthony Davie',
      'ap': 'Cinnabar',
      'doa': '21/05/2018',
      'fees': 'paid',
      'branch': 'Commerce',
    },
    {
      'no': '4',
      'name': 'David Perry',
      'ap': 'Felix',
      'doa': '20/04/2019',
      'fees': 'unpaid',
      'branch': 'Mechanical',
    },
    {
      'no': '5',
      'name': 'Anthony Davie',
      'ap': 'Beryl',
      'doa': '24/05/2017',
      'fees': 'paid',
      'branch': 'M.B.A.',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return UniversityCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              _isExpanded = !_isExpanded;
              setState(() {});
            },
            child: Container(
              height: 45.0,
              alignment: Alignment.center,
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    title: UniversityString.newStudentList.toUpperCase(),
                    fontSize: 17.0,
                    textColor: UniversityColor.primary,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      _isExpanded = !_isExpanded;
                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.only(right: 6.0, left: 6.0),
                      alignment: Alignment.center,
                      child: Icon(
                        !_isExpanded
                            ? Icons.keyboard_arrow_down_outlined
                            : Icons.keyboard_arrow_up_outlined,
                        size: 20.0,
                        color: UniversityColor.blue,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.only(right: 6.0, left: 6.0),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.fullscreen,
                        size: 20.0,
                        color: UniversityColor.blue,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.only(right: 6.0, left: 6.0),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.close,
                        size: 20.0,
                        color: UniversityColor.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_isExpanded) ...[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
              child: DataTable3(
                showBottomBorder: true,
                columnSpacing: 30.0,
                minWidth: 800.0,
                dataRowHeight: 52.0,
                headingRowHeight: 44.0,
                columns: [
                  const DataColumn2(
                    fixedWidth: 50.0,
                    size: ColumnSize.S,
                    label: CustomText(
                      title: 'NO',
                    ),
                  ),
                  DataColumn2(
                    size: ColumnSize.L,
                    label: CustomText(
                      title: UniversityString.name.toUpperCase(),
                    ),
                  ),
                  DataColumn2(
                    fixedWidth: 200.0,
                    size: ColumnSize.L,
                    label: CustomText(
                      title: UniversityString.assignedProfessor.toUpperCase(),
                    ),
                  ),
                  DataColumn2(
                    size: ColumnSize.L,
                    label: CustomText(
                      title: UniversityString.dateOfAdmit.toUpperCase(),
                    ),
                  ),
                  DataColumn2(
                    size: ColumnSize.M,
                    label: CustomText(
                      title: UniversityString.fees.toUpperCase(),
                    ),
                  ),
                  DataColumn2(
                    fixedWidth: 110.0,
                    size: ColumnSize.S,
                    label: CustomText(
                      title: UniversityString.branch.toUpperCase(),
                    ),
                  ),
                  DataColumn2(
                    size: ColumnSize.S,
                    label: CustomText(
                      title: UniversityString.edit.toUpperCase(),
                    ),
                  ),
                ],
                rows: List.generate(_dataList.length, (index) {
                  return DataRow(
                    color: MaterialStateProperty.all(
                        index % 2 == 0 + 1 ? Colors.grey.shade100 : null),
                    cells: [
                      DataCell(CustomText(
                        title: _dataList[index]['no'],
                      )),
                      DataCell(CustomText(
                        title: _dataList[index]['name'],
                      )),
                      DataCell(CustomText(
                        title: _dataList[index]['ap'],
                      )),
                      DataCell(CustomText(
                        title: _dataList[index]['doa'],
                      )),
                      DataCell(
                        Container(
                          height: 26.0,
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: _dataList[index]['fees'] == 'paid'
                                ? UniversityColor.green
                                : UniversityColor.red,
                          ),
                          child: CustomText(
                            title: _dataList[index]['fees'],
                            fontSize: 12.0,
                            textColor: UniversityColor.white,
                          ),
                        ),
                      ),
                      DataCell(CustomText(
                        title: _dataList[index]['branch'],
                      )),
                      DataCell(
                        Row(
                          children: const [
                            Icon(
                              Icons.done,
                              color: UniversityColor.blue,
                              size: 18,
                            ),
                            Icon(
                              Icons.delete_outline,
                              color: UniversityColor.blue,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
