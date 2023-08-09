import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/admin/widget/datatable.dart';
import 'package:admin_dashboard/src/university/view/admin/Transport/transport_data.dart';
import 'package:flutter/material.dart';

class TransportList extends StatefulWidget {
  const TransportList({super.key});

  @override
  State<TransportList> createState() => _TransportListState();
}

class _TransportListState extends State<TransportList> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: DataTable3(
        showBottomBorder: true,
        columnSpacing: 20.0,
        minWidth: 900.0,
        dataRowHeight: 42.0,
        headingRowHeight: 46.0,
        columns: [
          DataColumn2(
            size: ColumnSize.S,
            label: CustomText(
              title: transportHeader[0].toUpperCase(),
            ),
          ),
          DataColumn2(
            size: ColumnSize.L,
            label: CustomText(
              title: transportHeader[1].toUpperCase(),
            ),
          ),
          DataColumn2(
            size: ColumnSize.M,
            label: CustomText(
              title: transportHeader[2].toUpperCase(),
            ),
          ),
          DataColumn2(
            size: ColumnSize.L,
            label: CustomText(
              title: transportHeader[3].toUpperCase(),
            ),
          ),
          DataColumn2(
            size: ColumnSize.L,
            label: CustomText(
              title: transportHeader[4].toUpperCase(),
            ),
          ),
          DataColumn2(
            size: ColumnSize.L,
            label: CustomText(
              title: transportHeader[5].toUpperCase(),
            ),
          ),
          DataColumn2(
            size: ColumnSize.S,
            label: CustomText(
              title: transportHeader[6].toUpperCase(),
            ),
          ),
        ],
        rows: transportData.map((hostelData) {
          return DataRow(cells: [
            const DataCell(
              CircleAvatar(
                radius: 16.0,
                backgroundImage: AssetImage(Images.profileImage),
              ),
            ),
            DataCell(CustomText(
              title: hostelData['driver_name'],
            )),
            DataCell(CustomText(
              title: hostelData['mobile'],
            )),
            DataCell(CustomText(
              title: hostelData['license_no'],
            )),
            DataCell(CustomText(
              title: hostelData['vehicle_no'],
            )),
            DataCell(CustomText(
              title: hostelData['route_name'],
            )),
            const DataCell(Icon(Icons.map)),
          ]);
        }).toList(),
      ),
    );
  }
}
