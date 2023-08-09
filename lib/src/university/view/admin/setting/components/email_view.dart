import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:admin_dashboard/src/university/utils/responsive.dart';

import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

enum EmailRadio { phpMail, smtp }

class EmailView extends StatefulWidget {
  const EmailView({super.key});

  @override
  State<EmailView> createState() => _EmailViewState();
}

class _EmailViewState extends State<EmailView> {
  final TextEditingController _emailFromAddress = TextEditingController();
  final TextEditingController _emailFromName = TextEditingController();
  final TextEditingController _smtpHost = TextEditingController();
  final TextEditingController _smtpUser = TextEditingController();
  final TextEditingController _smtpPassword = TextEditingController();
  final TextEditingController _smtpPort = TextEditingController();
  final TextEditingController _smtpAuthDomain = TextEditingController();

  final List<String> _securityList = [
    'None',
    'SSL',
    'TLS',
  ];
  String _securityValue = 'None';
  EmailRadio _character = EmailRadio.phpMail;

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
              title: UniversityString.smtpEmailsettings.toUpperCase(),
              textColor: UniversityColor.primary,
              fontSize: 17.0,
            ),
            FxBox.h24,
            Row(
              children: [
                Radio(
                  value: EmailRadio.phpMail,
                  groupValue: _character,
                  onChanged: (value) {
                    _character = value!;
                    setState(() {});
                  },
                ),
                FxBox.w4,
                const CustomText(
                  title: 'PHP Mail',
                  textColor: UniversityColor.boxgreylight,
                ),
                FxBox.w12,
                Radio(
                  value: EmailRadio.smtp,
                  groupValue: _character,
                  onChanged: (value) {
                    _character = value!;
                    setState(() {});
                  },
                ),
                FxBox.w4,
                const CustomText(
                  title: 'SMTP',
                  textColor: UniversityColor.boxgreylight,
                ),
              ],
            ),
            FxBox.h24,
            if (UniversityResponsive.isMobile(context) ||
                UniversityResponsive.isTablet(context)) ...[
              _textWithHeader(
                controller: _emailFromAddress,
                text: UniversityString.emailFromAddress,
              ),
              FxBox.h12,
              _textWithHeader(
                controller: _emailFromName,
                text: UniversityString.emailFromName,
              ),
              FxBox.h12,
              _textWithHeader(
                controller: _smtpHost,
                text: UniversityString.smtpHost.toUpperCase(),
              ),
              FxBox.h12,
              _textWithHeader(
                controller: _smtpUser,
                text: UniversityString.smtpUser.toUpperCase(),
              ),
              FxBox.h12,
              _textWithHeader(
                controller: _smtpPassword,
                text: UniversityString.smtpPassword.toUpperCase(),
              ),
              FxBox.h12,
              _textWithHeader(
                controller: _smtpPort,
                text: UniversityString.smtpPort.toUpperCase(),
              ),
              FxBox.h12,
              _dropdownWithHeader(
                dataList: _securityList,
                onChanged: (value) {
                  _securityValue = value!;
                  setState(() {});
                },
                value: _securityValue,
                text: UniversityString.smtpSecurity.toUpperCase(),
              ),
              FxBox.h12,
              _textWithHeader(
                controller: _smtpAuthDomain,
                text: UniversityString.smtpAuthDomain,
              ),
              FxBox.h24,
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(60, 40),
                      backgroundColor: UniversityColor.primary),
                  onPressed: () {},
                  child: CustomText(
                    title: UniversityString.save.toUpperCase(),
                  ),
                ),
              ),
            ] else ...[
              Row(
                children: [
                  Expanded(
                    child: _textWithHeader(
                      controller: _emailFromAddress,
                      text: UniversityString.emailFromAddress,
                    ),
                  ),
                  FxBox.w12,
                  Expanded(
                    child: _textWithHeader(
                      controller: _emailFromName,
                      text: UniversityString.emailFromName,
                    ),
                  ),
                ],
              ),
              FxBox.h24,
              Row(
                children: [
                  Expanded(
                    child: _textWithHeader(
                      controller: _smtpHost,
                      text: UniversityString.smtpHost.toUpperCase(),
                    ),
                  ),
                  FxBox.w12,
                  Expanded(
                    child: _textWithHeader(
                      controller: _smtpUser,
                      text: UniversityString.smtpUser.toUpperCase(),
                    ),
                  ),
                ],
              ),
              FxBox.h24,
              Row(
                children: [
                  Expanded(
                    child: _textWithHeader(
                      controller: _smtpPassword,
                      text: UniversityString.smtpPassword.toUpperCase(),
                    ),
                  ),
                  FxBox.w12,
                  Expanded(
                    child: _textWithHeader(
                      controller: _smtpPort,
                      text: UniversityString.smtpPort.toUpperCase(),
                    ),
                  ),
                ],
              ),
              FxBox.h24,
              Row(
                children: [
                  Expanded(
                    child: _dropdownWithHeader(
                      dataList: _securityList,
                      onChanged: (value) {
                        _securityValue = value!;
                        setState(() {});
                      },
                      value: _securityValue,
                      text: UniversityString.smtpSecurity.toUpperCase(),
                    ),
                  ),
                  FxBox.w12,
                  Expanded(
                    child: _textWithHeader(
                      controller: _smtpAuthDomain,
                      text: UniversityString.smtpAuthDomain,
                    ),
                  ),
                ],
              ),
              FxBox.h24,
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(60, 40),
                      backgroundColor: UniversityColor.primary),
                  onPressed: () {},
                  child: CustomText(
                    title: UniversityString.save.toUpperCase(),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _textWithHeader({
    bool isRequired = false,
    required String text,
    required TextEditingController controller,
    int? minLines,
    int? maxLines = 1,
    String? hintText,
    Widget? prefixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleWithStart(isRequired: isRequired, text: text),
        FxBox.h10,
        _textFeild(
          controller: controller,
          hintText: hintText,
          maxLines: maxLines,
          minLines: minLines,
          prefixIcon: prefixIcon,
        ),
      ],
    );
  }

  Widget _textFeild({
    required TextEditingController controller,
    int? minLines,
    int? maxLines = 1,
    String? hintText,
    Widget? prefixIcon,
  }) {
    return SizedBox(
      height: maxLines == 1 ? 40.0 : null,
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

  Widget _dropdownWithHeader(
      {bool isRequired = false,
      required String text,
      String? value,
      required List<String> dataList,
      required void Function(String?)? onChanged}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleWithStart(isRequired: isRequired, text: text),
        FxBox.h10,
        _dropdown(
          dataList: dataList,
          value: value,
          onChanged: onChanged,
        )
      ],
    );
  }

  Widget _titleWithStart({String? text, bool isRequired = false}) {
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
        style: const TextStyle(
            fontSize: 16.0, color: UniversityColor.boxgreylight),
      ),
    );
  }

  Widget _dropdown({
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
}
