import 'package:admin_dashboard/src/university/widget/expansion_tile.dart';
import 'package:flutter/material.dart';

class FullscreenDialog extends StatelessWidget {
  const FullscreenDialog({
    Key? key,
    required this.child,
    required this.title,
    this.onPressedfullexit,
  }) : super(key: key);
  final Widget child;
  final String title;
  final void Function()? onPressedfullexit;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: Colors.black54,
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 18.0),
              child: CustomeWidgetExpand(
                isCloseShow: false,
                isFullScreen: true,
                title: title,
                onPressedfullexit: onPressedfullexit,
                content: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 18.0),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
