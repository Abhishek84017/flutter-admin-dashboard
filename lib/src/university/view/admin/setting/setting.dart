import 'package:admin_dashboard/src/admin/constant/custom_text.dart';

import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';

import 'package:admin_dashboard/src/university/view/admin/setting/components/change_password.dart';
import 'package:admin_dashboard/src/university/view/admin/setting/components/company.dart';
import 'package:admin_dashboard/src/university/view/admin/setting/components/email_view.dart';
import 'package:admin_dashboard/src/university/view/admin/setting/components/invoice.dart';
import 'package:admin_dashboard/src/university/view/admin/setting/components/localizations.dart';
import 'package:admin_dashboard/src/university/view/admin/setting/components/notification.dart';
import 'package:admin_dashboard/src/university/view/admin/setting/components/roles_permission.dart';
import 'package:admin_dashboard/src/university/widget/route_title.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int _tapIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (MediaQuery.of(context).size.width >= 1595) ...[
              Row(
                children: [
                  const RouteTitle(),
                  const Spacer(),
                  _tapBar(),
                ],
              ),
            ] else if (MediaQuery.of(context).size.width >= 1308 &&
                MediaQuery.of(context).size.width <= 1438) ...[
              Row(
                children: [
                  const RouteTitle(),
                  const Spacer(),
                  _tapBar(),
                ],
              ),
            ] else ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const RouteTitle(),
                  FxBox.h16,
                  _tapBar(),
                ],
              ),
            ],
            FxBox.h24,
            _selectScreen(_tapIndex),
          ],
        ),
      ),
    );
  }

  Widget _tapBar() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _tapBarButton(
            tapIndex: _tapIndex,
            isChange: _tapIndex == 0,
            title: UniversityString.company,
            onTap: () {
              _tapIndex = 0;
              setState(() {});
            },
          ),
          FxBox.w24,
          _tapBarButton(
            tapIndex: _tapIndex,
            isChange: _tapIndex == 1,
            title: UniversityString.localization,
            onTap: () {
              _tapIndex = 1;
              setState(() {});
            },
          ),
          FxBox.w24,
          _tapBarButton(
            tapIndex: _tapIndex,
            isChange: _tapIndex == 2,
            title: UniversityString.roleAndPermission,
            onTap: () {
              _tapIndex = 2;
              setState(() {});
            },
          ),
          FxBox.w24,
          _tapBarButton(
            tapIndex: _tapIndex,
            title: UniversityString.email,
            isChange: _tapIndex == 3,
            onTap: () {
              _tapIndex = 3;
              setState(() {});
            },
          ),
          FxBox.w24,
          _tapBarButton(
            tapIndex: _tapIndex,
            title: UniversityString.invoice,
            isChange: _tapIndex == 4,
            onTap: () {
              _tapIndex = 4;
              setState(() {});
            },
          ),
          FxBox.w24,
          _tapBarButton(
            tapIndex: _tapIndex,
            title: UniversityString.notification,
            isChange: _tapIndex == 5,
            onTap: () {
              _tapIndex = 5;
              setState(() {});
            },
          ),
          FxBox.w24,
          _tapBarButton(
            tapIndex: _tapIndex,
            title: UniversityString.changePassword,
            isChange: _tapIndex == 6,
            onTap: () {
              _tapIndex = 6;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  Widget _selectScreen(int tapIndex) {
    if (tapIndex == 0) {
      return  Company(admin: true,);
    } else if (tapIndex == 1) {
      return const Localization();
    } else if (tapIndex == 2) {
      return const RolePermission();
    } else if (tapIndex == 3) {
      return const EmailView();
    } else if (tapIndex == 4) {
      return const InvoiceView();
    } else if (tapIndex == 5) {
      return const NotificationView();
    } else {
      return const ChangePassword();
    }
  }

  Widget _tapBarButton(
      {void Function()? onTap,
      required String title,
      required int tapIndex,
      required bool isChange}) {
    return GestureDetector(
      onTap: onTap,
      child: CustomText(
        title: title,
        fontSize: 16.0,
        textColor:
            isChange ? UniversityColor.blue : UniversityColor.boxgreylight,
      ),
    );
  }
}
