import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomeWidgetExpand extends StatefulWidget {
  const CustomeWidgetExpand({
    super.key,
    required this.title,
    this.onPressedfullexit,
    this.onPressedCloseed,
    required this.content,
    this.isCloseShow = true,
    this.isFullScreen = false,
  });

  final String title;
  final void Function()? onPressedfullexit;
  final void Function()? onPressedCloseed;
  final Widget content;
  final bool? isCloseShow;
  final bool? isFullScreen;

  @override
  State<CustomeWidgetExpand> createState() => _CustomeWidgetExpandState();
}

class _CustomeWidgetExpandState extends State<CustomeWidgetExpand> {
  bool _isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              _isExpanded = !_isExpanded;
              setState(() {});
            },
            child: Container(
              height: 42.0,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    title: widget.title,
                    fontSize: 17.0,
                    textColor: UniversityColor.primary,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      _isExpanded = !_isExpanded;
                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.only(right: 6.0, left: 6.0),
                      alignment: Alignment.center,
                      child: Icon(
                        !_isExpanded
                            ? Icons.keyboard_arrow_down_outlined
                            : Icons.keyboard_arrow_up_outlined,
                        size: 20.0,
                        color: UniversityColor.blue,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: widget.onPressedfullexit,
                    child: Container(
                      padding: const EdgeInsets.only(right: 6.0, left: 6.0),
                      alignment: Alignment.center,
                      child: Icon(
                        widget.isFullScreen!
                            ? Icons.fullscreen_exit
                            : Icons.fullscreen,
                        size: 20.0,
                        color: UniversityColor.blue,
                      ),
                    ),
                  ),
                  if (widget.isCloseShow!) ...[
                    InkWell(
                      onTap: widget.onPressedCloseed,
                      child: Container(
                        padding: const EdgeInsets.only(right: 6.0, left: 6.0),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.close,
                          size: 20.0,
                          color: UniversityColor.blue,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          if (_isExpanded) widget.content,
        ],
      ),
    );
  }
}
