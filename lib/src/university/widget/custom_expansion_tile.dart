import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.content,
    this.onPressedfullexit,
    this.onPressedCloseed,
    this.items,
  });
  final String title;
  final Widget content;
  final void Function()? onPressedfullexit;
  final void Function()? onPressedCloseed;
  final List<DropdownMenuItem<Object?>>? items;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              _isExpanded = !_isExpanded;
              setState(() {});
            },
            child: Container(
              height: 65.0,
              width: 360.0,
              alignment: Alignment.center,
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 18.0),
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
                      child: const Icon(
                        Icons.fullscreen,
                        size: 20.0,
                        color: UniversityColor.blue,
                      ),
                    ),
                  ),
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
                  FxDropdownButton(
                    focusColor: Colors.transparent,
                    underline: FxBox.shrink,
                    customButton: const Icon(
                      Icons.more_vert,
                      size: 20.0,
                      color: UniversityColor.blue,
                    ),
                    customItemsHeight: 8,
                    onChanged: (value) {},
                    style: const TextStyle(color: UniversityColor.black),
                    items: widget.items,
                    itemHeight: 38,
                    itemPadding: const EdgeInsets.only(left: 16, right: 16),
                    dropdownWidth: 200,
                    dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, blurRadius: 10),
                      ],
                    ),
                    dropdownElevation: 0,
                    offset: const Offset(-108, 10),
                  ),
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
