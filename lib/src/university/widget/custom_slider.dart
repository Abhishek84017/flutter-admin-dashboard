import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class CustomeSliderWithTextrow extends StatelessWidget {
  const CustomeSliderWithTextrow({
    super.key,
    required this.leadingText,
    required this.trailingText,
    this.percentage,
    required this.colors,
    this.padding,
  });

  final String leadingText;
  final String trailingText;
  final double? percentage;
  final EdgeInsetsGeometry? padding;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                title: leadingText,
                textColor: UniversityColor.boxgrey,
              ),
              CustomText(
                title: trailingText,
                textColor: UniversityColor.boxgrey,
              ),
            ],
          ),
          FxBox.h16,
          CustomeSlider(
            colors: colors,
            percentage: percentage ?? 150,
          ),
        ],
      ),
    );
  }
}

class CustomeSlider extends StatelessWidget {
  const CustomeSlider({
    super.key,
    this.percentage,
    required this.colors,
  });

  final double? percentage;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 2.0,
          width: 300.0,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        Container(
          height: 2.0,
          width: percentage ?? 150.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: colors),
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ],
    );
  }
}
