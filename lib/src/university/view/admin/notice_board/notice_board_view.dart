import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/widget/route_title.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class NoticeBoardView extends StatefulWidget {
  const NoticeBoardView({super.key});

  @override
  State<NoticeBoardView> createState() => _NoticeBoardViewState();
}

class _NoticeBoardViewState extends State<NoticeBoardView> {
  final List<Map<String, dynamic>> _noticeList = [
    {
      'title': 'Change in Exam Schedule',
      'time': '22 Feb, 2023 10:00 AM',
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    },
    {
      'title': 'Singing Competition Audiion',
      'time': '21 Martch, 2023 11:00 AM',
      'description':
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
    },
    {
      'title': 'Library Notice',
      'time': '01 November, 2023 11:00 AM',
      'description':
          'All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RouteTitle(),
          FxBox.h24,
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return _noticeBox(
                title: _noticeList[index]['title'],
                time: _noticeList[index]['time'],
                description: _noticeList[index]['description'],
              );
            },
            separatorBuilder: (context, index) {
              return FxBox.h10;
            },
            itemCount: _noticeList.length,
          )
        ],
      ),
    );
  }

  Widget _noticeBox(
      {required String title,
      required String time,
      required String description}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            title: title,
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
          ),
          FxBox.h12,
          CustomText(
            title: time,
            fontSize: 15.0,
            fontWeight: FontWeight.w400,
            textColor: UniversityColor.boxgreylight,
          ),
          FxBox.h12,
          CustomText(
            title: description,
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
