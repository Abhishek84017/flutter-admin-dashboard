import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/admin/constant/string.dart';

import 'package:admin_dashboard/src/admin/provider/table/datatable/bloc/data_table_bloc.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:admin_dashboard/src/ingrid/widget/datatable.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/icons.dart';
import 'package:admin_dashboard/src/university/utils/responsive.dart';
import 'package:auto_route/annotations.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class UniverityPayment extends StatefulWidget {
  const UniverityPayment({Key? key}) : super(key: key);

  @override
  State<UniverityPayment> createState() => _UniverityPaymentState();
}

class _UniverityPaymentState extends State<UniverityPayment> {
  final DataTableBloc _dataTableBloc = DataTableBloc();
  List<int> ls = List<int>.generate(57, (index) => index + 1);
  int _dropValue = 10;
  int _page = 0;

  int _start = 0;
  int _end = 10;

  final TextEditingController _searchContoller = TextEditingController();
  List<String> listData = [];
  List<String> universtiyColumn = [
    'ROLL NO',
    'STUDENT NAME',
    'FEES TYPE',
    'DATE',
    'INVOICE NO',
    'PAYMENT TYPE',
    'STATUS',
    'AMOUNT',
  ];

  final List<String> _universityStudentName = [
    'Corrine Johnson',
    'Gladys Smith',
    'Alice Smith'
  ];

  List<String> _searchList = [];

  final List<String> _feesType = ['Annual', 'Tuition', 'Transport'];
  final List<String> _datesubmited = [
    '12 March 2018',
    '24 Feb 2018',
    '12 Jan 2018'
  ];

