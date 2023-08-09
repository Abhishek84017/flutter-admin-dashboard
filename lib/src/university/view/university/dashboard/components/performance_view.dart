import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:admin_dashboard/src/university/widget/university_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class PerformanceView extends StatefulWidget {
  const PerformanceView({super.key});

  @override
  State<PerformanceView> createState() => _PerformanceViewState();
}

class _PerformanceViewState extends State<PerformanceView> {
  int selectedDataSetIndex = -1;

  @override
  Widget build(BuildContext context) {
    return UniversityCard(
      child: GestureDetector(
        onTap: () {
          selectedDataSetIndex = -1;
          setState(() {});
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              title: UniversityString.performance.toUpperCase(),
              textColor: UniversityColor.primary,
              fontSize: 17.0,
            ),
            FxBox.h24,
            SizedBox(
              height: 300,
              child: RadarChart(
                swapAnimationDuration: const Duration(milliseconds: 400),
                RadarChartData(
                  getTitle: (index, angle) {
                    switch (index) {
                      case 0:
                        return const RadarChartTitle(
                          text: UniversityString.sales,
                        );
                      case 2:
                        return const RadarChartTitle(
                          text: UniversityString.expense,
                        );
                      case 1:
                        return const RadarChartTitle(
                          text: UniversityString.income,
                        );
                      default:
                        return const RadarChartTitle(text: '');
                    }
                  },
                  radarBackgroundColor: Colors.transparent,
                  borderData: FlBorderData(show: false),
                  radarBorderData: const BorderSide(color: Colors.transparent),
                  titlePositionPercentageOffset: 0.2,
                  dataSets: showingDataSets(),
                  tickCount: 1,
                  ticksTextStyle:
                      const TextStyle(color: Colors.transparent, fontSize: 10),
                  tickBorderData: const BorderSide(color: Colors.transparent),
                  gridBorderData:
                      BorderSide(color: Colors.grey.shade300, width: 2),
                ),
              ),
            ),
            _chartFooter(),
          ],
        ),
      ),
    );
  }

  List<RadarDataSet> showingDataSets() {
    return rawDataSets().asMap().entries.map((entry) {
      final index = entry.key;
      final rawDataSet = entry.value;

      final isSelected = index == selectedDataSetIndex ? true : false;

      return RadarDataSet(
        fillColor:
            isSelected ? rawDataSet.color : rawDataSet.color.withOpacity(0.5),
        borderColor: isSelected ? rawDataSet.color : rawDataSet.color,
        entryRadius: isSelected ? 3 : 2,
        dataEntries:
            rawDataSet.values.map((e) => RadarEntry(value: e)).toList(),
        borderWidth: isSelected ? 2.3 : 2,
      );
    }).toList();
  }

  List<RawDataSet> rawDataSets() {
    return [
      RawDataSet(
        title: UniversityString.sales,
        color: UniversityColor.primary,
        values: [
          300,
          50,
          250,
        ],
      ),
      RawDataSet(
        title: UniversityString.income,
        color: UniversityColor.barColor,
        values: [
          250,
          100,
          200,
        ],
      ),
      RawDataSet(
        title: UniversityString.expense,
        color: UniversityColor.blue,
        values: [
          200,
          150,
          50,
        ],
      ),
    ];
  }

  Widget _chartFooter() {
    return GestureDetector(
      onTap: () {
        selectedDataSetIndex = -1;
        setState(() {});
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rawDataSets()
            .asMap()
            .map((index, value) {
              final isSelected = index == selectedDataSetIndex;
              return MapEntry(
                index,
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDataSetIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    height: 26,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(46),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 6,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInToLinear,
                          padding: EdgeInsets.all(isSelected ? 8 : 6),
                          decoration: BoxDecoration(
                            color: value.color,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInToLinear,
                          style: TextStyle(
                            color: isSelected
                                ? value.color
                                : UniversityColor.black,
                          ),
                          child: Text(value.title),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })
            .values
            .toList(),
      ),
    );
  }
}

class RawDataSet {
  RawDataSet({
    required this.title,
    required this.color,
    required this.values,
  });

  final String title;
  final Color color;
  final List<double> values;
}
