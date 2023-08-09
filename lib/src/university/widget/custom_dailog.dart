import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';

import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class CustomDailog extends StatefulWidget {
  const CustomDailog({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  State<CustomDailog> createState() => _CustomDailogState();
}

class _CustomDailogState extends State<CustomDailog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 46.0, vertical: 26.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline_outlined,
              color: UniversityColor.yellow,
              size: 100.0,
            ),
            FxBox.h28,
            const CustomText(
              title: 'Are you sure?',
              fontSize: 30.0,
              textColor: UniversityColor.boxgrey,
              fontWeight: FontWeight.w700,
            ),
            FxBox.h24,
            const CustomText(
              title: 'You will not be able to recover this imaginary file!',
              fontSize: 16.0,
              textColor: UniversityColor.boxgrey,
              fontWeight: FontWeight.w500,
            ),
            FxBox.h24,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  minWidth: 110.0,
                  height: 46.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                  color: UniversityColor.boxgreylight,
                  hoverColor: UniversityColor.grey,
                  child: const CustomText(
                    title: UniversityString.cancel,
                    textColor: UniversityColor.white,
                  ),
                ),
                FxBox.w16,
                MaterialButton(
                  onPressed: () {
                    widget.onPressed!();
                    Navigator.pop(context);

                    // setState(() {
                    //   widget.dataList.remove(widget.dataMap);
                    // });

                    showDialog(
                      context: context,
                      builder: (context) {
                        return const SuccessDailog();
                      },
                    );
                  },
                  minWidth: 140.0,
                  height: 46.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                  color: UniversityColor.red,
                  child: const CustomText(
                    title: 'Yes, delete it!',
                    textColor: UniversityColor.white,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SuccessDailog extends StatelessWidget {
  const SuccessDailog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 46.0, vertical: 26.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: UniversityColor.green,
              size: 100.0,
            ),
            FxBox.h28,
            const CustomText(
              title: 'Deleted!',
              fontSize: 30.0,
              textColor: UniversityColor.boxgrey,
              fontWeight: FontWeight.w700,
            ),
            FxBox.h24,
            const CustomText(
              title: 'Your imaginary file has been deleted.',
              fontSize: 16.0,
              textColor: UniversityColor.boxgrey,
              fontWeight: FontWeight.w500,
            ),
            FxBox.h24,
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              minWidth: 110.0,
              height: 46.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0)),
              color: UniversityColor.bluelight,
              hoverColor: UniversityColor.blue,
              child: const CustomText(
                title: 'OK',
                textColor: UniversityColor.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
