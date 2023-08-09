import 'package:admin_dashboard/src/admin/constant/string.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/utils/extension.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class RouteTitle extends StatelessWidget {
  const RouteTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.router.currentPath.split('/').last.route,
          style: const TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        FxBox.h4,
        RichText(
          text: TextSpan(
            text: Strings.university.toUpperCase(),
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: UniversityColor.blue,
            ),
            children: [
              const TextSpan(
                text: ' / ',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: UniversityColor.boxgrey,
                ),
              ),
              TextSpan(
                text: context.router.currentPath
                    .split('/')
                    .last
                    .route
                    .toUpperCase(),
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: UniversityColor.boxgrey,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
