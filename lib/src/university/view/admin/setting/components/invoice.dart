import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class InvoiceView extends StatefulWidget {
  const InvoiceView({super.key});

  @override
  State<InvoiceView> createState() => _InvoiceViewState();
}

class _InvoiceViewState extends State<InvoiceView> {
  final TextEditingController _invoicePrefixContoller = TextEditingController();

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
              title: UniversityString.invoiceSetting.toUpperCase(),
              textColor: UniversityColor.primary,
              fontSize: 17.0,
            ),
            FxBox.h24,
            // if (UniversityResponsive.isMobile(context) ||
            //     UniversityResponsive.isTablet(context))
            //   ...[]
            // else ...[
            _textWithHeader(
              text: UniversityString.invoicePrefix,
              controller: _invoicePrefixContoller,
            ),
            FxBox.h24,
            _dropZone(),
            FxBox.h4,
            const CustomText(
              title:
                  'This is some placeholder block-level help text for the above input. It\'s a bit lighter and easily wraps to a new line.',
              textColor: UniversityColor.boxgreylight,
              fontSize: 12.0,
            ),
            FxBox.h24,
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(60, 40),
                    backgroundColor: UniversityColor.primary),
                onPressed: () {},
                child: CustomText(
                  title: UniversityString.save.toUpperCase(),
                ),
              ),
            ),
          ],
          // ],
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

  Widget _textWithHeader({
    bool isRequired = false,
    required String text,
    required TextEditingController controller,
    int? minLines,
    int? maxLines = 1,
    String? hintText,
    Widget? prefixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleWithStart(isRequired: isRequired, text: text),
        FxBox.h10,
        _textFeild(
          controller: controller,
          hintText: hintText,
          maxLines: maxLines,
          minLines: minLines,
          prefixIcon: prefixIcon,
        ),
      ],
    );
  }

  Widget _titleWithStart({String? text, bool isRequired = false}) {
    return RichText(
      text: TextSpan(
        text: text,
        children: isRequired
            ? const [
                TextSpan(
                  text: ' *',
                  style: TextStyle(color: UniversityColor.red),
                )
              ]
            : null,
        style: const TextStyle(
            fontSize: 16.0, color: UniversityColor.boxgreylight),
      ),
    );
  }

  Widget _textFeild({
    required TextEditingController controller,
    int? minLines,
    int? maxLines = 1,
    String? hintText,
    Widget? prefixIcon,
  }) {
    return SizedBox(
      height: maxLines == 1 ? 40.0 : null,
      child: TextField(
        maxLines: maxLines,
        minLines: minLines,
        controller: controller,
        style: const TextStyle(color: UniversityColor.boxgreylight),
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(color: UniversityColor.bluelight),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
        ),
      ),
    );
  }
}
