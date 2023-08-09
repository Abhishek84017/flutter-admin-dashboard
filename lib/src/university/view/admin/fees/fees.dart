import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:admin_dashboard/src/university/view/admin/fees/components/add_fees.dart';
import 'package:admin_dashboard/src/university/view/admin/fees/components/admin_payment.dart';
import 'package:admin_dashboard/src/university/view/admin/fees/components/fees_receipt.dart';
import 'package:admin_dashboard/src/university/widget/route_title.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class FeesView extends StatefulWidget {
  const FeesView({super.key});

  @override
  State<FeesView> createState() => _FeesViewState();
}

class _FeesViewState extends State<FeesView> {
  int changePageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: SingleChildScrollView(
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
                    title: UniversityString.list,
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
                    title: UniversityString.feesReeipt,
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
                    title: UniversityString.addFees,
                    fontSize: 16.0,
                    textColor: changePageIndex == 2
                        ? UniversityColor.blue
                        : UniversityColor.boxgreylight,
                  ),
                ),
              ],
            ),
            FxBox.h24,
            changePageIndex == 0
                ? const UniverityPayment()
                : changePageIndex == 1
                    ? const FeesReceipt()
                    : const Addfees()
          ],
        ),
      ),
    );
  }
}
