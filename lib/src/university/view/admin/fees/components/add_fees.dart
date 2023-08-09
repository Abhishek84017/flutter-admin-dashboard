import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:admin_dashboard/src/university/utils/responsive.dart';
import 'package:admin_dashboard/src/university/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

enum PaymentDuration { monthly, session, yearly }

class Addfees extends StatefulWidget {
  const Addfees({super.key});

  @override
  State<Addfees> createState() => _AddfeesState();
}

class _AddfeesState extends State<Addfees> {
  final TextEditingController _rollNo = TextEditingController();
  final TextEditingController _studentName = TextEditingController();
  final TextEditingController _collectionDate = TextEditingController();
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _paymentRefNo = TextEditingController();
  final TextEditingController _paymentDetails = TextEditingController();

  PaymentDuration _pduration = PaymentDuration.monthly;

// Department/class
  String _departmentValue = 'Select...';
  final List<String> _departmentClassList = [
    'Select...',
    'Mathematics',
    'Engineering',
    'Science',
    'M.B.A.',
    'Music',
  ];

  // Fees Type
  String _feesTypeValue = 'Select...';
  final List<String> _feesTypeList = [
    'Select...',
    'Annual',
    'Tuition',
    'Transport',
    'Exam',
    'Library',
  ];

  // Payment Method
  String _paymentMethodValue = 'Select...';
  final List<String> _paymentMethodList = [
    'Select...',
    'Cash',
    'Cheque',
    'Credit Card',
    'Debit Card',
    'Netbanking',
    'Other',
  ];

