import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/admin/utils/hover.dart';
import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/icons.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:admin_dashboard/src/university/utils/responsive.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class QuickAccess extends StatefulWidget {
  const QuickAccess({super.key});

  @override
  State<QuickAccess> createState() => _QuickAccessState();
}

class _QuickAccessState extends State<QuickAccess> {
  final List<List<dynamic>> _universityOption = [
    [UniversityString.professor, UniversityIcon.professor, 9],
    [UniversityString.contact, UniversityIcon.contact, 8],
    [UniversityString.staff, UniversityIcon.staff, 10],
    [UniversityString.fileManager, UniversityIcon.fileManager, 8],
    [UniversityString.library, UniversityIcon.library, 14],
    [UniversityString.holiday, UniversityIcon.department, 15],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: UniversityResponsive.isMobile(context) ||
              UniversityResponsive.isTablet(context)
          ? const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 120,
            )
          : MediaQuery.of(context).size.width < 1500
              ? const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 120,
                )
              : SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 120,
                ),
      shrinkWrap: true,
      itemCount: _universityOption.length,
      itemBuilder: (context, index) {
        return FxHover(builder: (isHover) {
          return GestureDetector(
            onTap: () {
              _navigate(index, context);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              elevation: isHover ? 1.0 : 0.0,
              child: Container(
                padding: const EdgeInsets.all(18.0),
                alignment: Alignment.center,
                child: Transform.scale(
                  scale: isHover ? 1.1 : 1.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgIcon(
                        icon: _universityOption[index][1],
                        size: 30.0,
                        color: UniversityColor.boxgreylight,
                      ),
                      FxBox.h6,
                      CustomText(
                        title: _universityOption[index][0],
                        textColor: UniversityColor.boxgreylight,
                        fontSize: 16.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      },
    );
  }
}

void _navigate(int index, BuildContext context) {
  switch (index) {
    case 0:
      {
        AutoTabsRouter.of(context).setActiveIndex(9);
      }
      break;
    // case 1:
    //   {
    //     // AutoTabsRouter.of(context).setActiveIndex(10);
    //   }
    //   break;
    case 2:
      {
        AutoTabsRouter.of(context).setActiveIndex(10);
      }
      break;
    // case 3:
    //   {
    //     // AutoTabsRouter.of(context).setActiveIndex(12);
    //   }
    //   break;
    case 4:
      {
        AutoTabsRouter.of(context).setActiveIndex(14);
      }
      break;
    case 5:
      {
        AutoTabsRouter.of(context).setActiveIndex(15);
      }
      break;
    case 6:
      {
        AutoTabsRouter.of(context).setActiveIndex(16);
      }

      break;

    default:
      {
        AutoTabsRouter.of(context).setActiveIndex(8);
      }
      break;
  }
}
