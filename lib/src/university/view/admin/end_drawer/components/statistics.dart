import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:admin_dashboard/src/university/widget/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class StatisticsView extends StatefulWidget {
  const StatisticsView({super.key});

  @override
  State<StatisticsView> createState() => _StatisticsViewState();
}

class _StatisticsViewState extends State<StatisticsView> {
  final List<Map<String, dynamic>> _totalValue = [
    {
      'icon': Icons.groups,
      'topHeader': UniversityString.totalStudent,
      'bottomHeader': '2,051',
      'color1': UniversityColor.yellow,
      'color2': UniversityColor.lightyellow,
    },
    {
      'icon': Icons.home_repair_service_outlined,
      'topHeader': UniversityString.department,
      'bottomHeader': '14',
      'color1': UniversityColor.boxgrey,
      'color2': UniversityColor.boxgreylight,
    },
    {
      'icon': Icons.school_outlined,
      'topHeader': UniversityString.totalTeacher,
      'bottomHeader': '27',
      'color1': UniversityColor.black,
      'color2': UniversityColor.black,
    },
    {
      'icon': Icons.sell_outlined,
      'topHeader': UniversityString.totalCourses,
      'bottomHeader': '31',
      'color1': UniversityColor.blue,
      'color2': UniversityColor.bluelight,
    },
    {
      'icon': Icons.credit_card_outlined,
      'topHeader': UniversityString.expense,
      'bottomHeader': '\$7,254',
      'color1': UniversityColor.pink,
      'color2': UniversityColor.pinklight,
    },
    {
      'icon': Icons.account_balance_sharp,
      'topHeader': UniversityString.totalIncome,
      'bottomHeader': '\$27,852',
      'color1': UniversityColor.green,
      'color2': UniversityColor.blue,
    },
    {
      'icon': Icons.map_outlined,
      'topHeader': UniversityString.ourCenter,
      'bottomHeader': '52',
      'color1': UniversityColor.teal,
      'color2': UniversityColor.teallight,
    },
    {
      'icon': Icons.emoji_emotions_outlined,
      'topHeader': UniversityString.smileyFace,
      'bottomHeader': '10k',
      'color1': UniversityColor.bluelight,
      'color2': UniversityColor.pink,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomStatisticsBox(),
            FxBox.h20,
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _totalValue.length,
              itemBuilder: (context, index) {
                return BoxTile(
                  color1: _totalValue[index]['color1'],
                  color2: _totalValue[index]['color2'],
                  topHeader: _totalValue[index]['topHeader'],
                  bottomHeader: _totalValue[index]['bottomHeader'],
                  icon: _totalValue[index]['icon'],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BoxTile extends StatelessWidget {
  const BoxTile({
    super.key,
    required this.color1,
    required this.color2,
    required this.topHeader,
    required this.bottomHeader,
    required this.icon,
  });

  final Color color1;
  final Color color2;
  final String topHeader;
  final String bottomHeader;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: Colors.grey.shade400,
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 54.0,
            width: 54.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color1, color2],
              ),
              borderRadius: BorderRadius.circular(2.0),
            ),
            child: Icon(
              icon,
              color: UniversityColor.white,
              size: 30.0,
            ),
          ),
          FxBox.w16,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                title: topHeader,
                textColor: UniversityColor.black,
                fontSize: 14.0,
              ),
              FxBox.h12,
              CustomText(
                title: bottomHeader,
                textColor: UniversityColor.black,
                fontSize: 18.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomStatisticsBox extends StatelessWidget {
  const CustomStatisticsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: CustomText(
              title: UniversityString.totalRevenue,
              textColor: UniversityColor.boxgrey,
              fontSize: 15.0,
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: CustomText(
              title: '\$79,452',
              fontSize: 32.0,
              textColor: UniversityColor.green,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
            child: Row(
              children: const [
                CustomText(
                  title: UniversityString.income,
                  textColor: UniversityColor.boxgrey,
                ),
                Spacer(),
                Icon(
                  Icons.arrow_drop_up,
                  color: UniversityColor.green,
                ),
                CustomText(
                  title: '4%',
                  textColor: UniversityColor.boxgrey,
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey.shade500,
          ),
          const CustomeSliderWithTextrow(
            leadingText: '\$43,320',
            trailingText: 'Bank of America',
            percentage: 230,
            colors: [
              UniversityColor.bluelight,
              UniversityColor.blue,
            ],
          ),
          const CustomeSliderWithTextrow(
            leadingText: '\$36,132',
            trailingText: 'Wells Fargo',
            percentage: 200,
            colors: [
              UniversityColor.green,
              UniversityColor.blue,
            ],
          ),
          FxBox.h16,
        ],
      ),
    );
  }
}
