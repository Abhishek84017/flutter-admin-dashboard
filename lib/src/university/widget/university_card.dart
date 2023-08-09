import 'package:admin_dashboard/src/admin/utils/hover.dart';
import 'package:flutter/material.dart';

class UniversityCard extends StatelessWidget {
  const UniversityCard({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FxHover(
      builder: (isHover) {
        return Card(
          elevation: isHover ? 1.0 : 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: child,
          ),
        );
      },
    );
  }
}
