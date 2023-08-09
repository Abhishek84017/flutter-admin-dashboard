import 'package:admin_dashboard/src/university/utils/responsive.dart';
import 'package:admin_dashboard/src/university/view/university/dashboard/components/exam_topper.dart';
import 'package:admin_dashboard/src/university/view/university/dashboard/components/new_student_list.dart';
import 'package:admin_dashboard/src/university/view/university/dashboard/components/performance_view.dart';
import 'package:admin_dashboard/src/university/view/university/dashboard/components/quick_access.dart';
import 'package:admin_dashboard/src/university/view/university/dashboard/components/university_report.dart';
import 'package:admin_dashboard/src/university/widget/route_title.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class UniversityDashboard extends StatefulWidget {
  const UniversityDashboard({super.key});

  @override
  State<UniversityDashboard> createState() => _UniversityDashboardState();
}

class _UniversityDashboardState extends State<UniversityDashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RouteTitle(),
            FxBox.h24,
            const QuickAccess(),
            FxBox.h16,
            const UniversityReport(),
            FxBox.h16,
            if (UniversityResponsive.isMobile(context) ||
                UniversityResponsive.isTablet(context)) ...[
              const ExamToppers(),
              FxBox.h16,
              const PerformanceView(),
            ] else ...[
              const Row(
                children: [
                  Expanded(child: ExamToppers()),
                  Expanded(child: PerformanceView()),
                ],
              ),
            ],
            FxBox.h16,
            const NewStudentList(),
          ],
        ),
      ),
    );
  }
}
