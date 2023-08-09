import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/admin/constant/text.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:admin_dashboard/src/university/view/admin/Transport/add_transport.dart';
import 'package:admin_dashboard/src/university/view/admin/Transport/transport_list.dart';
import 'package:admin_dashboard/src/university/widget/route_title.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class TransportScreen extends StatefulWidget {
  const TransportScreen({super.key});

  @override
  State<TransportScreen> createState() => _TransportScreenState();
}

class _TransportScreenState extends State<TransportScreen> {
  int changePageIndex = 0;
  int pageIndex = 1;
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
                  title: UniversityString.transportList,
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
                  title: UniversityString.addTransport,
                  fontSize: 16.0,
                  textColor: changePageIndex == 1
                      ? UniversityColor.blue
                      : UniversityColor.boxgreylight,
                ),
              ),
            ],
          ),
          FxBox.h24,
          changePageIndex == 0 ? const TransportList() : const AddTransport(),
          FxBox.h12,
          changePageIndex == 0 ? _buttons() : FxBox.shrink,
        ],
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
}
