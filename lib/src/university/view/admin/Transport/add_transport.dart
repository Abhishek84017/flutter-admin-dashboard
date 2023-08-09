import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:admin_dashboard/src/university/utils/responsive.dart';
import 'package:admin_dashboard/src/university/widget/widget.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class AddTransport extends StatefulWidget {
  const AddTransport({super.key});

  @override
  State<AddTransport> createState() => _AddTransportState();
}

class _AddTransportState extends State<AddTransport> {
  final TextEditingController _routeName = TextEditingController();
  final TextEditingController _vehicleNo = TextEditingController();
  final TextEditingController _driverName = TextEditingController();
  final TextEditingController _licenseNo = TextEditingController();
  final TextEditingController _phoneNo = TextEditingController();
  final TextEditingController _description = TextEditingController();

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
            if (UniversityResponsive.isMediumWeb(context) ||
                UniversityResponsive.isLargeWeb(context)) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(flex: 2, child: FxBox.shrink),
                  Expanded(
                    flex: 9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: titleWithStart(
                                text: UniversityString.routeName)),
                        FxBox.w20,
                        Flexible(
                          flex: 4,
                          fit: FlexFit.tight,
                          child: textFeild(controller: _routeName),
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 2, child: FxBox.shrink),
                ],
              ),
              FxBox.h16,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(flex: 2, child: FxBox.shrink),
                  Expanded(
                    flex: 9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: titleWithStart(
                                text: UniversityString.vehicleNumber)),
                        FxBox.w20,
                        Flexible(
                          flex: 4,
                          fit: FlexFit.tight,
                          child: textFeild(controller: _vehicleNo),
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 2, child: FxBox.shrink),
                ],
              ),
              FxBox.h16,
              Row(
                children: [
                  Expanded(flex: 2, child: FxBox.shrink),
                  Expanded(
                    flex: 9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: titleWithStart(
                                text: UniversityString.driverName)),
                        FxBox.w20,
                        Flexible(
                          flex: 4,
                          fit: FlexFit.tight,
                          child: textFeild(controller: _driverName),
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 2, child: FxBox.shrink),
                ],
              ),
              FxBox.h16,
              Row(
                children: [
                  Expanded(flex: 2, child: FxBox.shrink),
                  Expanded(
                    flex: 9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: titleWithStart(
                                text: UniversityString.licenseNumber)),
                        FxBox.w20,
                        Flexible(
                          flex: 4,
                          fit: FlexFit.tight,
                          child: textFeild(controller: _licenseNo),
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 2, child: FxBox.shrink),
                ],
              ),
              FxBox.h16,
              Row(
                children: [
                  Expanded(flex: 2, child: FxBox.shrink),
                  Expanded(
                    flex: 9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: titleWithStart(
                                text: UniversityString.phoneNumber)),
                        FxBox.w20,
                        Flexible(
                          flex: 4,
                          fit: FlexFit.tight,
                          child: textFeild(controller: _phoneNo),
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 2, child: FxBox.shrink),
                ],
              ),
              FxBox.h16,
              Row(
                children: [
                  Expanded(flex: 2, child: FxBox.shrink),
                  Expanded(
                    flex: 9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child:
                                titleWithStart(text: UniversityString.avatar)),
                        FxBox.w20,
                        Flexible(
                          flex: 4,
                          fit: FlexFit.tight,
                          child: _dropZone(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 2, child: FxBox.shrink),
                ],
              ),
              FxBox.h16,
              Row(
                children: [
                  Expanded(flex: 2, child: FxBox.shrink),
                  Expanded(
                    flex: 9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: titleWithStart(
                                text: UniversityString.description)),
                        FxBox.w20,
                        Flexible(
                          flex: 4,
                          fit: FlexFit.tight,
                          child: textFeild(controller: _description),
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 2, child: FxBox.shrink),
                ],
              ),
              FxBox.h16,
              Row(
                children: [
                  Expanded(flex: 3, child: FxBox.shrink),
                  FxBox.w10,
                  Expanded(
                    flex: 5,
                    child: Row(
                      children: [
                        Flexible(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(60, 40),
                                backgroundColor: UniversityColor.primary),
                            onPressed: () {},
                            child: const CustomText(
                              title: UniversityString.submit,
                            ),
                          ),
                        ),
                        FxBox.w8,
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: UniversityColor.white,
                            minimumSize: const Size(60, 40),
                            side: const BorderSide(
                              color: UniversityColor.boxgreylight,
                            ),
                          ),
                          onPressed: () {},
                          child: const CustomText(
                            title: UniversityString.cancel,
                            textColor: UniversityColor.boxgreylight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 2, child: FxBox.shrink),
                ],
              ),
            ] else
              ...[]
          ],
        ),
      ),
    );
  }

  Widget _dropZone() {
    return GestureDetector(
      onTap: () async {
        FilePickerResult? file =
            await FilePicker.platform.pickFiles(allowMultiple: false);
        if (file != null) {}
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(4.0),
        ),
        padding: const EdgeInsets.all(20.0),
        constraints: BoxConstraints(
          minHeight: 200.0,
          maxWidth: MediaQuery.of(context).size.width,
          minWidth: MediaQuery.of(context).size.width,
          maxHeight: 200.0,
        ),
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.antiAlias,
          children: [
            DropTarget(
              child: SingleChildScrollView(
                controller: ScrollController(),
                child: _emptyView(),
              ),
              onDragDone: (details) {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _emptyView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.cloud_upload_sharp,
          size: 30,
          color: UniversityColor.boxgreylight,
        ),
        FxBox.h20,
        const Text(
          'Drag and drop a file here or click',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.0, color: UniversityColor.boxgreylight),
        ),
      ],
    );
  }
}
