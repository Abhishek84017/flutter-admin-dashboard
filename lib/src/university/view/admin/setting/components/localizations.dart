import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:admin_dashboard/src/university/utils/responsive.dart';
import 'package:admin_dashboard/src/university/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:intl/intl.dart';

class Localization extends StatefulWidget {
  const Localization({super.key});

  @override
  State<Localization> createState() => _LocalizationState();
}

class _LocalizationState extends State<Localization> {
  final List<String> _defaultCountry = [
    'Germany',
    'Denmark',
    'India',
    'France',
    'USA',
  ];
  String _defaultCountryValue = 'Germany';
  final List<String> _currencyode = [
    'USD',
    'Pound',
    'EURO',
    'Ringgit',
  ];
  String _currencyodeValue = 'USD';

  final List<String> _defaultLanaguage = [
    'English',
    'Russian',
    'Arabic',
    'Hindi',
    'French',
  ];
  String _defaultLanaguageValue = 'English';

  final List<String> _dateFormat = [
    DateFormat('dd/MM/yyyy').format(DateTime.now()),
    DateFormat.yMMM().format(DateTime.now()),
    DateFormat.MMMEd().format(DateTime.now()),
    DateFormat.yMd().format(DateTime.now()),
    DateFormat.yMMMd().format(DateTime.now()),
  ];
  String _dateFormatValue = DateFormat('dd/MM/yyyy').format(DateTime.now());
  String _timeZoneValue = '10:45am Chicago (GMT-6)';

  final TextEditingController _currencySymbol =
      TextEditingController(text: '\$');

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
              title: UniversityString.basicSetting.toUpperCase(),
              textColor: UniversityColor.primary,
              fontSize: 17.0,
            ),
            FxBox.h24,
            if (UniversityResponsive.isMobile(context) ||
                UniversityResponsive.isTablet(context)) ...[
              dropdownWithHeader(
                dataList: _defaultCountry,
                value: _defaultCountryValue,
                text: UniversityString.defaultCountry,
                onChanged: (value) {
                  setState(() {
                    _defaultCountryValue = value!;
                  });
                },
              ),
              FxBox.h12,
              dropdownWithHeader(
                dataList: _dateFormat,
                value: _dateFormatValue,
                text: UniversityString.dateFormat,
                onChanged: (value) {
                  setState(() {
                    _dateFormatValue = value!;
                  });
                },
              ),
              FxBox.h12,
              dropdownWithHeader(
                dataList: ['10:45am Chicago (GMT-6)'],
                value: _timeZoneValue,
                text: UniversityString.timezone,
                onChanged: (value) {
                  setState(() {
                    _timeZoneValue = value!;
                  });
                },
              ),
              FxBox.h12,
              dropdownWithHeader(
                dataList: _defaultLanaguage,
                value: _defaultLanaguageValue,
                text: UniversityString.defaultLanguage,
                onChanged: (value) {
                  setState(() {
                    _defaultLanaguageValue = value!;
                  });
                },
              ),
              FxBox.h12,
              dropdownWithHeader(
                dataList: _currencyode,
                value: _currencyodeValue,
                text: UniversityString.currencyCode,
                onChanged: (value) {
                  setState(() {
                    _currencyodeValue = value!;
                  });
                },
              ),
              FxBox.h12,
              _textWithHeader(
                controller: _currencySymbol,
                text: UniversityString.currencySymbol,
              ),
              FxBox.h24,
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(60, 40),
                      backgroundColor: UniversityColor.primary),
                  onPressed: () {},
                  child: const CustomText(
                    title: UniversityString.save,
                  ),
                ),
              ),
            ] else ...[
              Row(
                children: [
                  Expanded(
                    child: dropdownWithHeader(
                      dataList: _defaultCountry,
                      value: _defaultCountryValue,
                      text: UniversityString.defaultCountry,
                      onChanged: (value) {
                        setState(() {
                          _defaultCountryValue = value!;
                        });
                      },
                    ),
                  ),
                  FxBox.w12,
                  Expanded(
                    child: dropdownWithHeader(
                      dataList: _dateFormat,
                      value: _dateFormatValue,
                      text: UniversityString.dateFormat,
                      onChanged: (value) {
                        setState(() {
                          _dateFormatValue = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              FxBox.h24,
              Row(
                children: [
                  Expanded(
                    child: dropdownWithHeader(
                      dataList: ['10:45am Chicago (GMT-6)'],
                      value: _timeZoneValue,
                      text: UniversityString.timezone,
                      onChanged: (value) {
                        setState(() {
                          _timeZoneValue = value!;
                        });
                      },
                    ),
                  ),
                  FxBox.w12,
                  Expanded(
                    child: dropdownWithHeader(
                      dataList: _defaultLanaguage,
                      value: _defaultLanaguageValue,
                      text: UniversityString.defaultLanguage,
                      onChanged: (value) {
                        setState(() {
                          _defaultLanaguageValue = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              FxBox.h24,
              Row(
                children: [
                  Expanded(
                    child: dropdownWithHeader(
                      dataList: _currencyode,
                      value: _currencyodeValue,
                      text: UniversityString.currencyCode,
                      onChanged: (value) {
                        setState(() {
                          _currencyodeValue = value!;
                        });
                      },
                    ),
                  ),
                  FxBox.w12,
                  Expanded(
                    child: _textWithHeader(
                      controller: _currencySymbol,
                      text: UniversityString.currencySymbol,
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
                  child: const CustomText(
                    title: UniversityString.save,
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
        titleWithStart(isRequired: isRequired, text: text),
        FxBox.h10,
        textFeild(
          controller: controller,
          hintText: hintText,
          maxLines: maxLines,
          minLines: minLines,
          prefixIcon: prefixIcon,
        ),
      ],
    );
  }

  Widget dropdownWithHeader(
      {bool isRequired = false,
      required String text,
      String? value,
      required List<String> dataList,
      required void Function(String?)? onChanged}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleWithStart(isRequired: isRequired, text: text),
        FxBox.h10,
        dropdown(
          dataList: dataList,
          value: value,
          onChanged: onChanged,
        )
      ],
    );
  }
}
