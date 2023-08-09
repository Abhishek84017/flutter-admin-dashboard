import 'package:admin_dashboard/src/university/view/university/library/add_library.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterx/flutterx.dart';

import '../../../../admin/constant/custom_text.dart';
import '../../../../admin/provider/table/datatable/bloc/data_table_bloc.dart';
import '../../../constant/colors.dart';
import '../../../constant/string.dart';
import '../../../widget/route_title.dart';
import 'library_list.dart';

@RoutePage()
class UniversityLibrary extends StatefulWidget {
  const UniversityLibrary({super.key});

  @override
  State<UniversityLibrary> createState() => _UniversityLibraryState();
}

class _UniversityLibraryState extends State<UniversityLibrary> {
  final DataTableBloc _dataTableBloc = DataTableBloc();
  int changePageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _dataTableBloc,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: Column(
            children: [
              const SizedBox(height: 15.0),
              Row(
                children: [
                  const RouteTitle(),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      changePageIndex = 1;
                      setState(() {});
                    },
                    child: CustomText(
                      title: UniversityString.listView,
                      fontSize: 16.0,
                      textColor: changePageIndex == 1
                          ? UniversityColor.blue
                          : UniversityColor.boxgreylight,
                    ),
                  ),
                  FxBox.w24,
                  GestureDetector(
                    onTap: () {
                      changePageIndex = 2;
                      setState(() {});
                    },
                    child: CustomText(
                      title: UniversityString.add,
                      fontSize: 16.0,
                      textColor: changePageIndex == 2
                          ? UniversityColor.blue
                          : UniversityColor.boxgreylight,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              if (changePageIndex == 1) LibraryList(bloc: _dataTableBloc),
              if (changePageIndex == 2) const AddLibrary(),
            ],
          ),
        ),
      ),
    );
  }
}
