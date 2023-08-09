import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:flutter/material.dart';

class StackedUserRow extends StatelessWidget {
  const StackedUserRow({
    super.key,
    required this.itemCount,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          child: const CircleAvatar(
            radius: 18.0,
            backgroundColor: UniversityColor.white,
            child: CircleAvatar(
              radius: 16.0,
              backgroundImage: AssetImage(Images.profileImage),
            ),
          ),
        ),
        if (itemCount > 1)
          for (int i = 0; i < itemCount - 1; i++) ...{
            Positioned(
              left: (i * 32) + (32),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                child: const CircleAvatar(
                  radius: 18.0,
                  backgroundColor: UniversityColor.white,
                  child: CircleAvatar(
                    radius: 16.0,
                    backgroundImage: AssetImage(Images.profileImage),
                  ),
                ),
              ),
            )
          },
      ],
    );
  }
}
