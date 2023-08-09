import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:admin_dashboard/src/university/widget/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class ResultsView extends StatefulWidget {
  const ResultsView({super.key});

  @override
  State<ResultsView> createState() => _ResultsViewState();
}

class _ResultsViewState extends State<ResultsView> {
  final List<Map<String, dynamic>> _resultList = [
    {
      'year': '2019',
      'total_pass': '1,052',
      'total_fail': '198',
      'category': <String, String>{
        UniversityString.artAndDesign: '87',
        UniversityString.fashion: '80',
        UniversityString.sportScience: '63',
        UniversityString.computers: '91',
        UniversityString.biologicalSciences: '35',
      },
    },
    {
      'year': '2018',
      'total_pass': '845',
      'total_fail': '142',
      'category': <String, String>{
        UniversityString.fashion: '80',
        UniversityString.artAndDesign: '87',
        UniversityString.computers: '91',
        UniversityString.biologicalSciences: '35',
        UniversityString.sportScience: '63',
      }
    },
  ];

  List<List<Color>> colorList = [
    [
      UniversityColor.bluelight,
      UniversityColor.blue,
    ],
    [
      UniversityColor.green,
      UniversityColor.blue,
    ],
    [
      UniversityColor.orange,
      UniversityColor.pink,
    ],
    [
      UniversityColor.purple,
      UniversityColor.pink,
    ],
    [
      UniversityColor.pink,
      UniversityColor.blue,
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: ListView.builder(
        itemCount: _resultList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ResultBox(
            year: _resultList[index]['year'],
            index: index,
            totalPass: _resultList[index]['total_pass'],
            totalFail: _resultList[index]['total_fail'],
            categoryList: _resultList,
            colorList: colorList,
          );
        },
      ),
    );
  }
}

class ResultBox extends StatelessWidget {
  const ResultBox({
    super.key,
    required this.year,
    required this.index,
    required this.totalPass,
    required this.totalFail,
    required this.categoryList,
    required this.colorList,
  });

  final String year;

  final int index;
  final String totalPass;
  final String totalFail;
  final List<Map<String, dynamic>> categoryList;
  final List<List<Color>> colorList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: Colors.grey.shade400,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                CustomText(
                  title: 'Result $year',
                  textColor: UniversityColor.primary,
                  fontSize: 20.0,
                ),
                const Spacer(),
                const Icon(
                  Icons.description,
                  color: UniversityColor.blue,
                )
              ],
            ),
          ),
          FxBox.h16,
          Column(
            children: List.generate(
              (categoryList[index]['category'] as Map<String, String>).length,
              (i) {
                final key =
                    (categoryList[index]['category'] as Map<String, String>)
                        .keys
                        .elementAt(i);
                final value =
                    (categoryList[index]['category'] as Map<String, String>)
                        .values
                        .elementAt(i);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomeSliderWithTextrow(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    leadingText: key,
                    trailingText: value,
                    percentage: 230,
                    colors: colorList[i],
                  ),
                );
              },
            ).toList(),
          ),
          Divider(
            color: Colors.grey.shade500,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const CustomText(
                      title: UniversityString.totalpass,
                      fontSize: 16.0,
                      textColor: UniversityColor.boxgrey,
                    ),
                    FxBox.h10,
                    CustomText(
                      title: totalPass,
                      fontSize: 18.0,
                      textColor: UniversityColor.black,
                    ),
                  ],
                ),
                Container(
                  color: Colors.grey.shade500,
                  width: 0.5,
                  height: 50.0,
                ),
                Column(
                  children: [
                    const CustomText(
                      title: UniversityString.totalfail,
                      fontSize: 16.0,
                      textColor: UniversityColor.boxgrey,
                    ),
                    FxBox.h10,
                    CustomText(
                      title: totalFail,
                      fontSize: 18.0,
                      textColor: UniversityColor.black,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
