import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:admin_dashboard/src/university/utils/responsive.dart';
import 'package:admin_dashboard/src/university/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:intl/intl.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController _taskNo = TextEditingController();
  final TextEditingController _jobitle = TextEditingController();

  final TextEditingController _description = TextEditingController();

  final List<String> _dropDownList = [
    'Select',
    'John Smith',
    'Claire Peters',
    'Allen Collins',
    'Cory Carter',
    'Rochelle Barton'
  ];

  String _teamValue = 'Select';

  DateTime? _selectedDate;
  DateTime? _selectedDatesecond;
  bool isSelectFirst = false;
  bool isSelectSecond = false;

  Future<void> _selectDate(BuildContext context, bool isSecond) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );

    if (picked != null) {
      if (isSecond) {
        setState(() {
          _selectedDatesecond = picked;
        });
      } else {
        setState(() {
          _selectedDate = picked;
        });
      }
    }
  }

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
            const CustomText(
              title: UniversityString.addtask,
              textColor: UniversityColor.primary,
              fontSize: 17.0,
            ),
            FxBox.h24,
            if (UniversityResponsive.isMediumWeb(context) ||
                UniversityResponsive.isLargeWeb(context)) ...[
              Row(
                children: [
                  Expanded(
                      child: titleWithStart(text: UniversityString.taskNo)),
                  Expanded(flex: 2, child: textFeild(controller: _taskNo)),
                  Expanded(child: FxBox.shrink),
                ],
              ),
              FxBox.h16,
              Row(
                children: [
                  Expanded(
                      child: titleWithStart(text: UniversityString.jobTitle)),
                  Expanded(flex: 2, child: textFeild(controller: _jobitle)),
                  Expanded(child: FxBox.shrink),
                ],
              ),
              FxBox.h16,
              Row(
                children: [
                  Expanded(
                      child: titleWithStart(text: UniversityString.selecteam)),
                  Expanded(flex: 2, child: _dropdown()),
                  Expanded(child: FxBox.shrink),
                ],
              ),
              FxBox.h16,
              Row(
                children: [
                  Expanded(
                      child:
                          titleWithStart(text: UniversityString.description)),
                  Expanded(
                    flex: 2,
                    child: textFeild(
                        controller: _description,
                        minLines: 4,
                        maxLines: null,
                        hintText: 'Please type what you want...'),
                  ),
                  Expanded(child: FxBox.shrink),
                ],
              ),
              FxBox.h16,
              Row(
                children: [
                  Expanded(child: titleWithStart(text: UniversityString.range)),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              isSelectSecond = false;
                              isSelectFirst = true;
                              await _selectDate(context, false);
                            },
                            child: Container(
                              height: 38.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.0),
                                border: Border.all(
                                    color: isSelectFirst
                                        ? Colors.blue.shade300
                                        : Colors.grey.shade300),
                              ),
                              child: CustomText(
                                title: _selectedDate != null
                                    ? DateFormat.yMd().format(_selectedDate!)
                                    : '',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 38.0,
                          width: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: const CustomText(
                            title: 'to',
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              isSelectFirst = false;
                              isSelectSecond = true;
                              await _selectDate(context, true);
                            },
                            child: Container(
                              height: 38.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.0),
                                border: Border.all(
                                    color: isSelectSecond
                                        ? Colors.blue.shade300
                                        : Colors.grey.shade300),
                              ),
                              child: CustomText(
                                title: _selectedDatesecond != null
                                    ? DateFormat.yMd()
                                        .format(_selectedDatesecond!)
                                    : '',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: FxBox.shrink),
                ],
              ),
              FxBox.h16,
              Row(
                children: [
                  Expanded(child: FxBox.shrink),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(60, 40),
                              backgroundColor: UniversityColor.primary),
                          onPressed: () {},
                          child: const CustomText(
                            title: UniversityString.submit,
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
                  FxBox.h16,
                ],
              ),
            ] else ...[
              titleWithStart(text: UniversityString.roomName),
              FxBox.h10,
              textFeild(controller: _taskNo),
              FxBox.h20,
              titleWithStart(text: UniversityString.blockNo),
              FxBox.h10,
              textFeild(controller: _jobitle),
              FxBox.h20,
              titleWithStart(text: UniversityString.roomType),
              FxBox.h10,
              _dropdown(),
              FxBox.h20,
              titleWithStart(text: UniversityString.description),
              FxBox.h10,
              textFeild(
                  controller: _description,
                  minLines: 4,
                  maxLines: null,
                  hintText: 'Please type what you want...'),
              FxBox.h20,
              titleWithStart(text: UniversityString.range),
              FxBox.h10,
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        isSelectSecond = false;
                        isSelectFirst = true;
                        await _selectDate(context, false);
                      },
                      child: Container(
                        height: 38.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0),
                          border: Border.all(
                              color: isSelectFirst
                                  ? Colors.blue.shade300
                                  : Colors.grey.shade300),
                        ),
                        child: CustomText(
                          title: _selectedDate != null
                              ? DateFormat.yMd().format(_selectedDate!)
                              : '',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 38.0,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: const CustomText(
                      title: 'to',
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        isSelectSecond = true;
                        isSelectFirst = false;
                        await _selectDate(context, true);
                      },
                      child: Container(
                        height: 38.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0),
                          border: Border.all(
                              color: isSelectSecond
                                  ? Colors.blue.shade300
                                  : Colors.grey.shade300),
                        ),
                        child: CustomText(
                          title: _selectedDatesecond != null
                              ? DateFormat.yMd().format(_selectedDatesecond!)
                              : '',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              FxBox.h20,
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(60, 40),
                        backgroundColor: UniversityColor.primary),
                    onPressed: () {},
                    child: const CustomText(
                      title: UniversityString.submit,
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
            ],
          ],
        ),
      ),
    );
  }

  Widget _dropdown() {
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
            value: _teamValue,
            onChanged: (String? newValue) {
              setState(() {
                _teamValue = newValue!;
              });
            },
            items: _dropDownList.map((String roomType) {
              return DropdownMenuItem<String>(
                value: roomType,
                child: Text(roomType),
              );
            }).toList()),
      ),
    );
  }
}
