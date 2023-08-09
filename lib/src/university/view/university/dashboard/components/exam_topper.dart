import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/ingrid/widget/datatable.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:admin_dashboard/src/university/widget/university_card.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class ExamToppers extends StatefulWidget {
  const ExamToppers({super.key});

  @override
  State<ExamToppers> createState() => _ExamToppersState();
}

class _ExamToppersState extends State<ExamToppers> {
  final List<Map<String, dynamic>> _examTopperData = [
    {
      'no': '11',
      'name': 'Merri Diamond',
      'des': 'Science',
      'marks': '199',
      'age': '99.00',
    },
    {
      'no': '23',
      'name': 'Sara Hopkins',
      'des': 'Mechanical',
      'marks': '197',
      'age': '98.00',
    },
    {
      'no': '41',
      'name': 'Allen Collins',
      'des': 'M.C.A.',
      'marks': '197',
      'age': '98.00',
    },
    {
      'no': '17',
      'name': 'Erin Gonzales',
      'des': 'Arts',
      'marks': '194',
      'age': '97.00',
    },
    {
      'no': '57',
      'name': 'Claire Peters',
      'des': 'Science',
      'marks': '192	',
      'age': '95.00',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return UniversityCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            title: UniversityString.universityreport.toUpperCase(),
            textColor: UniversityColor.primary,
            fontSize: 17.0,
          ),
          FxBox.h24,
          _table(),
          FxBox.h16,
          Row(
            children: [
              Expanded(
                flex: 4,
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(color: UniversityColor.boxgreylight),
                    text:
                        'Measure How Fast You’re Growing Monthly Recurring Revenue. ',
                    children: [
                      TextSpan(
                          text: 'View All',
                          recognizer: null,
                          style: TextStyle(color: UniversityColor.blue))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                  color: UniversityColor.primary,
                  onPressed: () {},
                  child: const CustomText(
                    title: UniversityString.export,
                    textColor: UniversityColor.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _table() {
    return SizedBox(
      height: 280,
      child: DataTable3(
        showBottomBorder: true,
        columnSpacing: 30.0,
        minWidth: 480.0,
        dataRowHeight: 58.0,
        headingRowHeight: 42.0,
        columns: const [
          DataColumn2(
            fixedWidth: 40,
            size: ColumnSize.S,
            label: CustomText(
              title: 'NO.',
              textColor: UniversityColor.boxgreylight,
            ),
          ),
          DataColumn2(
            fixedWidth: 80,
            size: ColumnSize.S,
            label: CustomText(
              title: 'NAME',
              textColor: UniversityColor.boxgreylight,
            ),
          ),
          DataColumn2(
            fixedWidth: 150,
            size: ColumnSize.L,
            label: CustomText(
              title: '',
            ),
          ),
          DataColumn2(
            size: ColumnSize.S,
            label: CustomText(
              title: 'MARKS',
              textColor: UniversityColor.boxgreylight,
            ),
          ),
          DataColumn2(
            size: ColumnSize.S,
            label: CustomText(
              title: '%AGE',
              textColor: UniversityColor.boxgreylight,
            ),
          ),
        ],
        rows: List.generate(_examTopperData.length, (index) {
          return DataRow(
            color: MaterialStateProperty.all(
                index % 2 == 0 + 1 ? Colors.grey.shade100 : null),
            cells: [
              DataCell(CustomText(
                title: _examTopperData[index]['no'],
              )),
              const DataCell(
                CircleAvatar(
                  radius: 16.0,
                  backgroundImage: AssetImage(Images.profileImage),
                ),
              ),
              DataCell(Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: _examTopperData[index]['name'],
                  ),
                  CustomText(
                    title: _examTopperData[index]['des'],
                  ),
                ],
              )),
              DataCell(CustomText(
                title: _examTopperData[index]['marks'],
              )),
              DataCell(CustomText(
                title: _examTopperData[index]['age'],
              )),
            ],
          );
        }).toList(),
      ),
    );
  }
}
