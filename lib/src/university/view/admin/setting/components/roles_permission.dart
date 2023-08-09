import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/admin/widget/datatable.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class RolePermission extends StatefulWidget {
  const RolePermission({super.key});

  @override
  State<RolePermission> createState() => _RolePermissionState();
}

class _RolePermissionState extends State<RolePermission> {
  final List<Map<String, dynamic>> _permissionList = [
    {
      'header': 'Anyone seeing my profile page',
      'isCheck': false,
    },
    {
      'header': 'Anyone send me a message',
      'isCheck': false,
    },
    {
      'header': 'Anyone posts a comment on my post',
      'isCheck': false,
    },
    {
      'header': 'Anyone invite me to group',
      'isCheck': true,
    },
  ];

  final List<String> _permissionHeader = [
    UniversityString.modulePermission,
    UniversityString.read,
    UniversityString.write,
    UniversityString.create,
    UniversityString.delete,
    UniversityString.import,
    UniversityString.export,
  ];

  final List<Map<String, dynamic>> _rolePermissiondata = [
    {
      'title': 'Employee',
      'permission': {
        'read': false,
        'write': false,
        'create': true,
        'delete': true,
        'import': true,
        'export': false,
      },
    },
    {
      'title': 'Holidays',
      'permission': {
        'read': true,
        'write': false,
        'create': true,
        'delete': false,
        'import': false,
        'export': true,
      },
    },
    {
      'title': 'Leave Request',
      'permission': {
        'read': true,
        'write': true,
        'create': true,
        'delete': false,
        'import': false,
        'export': false,
      },
    },
    {
      'title': 'Events',
      'permission': {
        'read': false,
        'write': false,
        'create': true,
        'delete': false,
        'import': true,
        'export': false,
      },
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
              title: UniversityString.roleAndPermission.toUpperCase(),
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
                      title: _permissionList[index]['header'],
                      textColor: UniversityColor.boxgreylight,
                    ),
                    trailing: Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0)),
                      activeColor: UniversityColor.blue,
                      value: _permissionList[index]['isCheck'],
                      onChanged: (value) {
                        _permissionList[index]['isCheck'] =
                            !_permissionList[index]['isCheck'];
                        setState(() {});
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(color: Colors.grey.shade300);
                },
                itemCount: _permissionList.length,
              ),
            ),
            FxBox.h10,
            DataTable3(
              columns: _permissionHeader.map((e) {
                return DataColumn2(
                    label: CustomText(
                  title: e,
                  textColor: UniversityColor.boxgreylight,
                ));
              }).toList(),
              rows: _rolePermissiondata.map((rolePerData) {
                return DataRow(
                  cells: [
                    DataCell(
                      CustomText(
                        title: rolePerData['title'],
                        textColor: UniversityColor.black,
                      ),
                    ),
                    DataCell(
                      Checkbox(
                        value: rolePerData['permission']['read'],
                        activeColor: UniversityColor.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0)),
                        onChanged: (value) {
                          rolePerData['permission']['read'] =
                              !rolePerData['permission']['read'];
                          setState(() {});
                        },
                      ),
                    ),
                    DataCell(
                      Checkbox(
                        value: rolePerData['permission']['write'],
                        activeColor: UniversityColor.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0)),
                        onChanged: (value) {
                          rolePerData['permission']['write'] =
                              !rolePerData['permission']['write'];
                          setState(() {});
                        },
                      ),
                    ),
                    DataCell(
                      Checkbox(
                        value: rolePerData['permission']['create'],
                        activeColor: UniversityColor.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0)),
                        onChanged: (value) {
                          rolePerData['permission']['create'] =
                              !rolePerData['permission']['create'];
                          setState(() {});
                        },
                      ),
                    ),
                    DataCell(
                      Checkbox(
                        value: rolePerData['permission']['delete'],
                        activeColor: UniversityColor.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0)),
                        onChanged: (value) {
                          rolePerData['permission']['delete'] =
                              !rolePerData['permission']['delete'];
                          setState(() {});
                        },
                      ),
                    ),
                    DataCell(
                      Checkbox(
                        value: rolePerData['permission']['import'],
                        activeColor: UniversityColor.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0)),
                        onChanged: (value) {
                          rolePerData['permission']['import'] =
                              !rolePerData['permission']['import'];
                          setState(() {});
                        },
                      ),
                    ),
                    DataCell(
                      Checkbox(
                        value: rolePerData['permission']['export'],
                        activeColor: UniversityColor.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0)),
                        onChanged: (value) {
                          rolePerData['permission']['export'] =
                              !rolePerData['permission']['export'];
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
