import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/admin/utils/hover.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:admin_dashboard/src/university/widget/custom_expansion_tile.dart';
import 'package:admin_dashboard/src/university/widget/full_screen_dailog.dart';
import 'package:admin_dashboard/src/university/widget/stack_user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class ScrumCard extends StatefulWidget {
  const ScrumCard({super.key, required this.title, required this.dataList});
  final String title;
  final List<Map<String, dynamic>> dataList;

  @override
  State<ScrumCard> createState() => _ScrumCardState();
}

class _ScrumCardState extends State<ScrumCard> {
  final List<Map<String, dynamic>> _dropDownlist1 = [
    {
      'icon': Icons.visibility,
      'title': 'View Details',
    },
    {
      'icon': Icons.share,
      'title': 'Share',
    },
    {
      'icon': Icons.cloud_download_sharp,
      'title': 'Download',
    },
  ];
  final List<Map<String, dynamic>> _dropDownlist2 = [
    {
      'icon': Icons.copy,
      'title': 'Copy to',
    },
    {
      'icon': Icons.folder,
      'title': 'Move to',
    },
    {
      'icon': Icons.edit_document,
      'title': 'Rename',
    },
    {
      'icon': Icons.delete_outline_rounded,
      'title': 'Delete',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      title: widget.title,
      onPressedCloseed: () {
        widget.dataList.clear();
        setState(() {});
      },
      onPressedfullexit: () {
        showDialog(
          context: context,
          builder: (context) => FullscreenDialog(
            onPressedfullexit: () {
              Navigator.pop(context);
            },
            title: UniversityString.planned.toUpperCase(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                // width: 320,
                child: ListView.builder(
                  itemCount: widget.dataList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return FxHover(
                      builder: (isHover) {
                        return Draggable(
                          data: widget.dataList[index],
                          childWhenDragging: Container(
                              width: 320,
                              height: 220,
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 18.0),
                              decoration: BoxDecoration(
                                color: Colors.lightBlue.shade50,
                                border: Border.all(color: Colors.grey.shade300),
                              )),
                          feedback: Material(
                            elevation: 10.0,
                            child: Container(
                              width: 320,
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 18.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    title: widget.dataList[index]['title'],
                                    fontSize: 18.0,
                                    textColor: isHover
                                        ? UniversityColor.blue
                                        : UniversityColor.boxgreylight,
                                  ),
                                  FxBox.h16,
                                  if (widget.dataList[index]['start'] !=
                                      '') ...[
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                'Start: ${widget.dataList[index]['start']}',
                                            style: const TextStyle(
                                              color: UniversityColor.blue,
                                            ),
                                          ),
                                          const TextSpan(
                                            text: ' to ',
                                            style: TextStyle(
                                              color: UniversityColor.boxgrey,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                'Complete: ${widget.dataList[index]['complete']}',
                                            style: const TextStyle(
                                              color: UniversityColor.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    FxBox.h10,
                                  ],
                                  CustomText(
                                    title: widget.dataList[index]
                                        ['description'],
                                    textColor: isHover
                                        ? UniversityColor.blue
                                        : UniversityColor.boxgreylight,
                                  ),
                                  FxBox.h16,
                                  if (widget.dataList[index]['user'] != 0) ...{
                                    SizedBox(
                                      width: 320,
                                      child: StackedUserRow(
                                          itemCount: widget.dataList[index]
                                              ['user']),
                                    )
                                  },
                                ],
                              ),
                            ),
                          ),
                          child: Container(
                            width: 320,
                            margin: const EdgeInsets.all(8.0),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 18.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  title: widget.dataList[index]['title'],
                                  fontSize: 18.0,
                                  textColor: isHover
                                      ? UniversityColor.blue
                                      : UniversityColor.boxgreylight,
                                ),
                                FxBox.h16,
                                if (widget.dataList[index]['start'] != '') ...[
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              'Start: ${widget.dataList[index]['start']}',
                                          style: const TextStyle(
                                            color: UniversityColor.blue,
                                          ),
                                        ),
                                        const TextSpan(
                                          text: ' to ',
                                          style: TextStyle(
                                            color: UniversityColor.boxgrey,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              'Complete: ${widget.dataList[index]['complete']}',
                                          style: const TextStyle(
                                            color: UniversityColor.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  FxBox.h10,
                                ],
                                CustomText(
                                  title: widget.dataList[index]['description'],
                                  textColor: isHover
                                      ? UniversityColor.blue
                                      : UniversityColor.boxgreylight,
                                ),
                                FxBox.h16,
                                if (widget.dataList[index]['user'] != 0) ...{
                                  SizedBox(
                                    width: 320,
                                    child: StackedUserRow(
                                        itemCount: widget.dataList[index]
                                            ['user']),
                                  )
                                },
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
      items: [
        ..._dropDownlist1.map(
          (e) => DropdownMenuItem(
            value: e,
            child: ListTile(
              horizontalTitleGap: 0.0,
              leading: Icon(
                e['icon'],
                size: 18.0,
              ),
              title: Text(
                e['title'],
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        const DropdownMenuItem<Divider>(
          enabled: false,
          child: Divider(color: UniversityColor.boxgreylight),
        ),
        ..._dropDownlist2.map(
          (e) => DropdownMenuItem(
            value: e,
            child: ListTile(
              horizontalTitleGap: 0.0,
              leading: Icon(
                e['icon'],
                size: 18.0,
              ),
              title: Text(
                e['title'],
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ],
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 320,
          child: ListView.builder(
            itemCount: widget.dataList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return FxHover(
                builder: (isHover) {
                  return Draggable(
                    data: widget.dataList[index],
                    childWhenDragging: Container(
                        width: 320,
                        height: 220,
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 18.0),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue.shade50,
                          border: Border.all(color: Colors.grey.shade300),
                        )),
                    feedback: Material(
                      elevation: 10.0,
                      child: Container(
                        width: 320,
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 18.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              title: widget.dataList[index]['title'],
                              fontSize: 18.0,
                              textColor: isHover
                                  ? UniversityColor.blue
                                  : UniversityColor.boxgreylight,
                            ),
                            FxBox.h16,
                            if (widget.dataList[index]['start'] != '') ...[
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          'Start: ${widget.dataList[index]['start']}',
                                      style: const TextStyle(
                                        color: UniversityColor.blue,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: ' to ',
                                      style: TextStyle(
                                        color: UniversityColor.boxgrey,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          'Complete: ${widget.dataList[index]['complete']}',
                                      style: const TextStyle(
                                        color: UniversityColor.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              FxBox.h10,
                            ],
                            CustomText(
                              title: widget.dataList[index]['description'],
                              textColor: isHover
                                  ? UniversityColor.blue
                                  : UniversityColor.boxgreylight,
                            ),
                            FxBox.h16,
                            if (widget.dataList[index]['user'] != 0) ...{
                              SizedBox(
                                width: 320,
                                child: StackedUserRow(
                                    itemCount: widget.dataList[index]['user']),
                              )
                            },
                          ],
                        ),
                      ),
                    ),
                    child: Container(
                      width: 320,
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 18.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: widget.dataList[index]['title'],
                            fontSize: 18.0,
                            textColor: isHover
                                ? UniversityColor.blue
                                : UniversityColor.boxgreylight,
                          ),
                          FxBox.h16,
                          if (widget.dataList[index]['start'] != '') ...[
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        'Start: ${widget.dataList[index]['start']}',
                                    style: const TextStyle(
                                      color: UniversityColor.blue,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: ' to ',
                                    style: TextStyle(
                                      color: UniversityColor.boxgrey,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        'Complete: ${widget.dataList[index]['complete']}',
                                    style: const TextStyle(
                                      color: UniversityColor.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            FxBox.h10,
                          ],
                          CustomText(
                            title: widget.dataList[index]['description'],
                            textColor: isHover
                                ? UniversityColor.blue
                                : UniversityColor.boxgreylight,
                          ),
                          FxBox.h16,
                          if (widget.dataList[index]['user'] != 0) ...{
                            SizedBox(
                              width: 320,
                              child: StackedUserRow(
                                  itemCount: widget.dataList[index]['user']),
                            )
                          },
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
