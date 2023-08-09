import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/admin/constant/icons.dart';
import 'package:admin_dashboard/src/admin/constant/string.dart';
import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/icons.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutterx/flutterx.dart';

class UniversityDrawer extends StatefulWidget {
  const UniversityDrawer({
    super.key,
    required this.tabsRouter,
    this.onPressed,
  });

  final TabsRouter tabsRouter;
  final void Function()? onPressed;

  @override
  State<UniversityDrawer> createState() => _UniversityDrawerState();
}

class _UniversityDrawerState extends State<UniversityDrawer>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final List<List<dynamic>> _adminOption = [
    [UniversityString.fees, UniversityIcon.fees, 0],
    [UniversityString.noticeboard, UniversityIcon.notiteboard, 1],
    [UniversityString.taskboard, UniversityIcon.taskboard, 2],
    [UniversityString.hostel, UniversityIcon.hostel, 3],
    [UniversityString.transport, UniversityIcon.transport, 4],
    [UniversityString.attendance, UniversityIcon.attendance, 5],
    [UniversityString.leave, UniversityIcon.leave, 6],
    [UniversityString.setting, UniversityIcon.setting, 7],
  ];
  final List<List<dynamic>> _universityOption = [
    [UniversityString.dashboard, UniversityIcon.dashboard, 8],
    [UniversityString.professor, UniversityIcon.professor, 9],
    [UniversityString.staff, UniversityIcon.staff, 10],
    [UniversityString.students, UniversityIcon.student, 11],
    [UniversityString.departments, UniversityIcon.department, 12],
    [UniversityString.courses, IconlyBroken.university, 13],
    [UniversityString.library, UniversityIcon.library, 14],
    [UniversityString.holiday, UniversityIcon.department, 15],
  ];

  final List<Widget> _tabs = [
    const Tab(
        child: CustomText(
      title: 'University',
      fontSize: 16.0,
    )),
    const Tab(
        child: CustomText(
      title: 'Admin',
      fontSize: 16.0,
    )),
  ];

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(29, 178, 174, 1),
              Color.fromRGBO(35, 165, 181, 1),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FxBox.h36,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: UniversityColor.black,
                    radius: 20,
                    child: SvgIcon(
                      icon: IconlyBroken.university,
                      color: UniversityColor.white,
                    ),
                  ),
                  FxBox.w20,
                  const CustomText(
                    title: Strings.university,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    textColor: UniversityColor.white,
                  ),
                ],
              ),
            ),
            FxBox.h28,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: TabBar(
                tabs: _tabs,
                indicatorColor: UniversityColor.white,
                controller: _tabController,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  kToolbarHeight -
                  kBottomNavigationBarHeight -
                  160,
              child: TabBarView(
                controller: _tabController,
                children: [
                  _universityTab(widget.tabsRouter),
                  _adminTab(widget.tabsRouter),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: widget.onPressed,
                icon: const Icon(
                  Icons.format_align_right_outlined,
                  color: UniversityColor.white,
                  size: 20.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.power_settings_new_outlined,
                  color: UniversityColor.white,
                  size: 20.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _universityTab(TabsRouter tabsRouter) {
    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      itemCount: _universityOption.length + 1,
      itemBuilder: (context, index) => FxBox.h12,
      separatorBuilder: (context, index) {
        final int itemIndex = index + 8;
        return InkWell(
          onTap: () {
            tabsRouter.setActiveIndex(_universityOption[index][2]);
          },
          borderRadius: BorderRadius.circular(12.0),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: SvgIcon(
                    icon: _universityOption[index][1],
                    color: UniversityColor.white,
                    size: 16.0,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    _universityOption[index][0],
                    style: TextStyle(
                      color: UniversityColor.white,
                      fontSize: 16.0,
                      fontWeight: itemIndex == tabsRouter.activeIndex
                          ? FontWeight.bold
                          : FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _adminTab(TabsRouter tabsRouter) {
    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      itemCount: _adminOption.length + 1,
      itemBuilder: (context, index) => FxBox.h12,
      separatorBuilder: (context, index) {
        return InkWell(
          onTap: () {
            tabsRouter.setActiveIndex(_adminOption[index][2]);
          },
          borderRadius: BorderRadius.circular(12.0),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: SvgIcon(
                    icon: _adminOption[index][1],
                    color: UniversityColor.white,
                    size: 16.0,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    _adminOption[index][0],
                    style: TextStyle(
                      color: UniversityColor.white,
                      fontSize: 16.0,
                      fontWeight: index == tabsRouter.activeIndex
                          ? FontWeight.bold
                          : FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
