import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:admin_dashboard/src/university/view/admin/task_board/scrum_card.dart';
import 'package:admin_dashboard/src/university/view/admin/task_board/scrum_data.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class ScrumType extends StatefulWidget {
  const ScrumType({super.key});

  @override
  State<ScrumType> createState() => _ScrumTypeState();
}

class _ScrumTypeState extends State<ScrumType> {
  bool isAccepted = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DragTarget(
            onLeave: (data) {
              removeDataFromOldList(data as Map<String, dynamic>);
            },
            onWillAccept: (data) {
              return true;
            },
            onAccept: (data) {
              Map<String, dynamic> newMap = data as Map<String, dynamic>;

              isAccepted = true;
              removeDataFromOldList(newMap);
              scrumPlanned.add(newMap);
              setState(() {});
            },
            builder: (context, candidateData, rejectedData) {
              return ScrumCard(
                dataList: scrumPlanned,
                title: UniversityString.planned,
              );
            },
          ),
          FxBox.w12,
          DragTarget(
            onLeave: (data) {
              removeDataFromOldList(data as Map<String, dynamic>);
            },
            onWillAccept: (data) {
              return true;
            },
            onAccept: (data) {
              Map<String, dynamic> newMap = data as Map<String, dynamic>;

              isAccepted = true;
              removeDataFromOldList(newMap);
              scrumInprogress.add(newMap);
              setState(() {});
            },
            builder: (context, candidateData, rejectedData) {
              return ScrumCard(
                dataList: scrumInprogress,
                title: UniversityString.inProgress,
              );
            },
          ),
          FxBox.w12,
          DragTarget(
            onLeave: (data) {
              removeDataFromOldList(data as Map<String, dynamic>);
            },
            onWillAccept: (data) {
              return true;
            },
            onAccept: (data) {
              Map<String, dynamic> newMap = data as Map<String, dynamic>;

              isAccepted = true;
              removeDataFromOldList(newMap);
              scrumCompeleted.add(newMap);
              setState(() {});
            },
            builder: (context, candidateData, rejectedData) {
              return ScrumCard(
                dataList: scrumCompeleted,
                title: UniversityString.completed,
              );
            },
          ),
        ],
      ),
    );
  }

  void removeDataFromOldList(Map<String, dynamic> data) {
    if (scrumPlanned.contains(data) && isAccepted) {
      scrumPlanned.remove(data);
    } else if (scrumInprogress.contains(data) && isAccepted) {
      scrumInprogress.remove(data);
    } else if (scrumCompeleted.contains(data) && isAccepted) {
      scrumCompeleted.remove(data);
    }
  }
}
