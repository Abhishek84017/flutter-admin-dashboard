import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/ingrid/widget/datatable.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class FeesReceipt extends StatefulWidget {
  const FeesReceipt({super.key});

  @override
  State<FeesReceipt> createState() => _FeesReceiptState();
}

class _FeesReceiptState extends State<FeesReceipt> {
  final List<String> _invoiceHeader = [
    '',
    'PRODUCT',
    'QNT',
    'UNIT',
    'AMOUNT',
  ];
  final List<Map<String, dynamic>> _invoiceData = [
    {
      'title': 'Logo Creation',
      'description': 'Logo and business cards design',
      'qnt': 1,
      'unit': '\$1,800.00',
      'amount': '\$1,800.00',
    },
    {
      'title': 'Online Store Design & Development',
      'description': 'Design/Development for all popular modern browsers',
      'qnt': 1,
      'unit': '\$20,000.00',
      'amount': '\$20,000.00',
    },
    {
      'title': 'App Design',
      'description': 'Promotional mobile application',
      'qnt': 1,
      'unit': '\$3,200.00',
      'amount': '\$3,200.00',
    },
  ];

  final List<Map<String, dynamic>> _invoiceTotalData = [
    {
      'SubTotal': '\$25.000,00',
      'Vat Rate': '20%',
      'Vat Due': '\$5.000,00',
      'Total Due': '\$30.000,00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              title: '#AB0017',
              textColor: UniversityColor.primary,
              fontSize: 17.0,
            ),
            FxBox.h36,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _companyDetail(),
                _clientDetail(),
              ],
            ),
            FxBox.h20,
            _invoiceTable(),
            _tableTotal(),
            FxBox.h20,
            const Align(
              alignment: Alignment.center,
              child: CustomText(
                title:
                    'Thank you very much for doing business with us. We look forward to working with you again!',
                textColor: UniversityColor.boxgreylight,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _tableTotal() {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: constraints.maxWidth > 926.5 ? 18.0 : 0.0),
          constraints: const BoxConstraints(minWidth: 927.5),
          child: Table(
            border: TableBorder(
              bottom: BorderSide(color: Colors.grey.shade300),
              right: BorderSide(color: Colors.grey.shade300),
              left: BorderSide(color: Colors.grey.shade300),
            ),
            children: List.generate(_invoiceTotalData[0].keys.length, (index) {
              return TableRow(
                decoration: BoxDecoration(
                  color: index == 0 || index == 2
                      ? UniversityColor.white
                      : index == 1
                          ? Colors.grey[100]
                          : UniversityColor.primary,
                ),
                children: [
                  ...List.generate(6, (index) {
                    return const TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: CustomText(
                          title: '',
                        ),
                      ),
                    );
                  }).toList(),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CustomText(
                        textColor: index == 3
                            ? UniversityColor.white
                            : UniversityColor.black,
                        title: _invoiceTotalData[0].keys.elementAt(index),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CustomText(
                        textColor: index == 3
                            ? UniversityColor.white
                            : UniversityColor.black,
                        title: _invoiceTotalData[0].values.elementAt(index),
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      );
    });
  }

  Widget _invoiceTable() {
    return DataTable3(
      border: TableBorder(
        bottom: BorderSide(color: Colors.grey.shade300),
        top: BorderSide(color: Colors.grey.shade300),
        right: BorderSide(color: Colors.grey.shade300),
        left: BorderSide(color: Colors.grey.shade300),
      ),
      showBottomBorder: true,
      columnSpacing: 6.0,
      minWidth: 1000.0,
      headingRowHeight: 46.0,
      dataRowHeight: 70.0,
      showCheckboxColumn: false,
      columns: List.generate(_invoiceHeader.length, (index) {
        return DataColumn2(
          fixedWidth: index == 1
              ? 530
              : index == 0
                  ? 50
                  : 100,
          size: index == 1
              ? ColumnSize.L
              : index == 0
                  ? ColumnSize.S
                  : ColumnSize.M,
          label: CustomText(
            title: _invoiceHeader[index],
            textColor: UniversityColor.boxgreylight,
          ),
        );
      }).toList(),
      rows: List.generate(_invoiceData.length, (index) {
        return DataRow(
          onSelectChanged: (value) {},
          cells: [
            DataCell(
              CustomText(
                title: '$index',
                textColor: UniversityColor.black,
              ),
            ),
            DataCell(
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      title: '${_invoiceData[index]['title']}',
                      textColor: UniversityColor.black,
                    ),
                    FxBox.h6,
                    CustomText(
                      title: '${_invoiceData[index]['description']}',
                      textColor: UniversityColor.boxgreylight,
                    ),
                  ],
                ),
              ),
            ),
            DataCell(
              CustomText(
                title: '${_invoiceData[index]['qnt']}',
                textColor: UniversityColor.black,
              ),
            ),
            DataCell(
              CustomText(
                title: '${_invoiceData[index]['unit']}',
                textColor: UniversityColor.black,
              ),
            ),
            DataCell(
              CustomText(
                title: '${_invoiceData[index]['amount']}',
                textColor: UniversityColor.black,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _clientDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const CustomText(
          title: 'Client',
          fontSize: 22.0,
          textColor: UniversityColor.black,
        ),
        FxBox.h8,
        const CustomText(
          title: 'Street Address',
          textColor: UniversityColor.boxgreylight,
          fontSize: 14.0,
        ),
        FxBox.h4,
        const CustomText(
          title: 'State, City',
          textColor: UniversityColor.boxgreylight,
          fontSize: 14.0,
        ),
        FxBox.h4,
        const CustomText(
          title: 'Region, Postal Code',
          textColor: UniversityColor.boxgreylight,
          fontSize: 14.0,
        ),
        FxBox.h4,
        const CustomText(
          title: 'ltd@example.com',
          textColor: UniversityColor.boxgreylight,
          fontSize: 14.0,
        ),
      ],
    );
  }

  Widget _companyDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          title: 'Company',
          fontSize: 22.0,
          textColor: UniversityColor.black,
        ),
        FxBox.h8,
        const CustomText(
          title: 'Street Address',
          textColor: UniversityColor.boxgreylight,
          fontSize: 14.0,
        ),
        FxBox.h4,
        const CustomText(
          title: 'State, City',
          textColor: UniversityColor.boxgreylight,
          fontSize: 14.0,
        ),
        FxBox.h4,
        const CustomText(
          title: 'Region, Postal Code',
          textColor: UniversityColor.boxgreylight,
          fontSize: 14.0,
        ),
        FxBox.h4,
        const CustomText(
          title: 'ltd@example.com',
          textColor: UniversityColor.boxgreylight,
          fontSize: 14.0,
        ),
      ],
    );
  }
}
