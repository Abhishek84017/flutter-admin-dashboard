import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/admin/constant/text.dart';
import 'package:admin_dashboard/src/admin/widget/datatable.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:admin_dashboard/src/university/utils/responsive.dart';
import 'package:admin_dashboard/src/university/view/admin/hostel/hostel_data.dart';
import 'package:admin_dashboard/src/university/widget/route_title.dart';
import 'package:admin_dashboard/src/university/widget/widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class HostelScreen extends StatefulWidget {
  const HostelScreen({super.key});

  @override
  State<HostelScreen> createState() => _HostelScreenState();
}

class _HostelScreenState extends State<HostelScreen>
    with TickerProviderStateMixin {
  final List<String> _headerList = [
    'BLOCK',
    'ROOM NO',
    'TYPE',
    'NO OF BED',
    'AVAILABILITY',
    'COST PER BED',
  ];
  String _roomType = 'Select';
  final List<String> _dropDownList = [
    'Select',
    'Dorm Rooms',
    'Private Rooms',
    'Capsules',
    'Booking Hacks',
    'Pod-styled dorms',
    'Female Dorm'
  ];

  int pageIndex = 1;
  int changePageIndex = 0;

  // TextEditingController

  final TextEditingController _roomNo = TextEditingController();
  final TextEditingController _blockNo = TextEditingController();
  final TextEditingController _noOfBed = TextEditingController();
  final TextEditingController _costPerBed = TextEditingController();
  final TextEditingController _description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const RouteTitle(),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  changePageIndex = 0;
                  setState(() {});
                },
                child: CustomText(
                  title: UniversityString.roomList,
                  fontSize: 16.0,
                  textColor: changePageIndex == 0
                      ? UniversityColor.blue
                      : UniversityColor.boxgreylight,
                ),
              ),
              FxBox.w24,
              GestureDetector(
                onTap: () {
                  changePageIndex = 1;
                  setState(() {});
                },
                child: CustomText(
                  title: UniversityString.addRoom,
                  fontSize: 16.0,
                  textColor: changePageIndex == 1
                      ? UniversityColor.blue
                      : UniversityColor.boxgreylight,
                ),
              ),
            ],
          ),
          FxBox.h24,
          changePageIndex == 0 ? _hostelTable() : _addRoom(),
          FxBox.h12,
          changePageIndex == 0 ? _buttons() : FxBox.shrink,
        ],
      ),
    );
  }

  Widget _addRoom() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (UniversityResponsive.isMediumWeb(context) ||
                UniversityResponsive.isLargeWeb(context)) ...[
              Row(
                children: [
                  Expanded(
                      child: titleWithStart(text: UniversityString.roomName)),
                  Expanded(flex: 2, child: textFeild(controller: _roomNo)),
                  Expanded(child: FxBox.shrink),
                ],
              ),
              FxBox.h16,
              Row(
                children: [
                  Expanded(
                      child: titleWithStart(text: UniversityString.blockNo)),
                  Expanded(flex: 2, child: textFeild(controller: _blockNo)),
                  Expanded(child: FxBox.shrink),
                ],
              ),
              FxBox.h16,
              Row(
                children: [
                  Expanded(
                      child: titleWithStart(text: UniversityString.noOfBed)),
                  Expanded(flex: 2, child: textFeild(controller: _noOfBed)),
                  Expanded(child: FxBox.shrink),
                ],
              ),
              FxBox.h16,
              Row(
                children: [
                  Expanded(
                      child: titleWithStart(text: UniversityString.costPerBed)),
                  Expanded(flex: 2, child: textFeild(controller: _costPerBed)),
                  Expanded(child: FxBox.shrink),
                ],
              ),
              FxBox.h16,
              Row(
                children: [
                  Expanded(
                      child: titleWithStart(text: UniversityString.roomType)),
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
              textFeild(controller: _roomNo),
              FxBox.h20,
              titleWithStart(text: UniversityString.blockNo),
              FxBox.h10,
              textFeild(controller: _blockNo),
              FxBox.h20,
              titleWithStart(text: UniversityString.noOfBed),
              FxBox.h10,
              textFeild(controller: _noOfBed),
              FxBox.h20,
              titleWithStart(text: UniversityString.costPerBed),
              FxBox.h10,
              textFeild(controller: _costPerBed),
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
            value: _roomType,
            onChanged: (String? newValue) {
              setState(() {
                _roomType = newValue!;
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

  Widget _buttons() {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              pageIndex = index;
              setState(() {});
            },
            child: Container(
              width: index == 4
                  ? 70
                  : index == 0
                      ? 80
                      : 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(index == 0 ? 6.0 : 0.0),
                  topLeft: Radius.circular(index == 0 ? 6.0 : 0.0),
                  topRight: Radius.circular(index == 4 ? 6.0 : 0.0),
                  bottomRight: Radius.circular(index == 4 ? 6.0 : 0.0),
                ),
                border: Border.all(
                    width: pageIndex == index ? 3 : 1,
                    color: pageIndex == index
                        ? UniversityColor.blue.withOpacity(0.6)
                        : Colors.grey.shade300),
              ),
              child: ConstText.lightText(
                text: index == 0
                    ? 'Previous'
                    : index == 4
                        ? 'Next'
                        : '$index',
                textAlign: TextAlign.center,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: UniversityColor.blue,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _hostelTable() {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: DataTable3(
        showBottomBorder: true,
        columnSpacing: 20.0,
        minWidth: 728.0,
        dataRowHeight: 42.0,
        headingRowHeight: 46.0,
        columns: _headerList.map((headerText) {
          return DataColumn(
              label: CustomText(
            title: headerText,
            textColor: UniversityColor.boxgreylight,
          ));
        }).toList(),
        rows: hostelData.map((hostelData) {
          return DataRow(cells: [
            DataCell(CustomText(
              title: hostelData['block'],
            )),
            DataCell(CustomText(
              title: hostelData['room_no'],
            )),
            DataCell(CustomText(
              title: hostelData['type'],
            )),
            DataCell(CustomText(
              title: hostelData['no_of_bed'],
            )),
            DataCell(CustomText(
              title: hostelData['avaiability'],
            )),
            DataCell(CustomText(
              title: hostelData['cost_per_bed'],
            )),
          ]);
        }).toList(),
      ),
    );
  }
}
