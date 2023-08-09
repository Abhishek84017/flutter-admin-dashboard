import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/university/constant/icons.dart';
import 'package:admin_dashboard/src/university/utils/responsive.dart';
import 'package:admin_dashboard/src/university/view/university/course/course_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterx/flutterx.dart';

import '../../../../admin/constant/image.dart';
import '../../../constant/colors.dart';

class CourseList extends StatelessWidget {
  const CourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: UniversityResponsive.isMobile(context) ||
              UniversityResponsive.isTablet(context)
          ? 1
          : UniversityResponsive.isSmallWeb(context) ||
                  UniversityResponsive.isMediumWeb(context)
              ? 2
              : 3,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      itemCount: courseData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: UniversityColor.boxgreylight.withOpacity(0.25),
            ),
          ),
          clipBehavior: Clip.hardEdge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                courseData[index]['image'],
                height: 208.0,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
              FxBox.h20,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  courseData[index]['title'],
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: UniversityColor.black,
                  ),
                ),
              ),
              FxBox.h8,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Look, my liege! The Knights Who Say Ni demand a sacrifice!',
                  style: TextStyle(color: UniversityColor.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              FxBox.h20,
              Divider(
                height: 0.0,
                color: UniversityColor.boxgreylight.withOpacity(0.25),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 16.0),
                child: Row(
                  children: [
                    const SvgIcon(
                      icon: UniversityIcon.calendar,
                      size: 16.0,
                      color: UniversityColor.blue,
                    ),
                    FxBox.w12,
                    const Text(
                      'Duration',
                      style: TextStyle(color: UniversityColor.black),
                    ),
                    FxBox.w12,
                    const Spacer(),
                    Text(
                      index == 1 || index == 4 ? '1 Year' : '6 Months',
                      style: const TextStyle(color: UniversityColor.black),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 0.0,
                color: UniversityColor.boxgreylight.withOpacity(0.25),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 16.0),
                child: Row(
                  children: [
                    const SvgIcon(
                      icon: UniversityIcon.fees,
                      size: 16.0,
                      color: UniversityColor.red,
                    ),
                    FxBox.w12,
                    const Text(
                      'Fees',
                      style: TextStyle(color: UniversityColor.black),
                    ),
                    FxBox.w12,
                    const Spacer(),
                    const Text(
                      '\$1,674',
                      style: TextStyle(color: UniversityColor.black),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 0.0,
                color: UniversityColor.boxgreylight.withOpacity(0.25),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 16.0),
                child: Row(
                  children: [
                    const SvgIcon(
                      icon: UniversityIcon.department,
                      size: 16.0,
                      color: UniversityColor.yellow,
                    ),
                    FxBox.w12,
                    const Text(
                      'Students',
                      style: TextStyle(color: UniversityColor.black),
                    ),
                    FxBox.w12,
                    const Spacer(),
                    Text(
                      index == 1 || index == 4 ? '50+' : '125+',
                      style: const TextStyle(color: UniversityColor.black),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 0.0,
                color: UniversityColor.boxgreylight.withOpacity(0.25),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      maxRadius: 16,
                      backgroundImage: AssetImage(Images.profileImage),
                    ),
                    FxBox.w16,
                    const Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pro. Jane',
                          style: TextStyle(color: UniversityColor.blue),
                        ),
                        Text(
                          'Head OF Dept.',
                          style: TextStyle(color: UniversityColor.grey),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.favorite_border,
                      color: UniversityColor.blue,
                      size: 14.0,
                    ),
                    FxBox.w4,
                    const Text(
                      '521',
                      style: TextStyle(color: UniversityColor.blue),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
