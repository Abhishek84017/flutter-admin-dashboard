import 'package:admin_dashboard/src/admin/provider/table/datatable/bloc/data_table_bloc.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/view/university/holidayCalender/components/addHoliday.dart';
import 'package:admin_dashboard/src/university/view/university/holidayCalender/components/calender.dart';
import 'package:admin_dashboard/src/university/view/university/holidayCalender/components/library_list.dart';
import 'package:admin_dashboard/src/university/widget/route_title.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class HolidayCalender extends StatefulWidget {
  const HolidayCalender({super.key});

  @override
  State<HolidayCalender> createState() => _HolidayCalenderState();
}

ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);
List<String> _holidagePageTab = ['Calender', 'List', 'Add'];

class _HolidayCalenderState extends State<HolidayCalender> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DataTableBloc>(
      create: (context) => DataTableBloc(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ValueListenableBuilder<int>(
            valueListenable: _selectedIndex,
            builder: (context, selectedIndex, _) {
              return Column(
                children: [
                  Row(
                    children: [
                      const RouteTitle(),
                      const Spacer(),
                      for (int i = 0; i <= 2; i++) ...[
                        TextButton(
                          onPressed: () {
                            _selectedIndex.value = i;
                          },
                          child: Text(
                            _holidagePageTab[i],
                            style: TextStyle(
                              color: selectedIndex == i
                                  ? UniversityColor.blue
                                  : UniversityColor.grey,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                      ]
                    ],
                  ),
                  FxBox.h12,
                  if (selectedIndex == 0) ...[
                    const CalenderHoliday(),
                  ] else if (selectedIndex == 1) ...[
                    LibraryList(
                      bloc: DataTableBloc(),
                    ),
                  ] else ...[
                    const AddHoliday(),
                  ]
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
