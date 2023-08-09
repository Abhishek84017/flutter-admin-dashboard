import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:admin_dashboard/src/university/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _emailController =
      TextEditingController(text: 'louis.info@yourdomain.com');
  final TextEditingController _nameController =
      TextEditingController(text: 'louispierce');

  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _currentController = TextEditingController();
  final TextEditingController _newController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FxBox.h16,
            CustomText(
              title: UniversityString.changePassword.toUpperCase(),
              textColor: UniversityColor.primary,
              fontSize: 17.0,
            ),
            FxBox.h24,
            if (UniversityResponsive.isMobile(context) ||
                UniversityResponsive.isTablet(context)) ...[
              _textFeild(controller: _nameController, readOnly: true),
              FxBox.h12,
              _textFeild(controller: _emailController, hintText: 'Email'),
              FxBox.h12,
              _textFeild(
                  controller: _phoneNumberController, hintText: 'Phone Number'),
            ] else ...[
              Row(
                children: [
                  Expanded(
                      child: _textFeild(
                          controller: _nameController, readOnly: true)),
                  FxBox.w12,
                  Expanded(
                    child: _textFeild(
                        controller: _emailController, hintText: 'Email'),
                  ),
                  FxBox.w12,
                  Expanded(
                    child: _textFeild(
                        controller: _phoneNumberController,
                        hintText: 'Phone Number'),
                  ),
                ],
              ),
            ],
            FxBox.h24,
            Divider(color: Colors.grey.shade400),
            FxBox.h12,
            const CustomText(
              title: UniversityString.changePassword,
              textColor: UniversityColor.black,
              fontSize: 17.0,
            ),
            FxBox.h12,
            _textFeild(
                controller: _currentController, hintText: 'Current Password'),
            FxBox.h12,
            _textFeild(controller: _newController, hintText: 'New Password'),
            FxBox.h12,
            _textFeild(
              controller: _confirmController,
              hintText: 'Confirm New Password',
            ),
            FxBox.h24,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(60, 40),
                      backgroundColor: UniversityColor.primary),
                  onPressed: () {},
                  child: CustomText(
                    title: UniversityString.save.toUpperCase(),
                  ),
                ),
                FxBox.w12,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(60, 40),
                      backgroundColor: UniversityColor.white),
                  onPressed: () {},
                  child: CustomText(
                    title: UniversityString.cancel.toUpperCase(),
                    textColor: UniversityColor.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFeild(
      {required TextEditingController controller,
      int? minLines,
      int? maxLines = 1,
      String? hintText,
      Widget? prefixIcon,
      bool readOnly = false}) {
    return SizedBox(
      height: maxLines == 1 ? 40.0 : null,
      child: TextField(
        readOnly: readOnly,
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
}
