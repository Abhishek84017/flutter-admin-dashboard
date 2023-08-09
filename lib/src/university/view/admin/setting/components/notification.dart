import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  final List<Map<String, dynamic>> _notificationList = [
    {
      'header': 'Anyone send me a message',
      'isCheck': false,
    },
    {
      'header': 'Anyone seeing my profile page',
      'isCheck': true,
    },
    {
      'header': 'Anyone posts a comment on my post',
      'isCheck': true,
    },
    {
      'header': 'Anyone send me a message',
      'isCheck': false,
    },
    {
      'header': 'Anyone seeing my profile page',
      'isCheck': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FxBox.h16,
            CustomText(
              title: UniversityString.notificationSetting.toUpperCase(),
              textColor: UniversityColor.primary,
              fontSize: 17.0,
            ),
            FxBox.h24,
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: CustomText(
                      title: _notificationList[index]['header'],
                      textColor: UniversityColor.boxgreylight,
                    ),
                    trailing: Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0)),
                      activeColor: UniversityColor.blue,
                      value: _notificationList[index]['isCheck'],
                      onChanged: (value) {
                        _notificationList[index]['isCheck'] =
                            !_notificationList[index]['isCheck'];
                        setState(() {});
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(color: Colors.grey.shade300);
                },
                itemCount: _notificationList.length,
              ),
            ),
            FxBox.h10,
          ],
        ),
      ),
    );
  }
}
