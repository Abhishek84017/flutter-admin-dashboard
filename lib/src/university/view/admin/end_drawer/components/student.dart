import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/university/utils/extension.dart';
import 'package:admin_dashboard/src/university/view/admin/end_drawer/components/student_data.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class StudentsView extends StatefulWidget {
  const StudentsView({super.key});

  @override
  State<StudentsView> createState() => _StudentsViewState();
}

class _StudentsViewState extends State<StudentsView> {
  List<List<Map<String, dynamic>>> list = [];

  void _getOrderist() {
    list = studentlist.groupBy((p0) => p0['student_name'][0]).values.toList();
  }

  @override
  void initState() {
    _getOrderist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final list1 = list[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child:
                    CustomText(title: list1[0]['student_name'].toString()[0]),
              ),
              FxBox.h10,
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: list1.length,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    final element = list1[i];
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(
                          element['student_image'],
                        ),
                      ),
                      title: CustomText(
                        title: element['student_name'],
                        fontWeight: FontWeight.w500,
                      ),
                      subtitle: CustomText(
                        title: element['category'],
                      ),
                    );
                  }),
            ],
          );
        },
      ),
    );
  }
}
