import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:admin_dashboard/src/university/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class Company extends StatefulWidget {
  final bool admin;
  const Company({super.key, required this.admin});

  @override
  State<Company> createState() => _CompanyState();
}

class _CompanyState extends State<Company> {
  final TextEditingController _companyName = TextEditingController();
  final TextEditingController _contactPerson =
      TextEditingController(text: 'Louis Pierce');
  final TextEditingController _mobileNumber =
      TextEditingController(text: '+1 882-635-7531');
  final TextEditingController _address = TextEditingController();
  final TextEditingController _email =
      TextEditingController(text: 'LouisPierce@example.com');
  final TextEditingController _weburl = TextEditingController();
  final TextEditingController _city = TextEditingController(text: 'New York');
  final TextEditingController _postalCode =
      TextEditingController(text: '91403');
  final TextEditingController _phoneNumber =
      TextEditingController(text: '818-978-7102');
  final TextEditingController _fax =
      TextEditingController(text: '818-978-7102');

  final List<String> _countryList = [
    '-- Select Country --',
    'Australia',
    'Belgium',
    'Canada',
    'Denmark',
    'France',
    'Germany',
    'India',
    'United States',
  ];

  final List<String> _stateProvinceList = [
    'California',
    'Alaska',
    'Alabama',
  ];

  String _countryValue = '-- Select Country --';
  String _stateValue = 'California';

  @override
  Widget build(BuildContext context) {
    return widget.admin == true
        ? Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: _information(),
          )
        : _information();
  }

  Widget _information() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxBox.h16,
          widget.admin == true
              ? CustomText(
                  title: UniversityString.companySetting.toUpperCase(),
                  textColor: UniversityColor.primary,
                  fontSize: 17.0,
                )
              : const CustomText(
                  title: UniversityString.basicInformation,
                  textColor: UniversityColor.primary,
                  fontSize: 17.0,
                ),
          FxBox.h24,
          if (UniversityResponsive.isMobile(context) ||
              UniversityResponsive.isTablet(context)) ...[
            _textWithHeader(
              isRequired: true,
              controller: _companyName,
              text: widget.admin == true
                  ? UniversityString.companyName
                  : UniversityString.enterName,
            ),
            FxBox.h12,
            _textWithHeader(
              isRequired: false,
              controller: _contactPerson,
              text: UniversityString.contactPerson,
            ),
            FxBox.h12,
            _textWithHeader(
              isRequired: true,
              controller: _mobileNumber,
              text: UniversityString.mobileNumber,
            ),
            FxBox.h12,
            _textWithHeader(
              isRequired: false,
              hintText: '44 Shirey Ave. West Chicago, IL 60185',
              controller: _address,
              text: UniversityString.address,
              maxLines: 2,
            ),
            FxBox.h12,
            _textWithHeader(
              isRequired: true,
              controller: _email,
              text: UniversityString.email,
              prefixIcon: Container(
                width: 40,
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.only(right: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.0),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),
                child: const Icon(Icons.mail_outline),
              ),
            ),
            FxBox.h12,
            _textWithHeader(
              isRequired: false,
              controller: _weburl,
              hintText: 'http://',
              text: UniversityString.websiterl,
              prefixIcon: Container(
                width: 40,
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.only(right: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.0),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),
                child: const Icon(Icons.language),
              ),
            ),
            FxBox.h12,
            _dropdownWithHeader(
              dataList: _countryList,
              value: _countryValue,
              text: UniversityString.counry,
              onChanged: (value) {
                _countryValue = value!;
                setState(() {});
              },
            ),
            FxBox.h12,
            _dropdownWithHeader(
              dataList: _stateProvinceList,
              value: _stateValue,
              text: UniversityString.stateProvince,
              onChanged: (value) {
                _stateValue = value!;
                setState(() {});
              },
            ),
            FxBox.h12,
            _textWithHeader(
              isRequired: false,
              controller: _city,
              text: UniversityString.city,
            ),
            FxBox.h12,
            _textWithHeader(
              isRequired: false,
              controller: _postalCode,
              text: UniversityString.postalCode,
            ),
            FxBox.h12,
            _textWithHeader(
              isRequired: false,
              controller: _phoneNumber,
              text: UniversityString.phoneNumber,
            ),
            FxBox.h12,
            _textWithHeader(
              isRequired: false,
              controller: _fax,
              text: UniversityString.fax,
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
                    isRequired: true,
                    controller: _companyName,
                    text: widget.admin == true
                        ? UniversityString.companyName
                        : UniversityString.enterName,
                  ),
                ),
                FxBox.w12,
                Expanded(
                  child: _textWithHeader(
                    isRequired: false,
                    controller: _contactPerson,
                    text: UniversityString.contactPerson,
                  ),
                ),
                FxBox.w12,
                Expanded(
                  child: _textWithHeader(
                    isRequired: true,
                    controller: _mobileNumber,
                    text: UniversityString.mobileNumber,
                  ),
                ),
              ],
            ),
            FxBox.h24,
            _textWithHeader(
              isRequired: false,
              hintText: '44 Shirey Ave. West Chicago, IL 60185',
              controller: _address,
              text: UniversityString.address,
              maxLines: 2,
            ),
            FxBox.h24,
            Row(
              children: [
                Expanded(
                  child: _textWithHeader(
                    isRequired: true,
                    controller: _email,
                    text: UniversityString.email,
                    prefixIcon: Container(
                      width: 40,
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.only(right: 10.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.0),
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      child: const Icon(Icons.mail_outline),
                    ),
                  ),
                ),
                FxBox.w12,
                Expanded(
                  child: _textWithHeader(
                    isRequired: false,
                    controller: _weburl,
                    hintText: 'http://',
                    text: UniversityString.websiterl,
                    prefixIcon: Container(
                      width: 40,
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.only(right: 10.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.0),
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      child: const Icon(Icons.language),
                    ),
                  ),
                ),
              ],
            ),
            FxBox.h24,
            Row(
              children: [
                if (widget.admin == true) ...[
                  Expanded(
                      child: _dropdownWithHeader(
                    dataList: _countryList,
                    value: _countryValue,
                    text: UniversityString.counry,
                    onChanged: (value) {
                      setState(() {
                        _countryValue = value!;
                      });
                    },
                  )),
                  FxBox.w12,
                ] else ...[
                  const SizedBox.shrink(),
                ],
                Expanded(
                    child: _dropdownWithHeader(
                  dataList: _stateProvinceList,
                  value: _stateValue,
                  text: UniversityString.stateProvince,
                  onChanged: (value) {
                    _stateValue = value!;
                    setState(() {});
                  },
                )),
                FxBox.w12,
                Expanded(
                  child: _textWithHeader(
                    isRequired: false,
                    controller: _city,
                    text: UniversityString.city,
                  ),
                ),
                FxBox.w12,
                Expanded(
                  child: _textWithHeader(
                    isRequired: false,
                    controller: _postalCode,
                    text: UniversityString.postalCode,
                  ),
                ),
              ],
            ),
            FxBox.h24,
            Row(
              children: [
                Expanded(
                  child: _textWithHeader(
                    isRequired: false,
                    controller: _phoneNumber,
                    text: UniversityString.phoneNumber,
                  ),
                ),
                FxBox.w12,
                Expanded(
                  child: _textWithHeader(
                    isRequired: false,
                    controller: _fax,
                    text: UniversityString.fax,
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

  Widget _dropdownWithHeader({
    bool isRequired = false,
    required String text,
    String? value,
    required List<String> dataList,
    required void Function(String?)? onChanged,
  }) {
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
