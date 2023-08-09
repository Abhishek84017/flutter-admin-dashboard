import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/admin/widget/datatable.dart';
import 'package:admin_dashboard/src/university/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterx/flutterx.dart';

import '../../../../admin/constant/string.dart';
import '../../../../admin/provider/table/datatable/bloc/data_table_bloc.dart';
import '../../../../admin/utils/responsive.dart';
import '../../../constant/colors.dart';
import '../../../constant/icons.dart';
import '../../../constant/string.dart';
import 'library_data.dart';

class LibraryList extends StatefulWidget {
  final DataTableBloc bloc;
  const LibraryList({super.key, required this.bloc});

  @override
  State<LibraryList> createState() => _LibraryListState();
}

class _LibraryListState extends State<LibraryList> {
  int _dropValue = 10;
  int _page = 0;

  int _start = 0;
  int _end = 10;
  final List<Map<String, dynamic>> _dataList = libraryData;
  bool _isIndex = true;
  bool _isTitle = false;
  bool _isSubject = false;
  bool _isDepartment = false;
  bool _isYear = false;
  bool _isType = false;
  bool _isStatus = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<DataTableBloc, DataTableState>(
          builder: (context, state) {
            return Column(
              children: [
                Row(
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
                              _end = value < _dataList.length
                                  ? value
                                  : _dataList.length;
                              _page = 0;
                              widget.bloc.add(const DataTableEvent.rebuild());
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
                      // _searchField(),
                    ],
                  ],
                ),
                if (UniversityResponsive.isMobile(context) ||
                    UniversityResponsive.isTablet(context)) ...[
                  // Align(alignment: Alignment.bottomRight, child: _searchField()),
                ],
                FxBox.h12,
                DataTable3(
                  dividerThickness: 0.0,
                  columnSpacing: 20.0,
                  minWidth: 928.0,
                  dataRowHeight: 52.0,
                  headingRowHeight: 44.0,
                  columns: [
                    DataColumn2(
                      fixedWidth: 40,
                      size: ColumnSize.S,
                      label: Row(
                        children: [
                          const CustomText(title: '#'),
                          FxBox.w4,
                          InkWell(
                            onTap: () {
                              _isTitle = false;
                              _isSubject = false;
                              _isDepartment = false;
                              _isYear = false;
                              _isType = false;
                              _isStatus = false;
                              if (_isIndex) {
                                _dataList.sort(
                                    (a, b) => b['index'].compareTo(a['index']));
                              } else {
                                _dataList.sort(
                                    (a, b) => a['index'].compareTo(b['index']));
                              }
                              _isIndex = !_isIndex;
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
                        children: [
                          CustomText(
                            title: UniversityString.title.toUpperCase(),
                          ),
                          FxBox.w4,
                          InkWell(
                            onTap: () {
                              _isIndex = false;
                              _isSubject = false;
                              _isDepartment = false;
                              _isYear = false;
                              _isType = false;
                              _isStatus = false;
                              if (_isTitle) {
                                _dataList.sort(
                                    (a, b) => b['title'].compareTo(a['title']));
                              } else {
                                _dataList.sort(
                                    (a, b) => a['title'].compareTo(b['title']));
                              }
                              _isTitle = !_isTitle;
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
                      size: ColumnSize.S,
                      fixedWidth: 120,
                      label: Row(
                        children: [
                          CustomText(
                            title: UniversityString.subject.toUpperCase(),
                          ),
                          FxBox.w4,
                          InkWell(
                            onTap: () {
                              _isIndex = false;
                              _isTitle = false;
                              _isDepartment = false;
                              _isYear = false;
                              _isType = false;
                              _isStatus = false;
                              if (_isSubject) {
                                _dataList.sort((a, b) =>
                                    b['subject'].compareTo(a['subject']));
                              } else {
                                _dataList.sort((a, b) =>
                                    a['subject'].compareTo(b['subject']));
                              }
                              _isSubject != _isSubject;
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
                      fixedWidth: 200,
                      size: ColumnSize.S,
                      label: Row(
                        children: [
                          CustomText(
                            title: UniversityString.department.toUpperCase(),
                          ),
                          FxBox.w4,
                          InkWell(
                            onTap: () {
                              _isIndex = false;
                              _isTitle = false;
                              _isSubject = false;
                              _isYear = false;
                              _isType = false;
                              _isStatus = false;
                              if (_isDepartment) {
                                _dataList.sort((a, b) =>
                                    b['department'].compareTo(a['department']));
                              } else {
                                _dataList.sort((a, b) =>
                                    a['department'].compareTo(b['department']));
                              }
                              _isDepartment = !_isDepartment;
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
                      fixedWidth: 100,
                      size: ColumnSize.S,
                      label: Row(
                        children: [
                          CustomText(
                            title: UniversityString.year.toUpperCase(),
                          ),
                          FxBox.w4,
                          InkWell(
                            onTap: () {
                              _isIndex = false;
                              _isTitle = false;
                              _isSubject = false;
                              _isDepartment = false;
                              _isType = false;
                              _isStatus = false;
                              if (_isYear) {
                                _dataList.sort(
                                    (a, b) => b['year'].compareTo(a['year']));
                              } else {
                                _dataList.sort(
                                    (a, b) => a['year'].compareTo(b['year']));
                              }
                              _isYear = !_isYear;
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
                      fixedWidth: 100,
                      size: ColumnSize.S,
                      label: Row(
                        children: [
                          CustomText(
                            title: UniversityString.type.toUpperCase(),
                          ),
                          FxBox.w4,
                          InkWell(
                            onTap: () {
                              _isIndex = false;
                              _isTitle = false;
                              _isSubject = false;
                              _isDepartment = false;
                              _isYear = false;
                              _isStatus = false;
                              if (_isType) {
                                _dataList.sort(
                                    (a, b) => a['type'].compareTo(b['type']));
                              } else {
                                _dataList.sort(
                                    (a, b) => b['type'].compareTo(a['type']));
                              }
                              _isType = !_isType;
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
                      fixedWidth: 100,
                      size: ColumnSize.S,
                      label: Row(
                        children: [
                          CustomText(
                            title: UniversityString.status.toUpperCase(),
                          ),
                          FxBox.w4,
                          InkWell(
                            onTap: () {
                              _isIndex = false;
                              _isTitle = false;
                              _isSubject = false;
                              _isDepartment = false;
                              _isYear = false;
                              _isType = false;
                              if (_isStatus) {
                                _dataList.sort((a, b) =>
                                    b['status'].compareTo(a['status']));
                              } else {
                                _dataList.sort((a, b) =>
                                    a['status'].compareTo(b['status']));
                              }
                              _isStatus = !_isStatus;
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
                  rows: List.generate(
                    _dataList.getRange(_start, _end).length,
                    (index) {
                      final e =
                          _dataList.getRange(_start, _end).toList()[index];
                      return DataRow(
                        color: MaterialStateProperty.all(
                            index % 2 == 0 ? Colors.grey.shade100 : null),
                        cells: [
                          DataCell(CustomText(
                            title: '${e['index']}',
                          )),
                          DataCell(CustomText(
                            title: e['title'],
                          )),
                          DataCell(CustomText(
                            title: e['subject'],
                          )),
                          DataCell(CustomText(
                            title: e['department'],
                          )),
                          DataCell(CustomText(
                            title: e['year'],
                          )),
                          DataCell(CustomText(
                            title: e['type'],
                          )),
                          DataCell(CustomText(
                            title: e['status'],
                          )),
                        ],
                      );
                    },
                  ),
                ),
                FxBox.h20,
                Responsive.isMobile(context)
                    ? Column(children: _paggination())
                    : Row(children: _paggination())
              ],
            );
          },
        ),
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
                widget.bloc.add(const DataTableEvent.rebuild());
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
              (_dataList.length / _dropValue).ceil(),
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
                  widget.bloc.add(const DataTableEvent.rebuild());
                },
              ),
            ),
          ),
          FxButton(
            onPressed: () {
              if (_page < (_dataList.length / _dropValue).ceil() - 1) {
                _page = _page + 1;
                widget.bloc.add(const DataTableEvent.rebuild());
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

  void updateData() {
    if (_page == 0) {
      _start = 0;
      _end = _dataList.length < _dropValue ? _dataList.length : _dropValue;
    } else {
      _start = _page * _dropValue;
      _end = _start +
          (_dataList.length < _dropValue ? _dataList.length : _dropValue);
      _end = _end < _dataList.length ? _end : _dataList.length;
    }
  }
}
