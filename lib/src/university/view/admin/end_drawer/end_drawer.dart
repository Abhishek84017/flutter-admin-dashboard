import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:admin_dashboard/src/university/view/admin/end_drawer/components/results.dart';
import 'package:admin_dashboard/src/university/view/admin/end_drawer/components/statistics.dart';
import 'package:admin_dashboard/src/university/view/admin/end_drawer/components/student.dart';
import 'package:admin_dashboard/src/university/view/admin/end_drawer/components/todo.dart';
import 'package:flutter/material.dart';

class EndDrawer extends StatefulWidget {
  const EndDrawer({super.key});

  @override
  State<EndDrawer> createState() => _EndDrawerState();
}

class _EndDrawerState extends State<EndDrawer> with TickerProviderStateMixin {
  final List<Widget> _tabList = const [
    Tab(text: UniversityString.statistics),
    Tab(text: UniversityString.result),
    Tab(text: UniversityString.student),
    Tab(
      text: UniversityString.todo,
    ),
  ];
  late TabController _controller;
  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this, initialIndex: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      color: UniversityColor.white,
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 16.0),
      child: Column(
        children: [
          TabBar(
            padding: EdgeInsets.zero,
            controller: _controller,
            tabs: _tabList,
            labelPadding: EdgeInsets.zero,
            labelColor: UniversityColor.blue,
            unselectedLabelColor: Colors.grey,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height -
                kToolbarHeight -
                kBottomNavigationBarHeight +
                32,
            child: TabBarView(
              controller: _controller,
              children: const [
                StatisticsView(),
                ResultsView(),
                StudentsView(),
                ToDoView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