  // Payment status
  String _paymentStatusValue = 'Select...';
  final List<String> _paymentStatusList = [
    'Select...',
    'Paid',
    'Unpaid',
    'Pending',
  ];

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
              title: UniversityString.addLibrary.toUpperCase(),
              textColor: UniversityColor.primary,
              fontSize: 17.0,
            ),
            FxBox.h24,
            if (UniversityResponsive.isMobile(context) ||
                UniversityResponsive.isTablet(context)) ...[
              titleWithStart(text: UniversityString.rollNo, isRequired: true),
              FxBox.h10,
              textFeild(controller: _rollNo),
              FxBox.h16,
              titleWithStart(
                  text: UniversityString.studentName, isRequired: true),
              FxBox.h10,
              textFeild(controller: _studentName),
              FxBox.h16,
              titleWithStart(
                  text: UniversityString.departmentclass, isRequired: true),
              FxBox.h10,
              dropdown(
                dataList: _departmentClassList,
                value: _departmentValue,
                onChanged: (value) {
                  _departmentValue = value!;
                  setState(() {});
                },
              ),
              FxBox.h16,
              titleWithStart(text: UniversityString.feesType, isRequired: true),
              FxBox.h10,
              dropdown(
                dataList: _feesTypeList,
                value: _feesTypeValue,
                onChanged: (value) {
                  _feesTypeValue = value!;
                  setState(() {});
                },
              ),
              FxBox.h16,
              titleWithStart(
                  text: UniversityString.paymentDuration, isRequired: true),
              FxBox.h10,
              Row(
                children: [
                  Radio(
                    value: PaymentDuration.monthly,
                    groupValue: _pduration,
                    onChanged: (value) {
                      _pduration = value!;
                      setState(() {});
                    },
                  ),
                  FxBox.w4,
                  const CustomText(
                    title: 'Monthly',
                    textColor: UniversityColor.boxgreylight,
                  ),
                  FxBox.w4,
                  Radio(
                    value: PaymentDuration.session,
                    groupValue: _pduration,
                    onChanged: (value) {
                      _pduration = value!;
                      setState(() {});
                    },
                  ),
                  FxBox.w4,
                  const CustomText(
                    title: 'Session',
                    textColor: UniversityColor.boxgreylight,
                  ),
                  FxBox.w4,
                  Radio(
                    value: PaymentDuration.yearly,
                    groupValue: _pduration,
                    onChanged: (value) {
                      _pduration = value!;
                      setState(() {});
                    },
                  ),
                  FxBox.w4,
                  const CustomText(
                    title: 'Yearly',
                    textColor: UniversityColor.boxgreylight,
                  ),
                  FxBox.w4,
                ],
              ),
              FxBox.h16,
              titleWithStart(
                  text: UniversityString.collectonDate, isRequired: true),
              FxBox.h10,
              textFeild(controller: _collectionDate),
              FxBox.h16,
              titleWithStart(text: UniversityString.amount, isRequired: true),
              FxBox.h10,
              textFeild(controller: _amount),
              FxBox.h16,
              titleWithStart(
                  text: UniversityString.paymentMethod, isRequired: true),
              FxBox.h10,
              dropdown(
                dataList: _paymentMethodList,
                value: _paymentMethodValue,
                onChanged: (value) {
                  _paymentMethodValue = value!;
                  setState(() {});
                },
              ),
              FxBox.h16,
              titleWithStart(
                  text: UniversityString.paymentStatus, isRequired: true),
              FxBox.h10,
              dropdown(
                dataList: _paymentStatusList,
                value: _paymentStatusValue,
                onChanged: (value) {
                  _paymentStatusValue = value!;
                  setState(() {});
                },
              ),
              FxBox.h16,
              titleWithStart(
                  text: UniversityString.paymentRefeenceNo, isRequired: true),
              FxBox.h10,
              textFeild(controller: _paymentRefNo),
              FxBox.h16,
              titleWithStart(
                  text: UniversityString.paymentDetails, isRequired: true),
              FxBox.h10,
              textFeild(
                  controller: _paymentDetails,
                  hintText: 'Please type what you want..',
                  maxLines: 3),
              FxBox.h16,
              Row(
                children: [
                  Flexible(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(60, 40),
                          backgroundColor: UniversityColor.primary),
                      onPressed: () {},
                      child: const CustomText(
                        title: UniversityString.submit,
                      ),
                    ),
                  ),
                  FxBox.w8,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: UniversityColor.white,
                      minimumSize: const Size(60, 40),
                      side: const BorderSide(
                        color: UniversityColor.boxgreylight,
                      ),
                    ),
                    onPressed: () {},
                    child: const CustomText(
                      title: UniversityString.cancel,
                      textColor: UniversityColor.boxgreylight,
                    ),
                  ),
                ],
              ),
            ] else ...[
              Row(
                children: [
                  Expanded(
                      child: titleWithStart(
                          text: UniversityString.rollNo, isRequired: true)),
                  Expanded(flex: 3, child: textFeild(controller: _rollNo)),
                  Expanded(child: FxBox.shrink),
                ],
              ),
              FxBox.h16,
              Row(
                children: [
                  Expanded(
                      child: titleWithStart(
                          text: UniversityString.studentName,
                          isRequired: true)),
                  Expanded(flex: 3, child: textFeild(controller: _studentName)),
                  Expanded(child: FxBox.shrink),
                ],
              ),
              FxBox.h16,
              Row(
                children: [
                  Expanded(
                      child: titleWithStart(
                          text: UniversityString.departmentclass,
                          isRequired: true)),
                  Expanded(
                      flex: 3,
                      child: dropdown(
                        dataList: _departmentClassList,
                        value: _departmentValue,
                        onChanged: (value) {
                          _departmentValue = value!;
                          setState(() {});
                        },
                      )),
                  Expanded(child: FxBox.shrink),
                ],
              ),
              FxBox.h16,
              Row(
                children: [
                  Expanded(
                      child: titleWithStart(
                          text: UniversityString.feesType, isRequired: true)),
                  Expanded(
                      flex: 3,
                      child: dropdown(
                        dataList: _feesTypeList,
                        value: _feesTypeValue,
                        onChanged: (value) {
                          _feesTypeValue = value!;
                          setState(() {});
                        },
                      )),
                  Expanded(child: FxBox.shrink),
                ],
              ),
              FxBox.h16,
              Row(
                children: [
                  Expanded(
                      child: titleWithStart(
                          text: UniversityString.paymentDuration,
                          isRequired: true)),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Radio(
                          value: PaymentDuration.monthly,
                          groupValue: _pduration,
                          onChanged: (value) {
                            _pduration = value!;
                            setState(() {});
                          },
                        ),
                        FxBox.w4,
                        const CustomText(
                          title: 'Monthly',
                          textColor: UniversityColor.boxgreylight,
                        ),
                        FxBox.w4,
                        Radio(
                          value: PaymentDuration.session,
                          groupValue: _pduration,
                          onChanged: (value) {
                            _pduration = value!;
                            setState(() {});
                          },
                        ),
                        FxBox.w4,
                        const CustomText(
                          title: 'Session',
                          textColor: UniversityColor.boxgreylight,
                        ),
                        FxBox.w4,
                        Radio(
                          value: PaymentDuration.yearly,
                          groupValue: _pduration,
                          onChanged: (value) {
                            _pduration = value!;
                            setState(() {});
                          },
                        ),
                        FxBox.w4,
                        const CustomText(
                          title: 'Yearly',
                          textColor: UniversityColor.boxgreylight,
                        ),
                        FxBox.w4,
                      ],
                    ),
                  ),
                  Expanded(child: FxBox.shrink),
                ],
              ),
              FxBox.h16,
              Row(
                children: [
                  Expanded(
                      child: titleWithStart(
                          text: UniversityString.collectonDate,
                          isRequired: true)),
                  Expanded(
                      flex: 3, child: textFeild(controller: _collectionDate)),
                  Expanded(child: FxBox.shrink),
                ],
              ),
              FxBox.h16,
              Row(
                children: [
                  Expanded(
                      child: titleWithStart(
                          text: UniversityString.amount, isRequired: true)),
                  Expanded(flex: 3, child: textFeild(controller: _amount)),
                  Expanded(child: FxBox.shrink),
                ],
              ),
              FxBox.h16,
              Row(
                children: [
                  Expanded(
                      child: titleWithStart(
                          text: UniversityString.paymentMethod,
                          isRequired: true)),
                  Expanded(
                      flex: 3,
                      child: dropdown(
                        dataList: _paymentMethodList,
                        value: _paymentMethodValue,
                        onChanged: (value) {
                          _paymentMethodValue = value!;
                          setState(() {});
                        },
                      )),
                  Expanded(child: FxBox.shrink),
                ],
              ),
              FxBox.h16,
              Row(
                children: [
                  Expanded(
                      child: titleWithStart(
                          text: UniversityString.paymentStatus,
                          isRequired: true)),
                  Expanded(
                      flex: 3,
                      child: dropdown(
                        dataList: _paymentStatusList,
                        value: _paymentStatusValue,
                        onChanged: (value) {
                          _paymentStatusValue = value!;
                          setState(() {});
                        },
                      )),
                  Expanded(child: FxBox.shrink),
                ],
              ),
              FxBox.h16,
              Row(
                children: [
                  Expanded(
                      child: titleWithStart(
                          text: UniversityString.paymentRefeenceNo,
                          isRequired: true)),
                  Expanded(
                      flex: 3, child: textFeild(controller: _paymentRefNo)),
                  Expanded(child: FxBox.shrink),
                ],
              ),
              FxBox.h16,
              Row(
                children: [
                  Expanded(
                      child: titleWithStart(
                          text: UniversityString.paymentDetails,
                          isRequired: true)),
                  Expanded(
                      flex: 3,
                      child: textFeild(
                          controller: _paymentDetails,
                          hintText: 'Please type what you want..',
                          maxLines: 3)),
                  Expanded(child: FxBox.shrink),
                ],
              ),
              FxBox.h16,
              Row(
                children: [
                  Expanded(child: FxBox.shrink),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Flexible(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(60, 40),
                                backgroundColor: UniversityColor.primary),
                            onPressed: () {},
                            child: const CustomText(
                              title: UniversityString.submit,
                            ),
                          ),
                        ),
                        FxBox.w8,
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: UniversityColor.white,
                            minimumSize: const Size(60, 40),
                            side: const BorderSide(
                              color: UniversityColor.boxgreylight,
                            ),
                          ),
                          onPressed: () {},
                          child: const CustomText(
                            title: UniversityString.cancel,
                            textColor: UniversityColor.boxgreylight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: FxBox.shrink),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