  final List<String> _invoiceNo = ['IN-4916', 'IN-3695', 'IN-4578'];
  final List<String> _paymentType = ['cash', 'cheque', 'credit card'];
  final List<String> _status = ['paid', 'pending', 'unpaid'];
  final List<String> _amount = ['250\$', '448\$', '109\$'];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _dataTableBloc,
      child: SingleChildScrollView(
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: BlocBuilder<DataTableBloc, DataTableState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _listCounter(),
                    if (UniversityResponsive.isMobile(context) ||
                        UniversityResponsive.isTablet(context)) ...[
                      Align(
                          alignment: Alignment.bottomRight,
                          child: _searchField()),
                    ],
                    FxBox.h12,
                    DataTable3(
                      showBottomBorder: true,
                      columnSpacing: 12.0,
                      minWidth: 1000.0,
                      dataRowHeight: 48.0,
                      headingRowHeight: 48.0,
                      columns: [
                        DataColumn2(
                          size: ColumnSize.L,
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText(
                                title: universtiyColumn[0].toUpperCase(),
                                textColor: UniversityColor.boxgreylight,
                              ),
                              FxBox.w4,
                              InkWell(
                                onTap: () {},
                                child: Image.asset(
                                  UniversityIcon.filterSort,
                                  height: 14.0,
                                  color: UniversityColor.boxgreylight,
                                ),
                              ),
                            ],
                          ),
                        ),
                        DataColumn2(
                          size: ColumnSize.L,
                          fixedWidth: 150,
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText(
                                title: universtiyColumn[1].toUpperCase(),
                                textColor: UniversityColor.boxgreylight,
                              ),
                              FxBox.w4,
                              InkWell(
                                onTap: () {
                                  _universityStudentName
                                      .sort((a, b) => a.compareTo(b));
                                  _feesType.sort((a, b) => a.compareTo(b));
                                  _datesubmited.sort((a, b) => a.compareTo(b));
                                  _invoiceNo.sort((a, b) => a.compareTo(b));
                                  _paymentType.sort((a, b) => a.compareTo(b));
                                  _status.sort((a, b) => a.compareTo(b));
                                  _amount.sort((a, b) => a.compareTo(b));
                                  setState(() {});
                                },
                                child: Image.asset(
                                  UniversityIcon.filterSort,
                                  height: 14.0,
                                  color: UniversityColor.boxgreylight,
                                ),
                              ),
                            ],
                          ),
                        ),
                        DataColumn2(
                          size: ColumnSize.L,
                          fixedWidth: 100,
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText(
                                title: universtiyColumn[2].toUpperCase(),
                                textColor: UniversityColor.boxgreylight,
                              ),
                              FxBox.w4,
                              InkWell(
                                onTap: () {
                                  _universityStudentName
                                      .sort((a, b) => a.compareTo(b));
                                  _feesType.sort((a, b) => a.compareTo(b));
                                  _datesubmited.sort((a, b) => a.compareTo(b));
                                  _invoiceNo.sort((a, b) => a.compareTo(b));
                                  _paymentType.sort((a, b) => a.compareTo(b));
                                  _status.sort((a, b) => a.compareTo(b));
                                  _amount.sort((a, b) => a.compareTo(b));
                                  setState(() {});
                                },
                                child: Image.asset(
                                  UniversityIcon.filterSort,
                                  height: 14.0,
                                  color: UniversityColor.boxgreylight,
                                ),
                              ),
                            ],
                          ),
                        ),
                        DataColumn2(
                          size: ColumnSize.L,
                          fixedWidth: 110,
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText(
                                title: universtiyColumn[3].toUpperCase(),
                                textColor: UniversityColor.boxgreylight,
                              ),
                              FxBox.w4,
                              InkWell(
                                onTap: () {
                                  _universityStudentName
                                      .sort((a, b) => a.compareTo(b));
                                  _feesType.sort((a, b) => a.compareTo(b));
                                  _datesubmited.sort((a, b) => a.compareTo(b));
                                  _invoiceNo.sort((a, b) => a.compareTo(b));
                                  _paymentType.sort((a, b) => a.compareTo(b));
                                  _status.sort((a, b) => a.compareTo(b));
                                  _amount.sort((a, b) => a.compareTo(b));
                                  setState(() {});
                                },
                                child: Image.asset(
                                  UniversityIcon.filterSort,
                                  height: 14.0,
                                  color: UniversityColor.boxgreylight,
                                ),
                              ),
                            ],
                          ),
                        ),
                        DataColumn2(
                          size: ColumnSize.L,
                          fixedWidth: 110,
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText(
                                title: universtiyColumn[4].toUpperCase(),
                                textColor: UniversityColor.boxgreylight,
                              ),
                              FxBox.w4,
                              InkWell(
                                onTap: () {
                                  _universityStudentName
                                      .sort((a, b) => a.compareTo(b));
                                  _feesType.sort((a, b) => a.compareTo(b));
                                  _datesubmited.sort((a, b) => a.compareTo(b));
                                  _invoiceNo.sort((a, b) => a.compareTo(b));
                                  _paymentType.sort((a, b) => a.compareTo(b));
                                  _status.sort((a, b) => a.compareTo(b));
                                  _amount.sort((a, b) => a.compareTo(b));
                                  setState(() {});
                                },
                                child: Image.asset(
                                  UniversityIcon.filterSort,
                                  height: 14.0,
                                  color: UniversityColor.boxgreylight,
                                ),
                              ),
                            ],
                          ),
                        ),
                        DataColumn2(
                          size: ColumnSize.L,
                          fixedWidth: 150,
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText(
                                title: universtiyColumn[5].toUpperCase(),
                                textColor: UniversityColor.boxgreylight,
                              ),
                              FxBox.w4,
                              InkWell(
                                onTap: () {
                                  _universityStudentName
                                      .sort((a, b) => a.compareTo(b));
                                  _feesType.sort((a, b) => a.compareTo(b));
                                  _datesubmited.sort((a, b) => a.compareTo(b));
                                  _invoiceNo.sort((a, b) => a.compareTo(b));
                                  _paymentType.sort((a, b) => a.compareTo(b));
                                  _status.sort((a, b) => a.compareTo(b));
                                  _amount.sort((a, b) => a.compareTo(b));
                                  setState(() {});
                                },
                                child: Image.asset(
                                  UniversityIcon.filterSort,
                                  height: 14.0,
                                  color: UniversityColor.boxgreylight,
                                ),
                              ),
                            ],
                          ),
                        ),
                        DataColumn2(
                          size: ColumnSize.L,
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText(
                                title: universtiyColumn[6].toUpperCase(),
                                textColor: UniversityColor.boxgreylight,
                              ),
                              FxBox.w4,
                              InkWell(
                                onTap: () {
                                  _universityStudentName
                                      .sort((a, b) => a.compareTo(b));
                                  _feesType.sort((a, b) => a.compareTo(b));
                                  _datesubmited.sort((a, b) => a.compareTo(b));
                                  _invoiceNo.sort((a, b) => a.compareTo(b));
                                  _paymentType.sort((a, b) => a.compareTo(b));
                                  _status.sort((a, b) => a.compareTo(b));
                                  _amount.sort((a, b) => a.compareTo(b));
                                  setState(() {});
                                },
                                child: Image.asset(
                                  UniversityIcon.filterSort,
                                  height: 14.0,
                                  color: UniversityColor.boxgreylight,
                                ),
                              ),
                            ],
                          ),
                        ),
                        DataColumn2(
                          size: ColumnSize.L,
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText(
                                title: universtiyColumn[7].toUpperCase(),
                                textColor: UniversityColor.boxgreylight,
                              ),
                              FxBox.w4,
                              InkWell(
                                onTap: () {
                                  _universityStudentName
                                      .sort((a, b) => a.compareTo(b));
                                  _feesType.sort((a, b) => a.compareTo(b));
                                  _datesubmited.sort((a, b) => a.compareTo(b));
                                  _invoiceNo.sort((a, b) => a.compareTo(b));
                                  _paymentType.sort((a, b) => a.compareTo(b));
                                  _status.sort((a, b) => a.compareTo(b));
                                  _amount.sort((a, b) => a.compareTo(b));
                                  setState(() {});
                                },
                                child: Image.asset(
                                  UniversityIcon.filterSort,
                                  height: 14.0,
                                  color: UniversityColor.boxgreylight,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      rows: ls.getRange(_start, _end).map((e) {
                        listData = _searchList.isEmpty
                            ? _universityStudentName
                            : _searchList;
                        int repeatedIndex = e % listData.length;

                        return DataRow(
                          color: e % 2 == 0
                              ? MaterialStateColor.resolveWith(
                                  (states) => Colors.grey.shade100)
                              : null,
                          cells: [
                            DataCell(sizedBox(text: "$e")),
                            DataCell(sizedBox(text: listData[repeatedIndex])),
                            DataCell(sizedBox(text: _feesType[repeatedIndex])),
                            DataCell(
                                sizedBox(text: _datesubmited[repeatedIndex])),
                            DataCell(sizedBox(text: _invoiceNo[repeatedIndex])),
                            DataCell(
                                sizedBox(text: _paymentType[repeatedIndex])),
                            DataCell(
                              _status[repeatedIndex] == 'paid'
                                  ? ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        maximumSize: const Size(120, 45),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                      child: const Text('paid'),
                                    )
                                  : _status[repeatedIndex] == 'unpaid'
                                      ? ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                            maximumSize: const Size(120, 45),
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                          child: const Text('unpaid'),
                                        )
                                      : ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.orange,
                                            maximumSize: const Size(120, 45),
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                          child: const Text('cheque'),
                                        ),
                            ),
                            DataCell(sizedBox(text: _amount[repeatedIndex])),
                          ],
                        );
                      }).toList(),
                    ),
                    FxBox.h20,
                    Responsive.isMobile(context)
                        ? Column(
                            children: _paggination(),
                          )
                        : Row(
                            children: _paggination(),
                          )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _listCounter() {
    return Row(
      children: [
        const Text("Show   "),
        Container(
          height: 36.0,
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(
                color: Colors.grey.shade300,
              )),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              focusColor: Colors.transparent,
              items: <int>[10, 20, 50, 100].map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  _dropValue = value;
                  _start = 0;
                  _end = value < ls.length ? value : ls.length;
                  _page = 0;
                  _dataTableBloc.add(const DataTableEvent.rebuild());
                }
              },
              value: _dropValue,
            ),
          ),
        ),
        const Text(" entries"),
        const Spacer(),
        if (UniversityResponsive.isMobile(context) ||
            UniversityResponsive.isTablet(context))
          ...[]
        else ...[
          _searchField(),
        ],
      ],
    );
  }

  Widget _searchField() {
    return SizedBox(
      width: 160.0,
      height: 35.0,
      child: TextField(
        controller: _searchContoller,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2.0),
              borderSide: BorderSide(color: Colors.grey.shade200)),
        ),
        onChanged: (value) {
          _searchList.clear();
          _searchList = _universityStudentName.where((element) {
            return element
                .toLowerCase()
                .contains(_searchContoller.text.toLowerCase());
          }).toList();
          setState(() {});
        },
      ),
    );
  }

  List<Widget> _paggination() {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FxButton(
            onPressed: () {
              if (_page > 0) {
                _page = _page - 1;
                _dataTableBloc.add(const DataTableEvent.rebuild());
              }
              updateData();
            },
            text: 'Previous',
            borderRadius: 0.0,
            borderWidth: 0.0,
            color: UniversityColor.white,
            textColor: _page > 0 ? UniversityColor.blue : UniversityColor.black,
            hoverColor: UniversityColor.blue,
          ),
          Wrap(
            children: List.generate(
              (ls.length / _dropValue).ceil(),
              (index) => FxButton(
                text: '${index + 1}',
                borderRadius: 0.0,
                minWidth: 16.0,
                color: _page == index
                    ? UniversityColor.blue
                    : UniversityColor.white,
                hoverColor: UniversityColor.blue,
                textColor: _page == index
                    ? UniversityColor.white
                    : UniversityColor.blue,
                borderWidth: 0.0,
                onPressed: () {
                  _page = index;
                  updateData();
                  _dataTableBloc.add(const DataTableEvent.rebuild());
                },
              ),
            ),
          ),
          FxButton(
            onPressed: () {
              if (_page < (ls.length / _dropValue).ceil() - 1) {
                _page = _page + 1;
                _dataTableBloc.add(const DataTableEvent.rebuild());
              }

              updateData();
            },
            text: Strings.next,
            borderRadius: 0.0,
            borderWidth: 0.0,
            color: UniversityColor.white,
            textColor: UniversityColor.blue,
            hoverColor: UniversityColor.blue,
          ),
        ],
      )
    ];
  }

  Widget sizedBox({String? text, FontWeight? fontwidget = FontWeight.normal}) {
    return Text(
      '$text',
      softWrap: true,
      style: TextStyle(fontSize: 17, fontWeight: fontwidget),
    );
  }

  void updateData() {
    if (_page == 0) {
      _start = 0;
      _end = ls.length < _dropValue ? ls.length : _dropValue;
    } else {
      _start = _page * _dropValue;
      _end = _start + (ls.length < _dropValue ? ls.length : _dropValue);
      _end = _end < ls.length ? _end : ls.length;
    }
  }
}
