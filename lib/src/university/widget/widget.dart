import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

Widget textFeild({
  required TextEditingController controller,
  int? minLines,
  int? maxLines = 1,
  String? hintText,
  Widget? prefixIcon,
  Widget? suffixIcon,
  bool? enabled,
}) {
  return SizedBox(
    height: maxLines == 1 ? 40.0 : null,
    child: TextField(
      maxLines: maxLines,
      minLines: minLines,
      controller: controller,
      enabled: enabled,
      style: const TextStyle(color: UniversityColor.boxgreylight),
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
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

Widget titleWithStart({String? text, bool isRequired = false}) {
  return RichText(
    text: TextSpan(
      text: text,
      children: isRequired
          ? const [
              TextSpan(
                text: ' *',
                style: TextStyle(color: UniversityColor.red),
              )
            ]
          : null,
      style:
          const TextStyle(fontSize: 16.0, color: UniversityColor.boxgreylight),
    ),
  );
}

Widget dropdown({
  String? value,
  required List<String> dataList,
  required void Function(String?)? onChanged,
}) {
  return Container(
    height: 40.0,
    padding: const EdgeInsets.only(left: 12.0, right: 4.0),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4.0),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton(
          borderRadius: BorderRadius.circular(4.0),
          underline: FxBox.shrink,
          style: const TextStyle(
              color: UniversityColor.boxgreylight, fontSize: 16),
          value: value,
          onChanged: onChanged,
          items: dataList.map((String roomType) {
            return DropdownMenuItem<String>(
              value: roomType,
              child: Text(roomType),
            );
          }).toList()),
    ),
  );
}
