import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/utils/responsive.dart';
import 'package:admin_dashboard/src/university/view/university/departments/components/department_list.dart';
import 'package:admin_dashboard/src/university/widget/route_title.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class StudentView extends StatefulWidget {
  const StudentView({super.key});

  @override
  State<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentView> {
  final List<TextEditingController> _studentFormField =
      List.generate(4, (index) => TextEditingController());

  final List<String> _formFieldString = [
    'Roll No.',
    'Name',
    'Department',
    'Admission Date'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RouteTitle(),
            FxBox.h10,
            SizedBox(
              height: UniversityResponsive.isMobile(context) ||
                      UniversityResponsive.isTablet(context)
                  ? 300
                  : 100,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: UniversityResponsive.isMobile(context) ||
                          UniversityResponsive.isTablet(context)
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              for (int i = 0; i < 4; i++) ...[
                                Expanded(
                                  child: _textFeild(
                                    controller: _studentFormField[i],
                                    hintText: _formFieldString[i],
                                  ),
                                ),
                              ],
                              SizedBox(
                                height: 55,
                                width: 150,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: UniversityColor.primary,
                                  ),
                                  child: const Text(
                                    "Search",
                                    style: TextStyle(
                                      color: UniversityColor.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Row(
                          children: [
                            for (int i = 0; i < 4; i++) ...[
                              Expanded(
                                child: _textFeild(
                                  controller: _studentFormField[i],
                                  hintText: _formFieldString[i],
                                ),
                              ),
                              FxBox.w10,
                            ],
                            SizedBox(
                              height: 40,
                              width: 150,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: UniversityColor.primary,
                                ),
                                child: const Text(
                                  "Search",
                                  style: TextStyle(
                                    color: UniversityColor.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
            FxBox.h10,
            const DepartmentList(),
          ],
        ),
      ),
    );
  }
}

Widget _textFeild({
  required TextEditingController controller,
  int? minLines,
  int? maxLines = 1,
  String? hintText,
  Widget? prefixIcon,
}) {
  return SizedBox(
    child: TextField(
      maxLines: maxLines,
      minLines: minLines,
      controller: controller,
      style: const TextStyle(color: UniversityColor.boxgreylight),
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(color: UniversityColor.bluelight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
      ),
    ),
  );
}
