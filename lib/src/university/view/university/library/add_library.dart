import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

import '../../../../admin/constant/custom_text.dart';
import '../../../constant/colors.dart';
import '../../../constant/string.dart';
import '../../../widget/widget.dart';

class AddLibrary extends StatefulWidget {
  const AddLibrary({super.key});

  @override
  State<AddLibrary> createState() => _AddLibraryState();
}

class _AddLibraryState extends State<AddLibrary> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _subject = TextEditingController();
  final TextEditingController _department = TextEditingController();
  final TextEditingController _type = TextEditingController();
  final TextEditingController _year = TextEditingController();
  final TextEditingController _status = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              title: UniversityString.addLibrary,
              textColor: UniversityColor.primary,
              fontSize: 17.0,
            ),
            FxBox.h24,
            textFeild(
              controller: _title,
              hintText: 'Enter Title',
            ),
            FxBox.h16,
            textFeild(
              controller: _subject,
              hintText: 'Enter Subject',
            ),
            FxBox.h16,
            textFeild(
              controller: _department,
              hintText: 'Department',
            ),
            FxBox.h16,
            textFeild(
              controller: _type,
              hintText: 'Enter Type',
            ),
            FxBox.h16,
            textFeild(
              controller: _year,
              hintText: 'Enter Year',
            ),
            FxBox.h16,
            textFeild(
              controller: _status,
              hintText: 'Enter Status',
            ),
            FxBox.h16,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(60, 40),
                backgroundColor: UniversityColor.primary,
              ),
              onPressed: () {},
              child: const CustomText(
                title: UniversityString.addLibrary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
