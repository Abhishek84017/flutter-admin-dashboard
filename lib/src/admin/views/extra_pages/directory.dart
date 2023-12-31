import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/admin/constant/theme.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class Cards extends StatefulWidget {
  const Cards({Key? key}) : super(key: key);

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  final nameList = List.generate(9, (index) => 'Jane Deo');
  final photoList = List.generate(9, (index) => Images.profileImage);
  final emailList = List.generate(9, (index) => 'janedeo@admin.com');

  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? Wrap(
            runSpacing: 20.0,
            children: List.generate(9, (index) => _profileCard(index)),
          )
        : Responsive.isTablet(context)
            ? Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                children: List.generate(
                  9,
                  (index) => SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 34,
                    child: _profileCard(index),
                  ),
                ),
              )
            : Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                children: List.generate(
                  9,
                  (index) => SizedBox(
                    width: MediaQuery.of(context).size.width < 1300
                        ? (MediaQuery.of(context).size.width - 308) / 2
                        : (MediaQuery.of(context).size.width - 328) / 3,
                    child: _profileCard(index),
                  ),
                ),
              );
  }

  Widget _profileCard(int index) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 44,
                  backgroundColor: ColorConst.primary,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      photoList[index],
                    ),
                    radius: 40,
                  ),
                ),
                FxBox.w16,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nameList[index],
                        softWrap: true,
                        maxLines: 2,
                        style: const TextStyle(
                          color: ColorConst.primary,
                          fontSize: 19,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        languageModel.extraPage.creativeDirector,
                        style: TextStyle(
                          color: isDark
                              ? ColorConst.darkFontColor
                              : ColorConst.lightFontColor,
                        ),
                      ),
                      FxBox.h8,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.mail),
                          FxBox.w10,
                          const Icon(Icons.telegram),
                          FxBox.w10,
                          const Icon(Icons.whatshot),
                          FxBox.w10,
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.grey.shade300,
              height: 36.0,
            ),
            RichText(
              text: TextSpan(
                text: languageModel.extraPage.intro,
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: languageModel.extraPage.readMore,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorConst.primary,
                    ),
                    mouseCursor: SystemMouseCursors.click,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
