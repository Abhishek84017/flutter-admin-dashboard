import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class ToDoView extends StatefulWidget {
  const ToDoView({super.key});

  @override
  State<ToDoView> createState() => _ToDoViewState();
}

class _ToDoViewState extends State<ToDoView> {
  List<Map<String, dynamic>> todoList = [
    {
      'isTick': true,
      'title': 'Report Panel Usag',
    },
    {
      'isTick': false,
      'title': 'Report Panel Usag',
    },
    {
      'isTick': true,
      'title': 'New logo design for Admin',
    },
    {
      'isTick': false,
      'title': 'Design PSD files for Admin',
    },
    {
      'isTick': true,
      'title': 'New logo design for Admin',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: ListView.separated(
        itemCount: todoList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                todoList[index]['isTick'] = !todoList[index]['isTick'];
                setState(() {});
              },
              child: Row(
                children: [
                  Checkbox(
                    activeColor: UniversityColor.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0)),
                    value: todoList[index]['isTick'],
                    onChanged: (value) {
                      todoList[index]['isTick'] = value;
                      setState(() {});
                    },
                  ),
                  FxBox.w8,
                  CustomText(
                    title: todoList[index]['title'],
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    textDecoration: todoList[index]['isTick']
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey.shade400,
          );
        },
      ),
    );
  }
}
