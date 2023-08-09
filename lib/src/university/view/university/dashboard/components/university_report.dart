import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:admin_dashboard/src/university/utils/responsive.dart';
import 'package:admin_dashboard/src/university/widget/custom_slider.dart';
import 'package:admin_dashboard/src/university/widget/full_screen_dailog.dart';
import 'package:admin_dashboard/src/university/widget/university_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:flutterx/flutterx.dart';

class UniversityReport extends StatefulWidget {
  const UniversityReport({super.key});

  @override
  State<UniversityReport> createState() => _UniversityReportState();
}

class _UniversityReportState extends State<UniversityReport> {
  final List<String> _reportData = ['1D', '1W', '1M', '1Y'];

  int tapIndex = 0;
  final List<int> _chartDataOne = [
    100,
    80,
    150,
    100,
    50,
    175,
    120,
    100,
    135,
    145,
    150,
    100
  ];
  final List<int> _chartDataTwo = [
    125,
    130,
    115,
    125,
    75,
    150,
    120,
    135,
    110,
    185,
    100,
    100
  ];
  final List<String> _bottom = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  final List<Map<String, dynamic>> _sliderData = [
    {
      'leading_text': UniversityString.fees,
      'trailing_text': '35%',
      'per': 70,
      'color': {
        'color1': UniversityColor.purple,
        'color2': UniversityColor.pinklight,
      },
    },
    {
      'leading_text': UniversityString.donation,
      'trailing_text': '61%',
      'per': 120,
      'color': {
        'color1': UniversityColor.yellow,
        'color2': UniversityColor.lightyellow,
      },
    },
    {
      'leading_text': UniversityString.income,
      'trailing_text': '87%',
      'per': 240,
      'color': {
        'color1': UniversityColor.green,
        'color2': UniversityColor.blue,
      },
    },
    {
      'leading_text': UniversityString.expense,
      'trailing_text': '42%',
      'per': 100,
      'color': {
        'color1': UniversityColor.pinklight,
        'color2': UniversityColor.pink,
      },
    },
  ];

  bool _isExpanded = true;

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
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    title: UniversityString.universityreport.toUpperCase(),
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
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => FullscreenDialog(
                          onPressedfullexit: () {
                            Navigator.pop(context);
                          },
                          title:
                              UniversityString.universityreport.toUpperCase(),
                          child: Column(
                            children: [
                              FxBox.h24,
                              _monthreport(),
                              FxBox.h36,
                              _chart(),
                              FxBox.h24,
                              const Divider(
                                  color: UniversityColor.boxgreylight),
                              FxBox.h16,
                              _sliderCard(),
                            ],
                          ),
                        ),
                      );
                    },
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
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 18.0),
              child: Column(
                children: [
                  FxBox.h24,
                  _monthreport(),
                  FxBox.h36,
                  _chart(),
                  FxBox.h24,
                  const Divider(color: UniversityColor.boxgreylight),
                  FxBox.h16,
                  _sliderCard(),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _sliderCard() {
    return SizedBox(
      height: (UniversityResponsive.isMobile(context) ||
              UniversityResponsive.isTablet(context))
          ? null
          : 80,
      child: ListView.builder(
        scrollDirection: (UniversityResponsive.isMobile(context) ||
                UniversityResponsive.isTablet(context))
            ? Axis.vertical
            : Axis.horizontal,
        itemCount: _sliderData.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 240,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomeSliderWithTextrow(
                  colors: [
                    _sliderData[index]['color']['color1'],
                    _sliderData[index]['color']['color2'],
                  ],
                  leadingText: _sliderData[index]['leading_text'],
                  trailingText: _sliderData[index]['trailing_text'],
                  percentage: _sliderData[index]['per'],
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                  child: CustomText(
                    title: 'COMPARED TO LAST YEAR',
                    fontSize: 10,
                    textColor: UniversityColor.boxgreylight,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _chart() {
    return SizedBox(
      height: 280.0,
      child: LineChart(
        LineChartData(
          minY: 0.0,
          maxY: 200.0,
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(
                  _chartDataOne.length,
                  (index) => FlSpot(
                      index.toDouble(), _chartDataOne[index].toDouble())),
              isCurved: true,
              barWidth: 2,
              color: UniversityColor.barColor,
              dotData: FlDotData(show: false),
            ),
            LineChartBarData(
              spots: List.generate(
                  _chartDataTwo.length,
                  (index) => FlSpot(
                      index.toDouble(), _chartDataTwo[index].toDouble())),
              isCurved: true,
              barWidth: 2,
              dotData: FlDotData(show: false),
              color: UniversityColor.yellow,
            ),
          ],
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              fitInsideHorizontally: true,
              tooltipRoundedRadius: 8.0,
              tooltipBgColor: UniversityColor.hintColor,
            ),
          ),
          titlesData: FlTitlesData(
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    space: 24.0,
                    child: const Text(
                      '',
                      maxLines: 1,
                    ),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                reservedSize: 40.0,
                getTitlesWidget: (value, meta) {
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    space: 24.0,
                    child: Text(
                      meta.formattedValue,
                      maxLines: 1,
                    ),
                  );
                },
                showTitles: true,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                getTitlesWidget: (value, meta) {
                  if (value % 1 != 0) {
                    return const SizedBox.shrink();
                  }
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    space: 4,
                    child: Text(
                      _bottom[value.toInt()],
                    ),
                  );
                },
                showTitles: true,
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          gridData: FlGridData(
            drawHorizontalLine: true,
            drawVerticalLine: false,
          ),
        ),
      ),
    );
  }

  Widget _monthreport() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
        ),
        height: 40.0,
        child: ListView.separated(
          padding: EdgeInsets.zero,
          itemCount: _reportData.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                tapIndex = index;
                setState(() {});
              },
              child: Container(
                width: 60.0,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: tapIndex == index
                            ? UniversityColor.blue
                            : Colors.grey.shade300),
                    color: tapIndex == index ? Colors.blue.shade50 : null),
                alignment: Alignment.center,
                child: CustomText(
                  title: _reportData[index],
                  fontSize: 14,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const VerticalDivider(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
    );
  }
}
