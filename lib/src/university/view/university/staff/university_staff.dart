import 'dart:math';

import 'package:admin_dashboard/src/university/constant/colors.dart';
import 'package:admin_dashboard/src/university/constant/string.dart';
import 'package:admin_dashboard/src/university/utils/responsive.dart';
import 'package:admin_dashboard/src/university/view/admin/setting/components/company.dart';
import 'package:admin_dashboard/src/university/view/university/universityProfessor/components/html_editor.dart';
import 'package:admin_dashboard/src/university/view/university/universityProfessor/components/professorDataModel.dart';
import 'package:admin_dashboard/src/university/widget/route_title.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class UniversityStaff extends StatefulWidget {
  const UniversityStaff({super.key});

  @override
  State<UniversityStaff> createState() => _UniversityStaffState();
}

class _UniversityStaffState extends State<UniversityStaff> {
  final List<ProfessorDataModel> _tempProfessorList =
      List.from(ProfessorDataModel.tempProfessorList);

  final ValueNotifier<bool> _listType = ValueNotifier<bool>(true);
  final ValueNotifier<int?> _eyeIcon = ValueNotifier<int?>(null);

  final ValueNotifier<int> _selectedTab = ValueNotifier<int>(0);

  final List<String> _professorTabs = ['View', 'Profile', 'Add'];
  final TextEditingController _accountUserName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  final List<TextEditingController> _accounInfo2 =
      List.generate(5, (index) => TextEditingController());
  final List<String> _accountInfoString = [
    'Facebook',
    'Twitter',
    'LinkedIN',
    'Behance',
    'dribble'
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder<bool>(
        valueListenable: _listType,
        builder: (context, value, _) {
          return ValueListenableBuilder<int>(
            valueListenable: _selectedTab,
            builder: (context, tabSelected, _) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        const RouteTitle(),
                        const Spacer(),
                        for (int i = 0; i <= 2; i++) ...[
                          TextButton(
                            onPressed: () {
                              _selectedTab.value = i;
                            },
                            child: Text(
                              _professorTabs[i],
                              style: TextStyle(
                                color: tabSelected == i
                                    ? Colors.blue
                                    : Colors.grey,
                              ),
                            ),
                          )
                        ]
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    if (tabSelected == 0) ...[
                      IconButton(
                        onPressed: () {
                          _listType.value = !value;
                        },
                        icon: value == false
                            ? const Icon(Icons.grid_view_sharp)
                            : const Icon(Icons.view_list_rounded),
                      ),
                      if (UniversityResponsive.isMobile(context) ||
                          UniversityResponsive.isTablet(context)) ...[
                        _gridValue(),
                      ] else ...[
                        value == true ? _listValue() : _gridValue(),
                      ]
                    ] else if (tabSelected == 1) ...[
                      if (UniversityResponsive.isLargeWeb(context)) ...[
                        _profileRow(),
                      ] else if (tabSelected == 1) ...[
                        _profileColumn()
                      ]
                    ] else ...[
                      _addProfileRow(),
                    ]
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _listValue() {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: _tempProfessorList.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          height: 60.0,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 10.0,
              ),
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _imageColor().withOpacity(0.3)),
                child: Text(
                  _tempProfessorList[index]
                      .name
                      .toString()
                      .substring(0, 2)
                      .toUpperCase(),
                  style: const TextStyle(
                    color: UniversityColor.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    _tempProfessorList[index].name.toString(),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  _tempProfessorList[index].mobile.toString(),
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: Text(
                  _tempProfessorList[index].department.toString(),
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: Text(
                  _tempProfessorList[index].date.toString(),
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: index % 2 == 0
                        ? UniversityColor.primary
                        : UniversityColor.yellow,
                  ),
                  child: Text(
                    index % 2 == 0
                        ? _tempProfessorList[index].shift.toString()
                        : "Part-Time",
                    style: const TextStyle(
                      color: UniversityColor.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ValueListenableBuilder<int?>(
                      valueListenable: _eyeIcon,
                      builder: (context, value, _) {
                        return IconButton(
                          onPressed: () {
                            if (value == index) {
                              _eyeIcon.value = null;
                            } else {
                              _eyeIcon.value = index;
                            }
                          },
                          icon: Icon(index == value
                              ? Icons.remove_red_eye_outlined
                              : Icons.visibility_off),
                        );
                      },
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.pending_actions_outlined),
                    ),
                    IconButton(
                      onPressed: () {
                        _tempProfessorList.removeAt(index);
                        setState(() {});
                      },
                      icon: const Icon(
                        CupertinoIcons.delete,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 15.0,
        );
      },
    );
  }

  Widget _gridValue() {
    return GridView.builder(
      itemCount: _tempProfessorList.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: UniversityResponsive.isLargeWeb(context)
              ? 3
              : UniversityResponsive.isSmallWeb(context) ||
                      UniversityResponsive.isMediumWeb(context)
                  ? 3
                  : 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.withOpacity(.5),
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          height: 400,
          width: 400,
          child: Column(
            children: [
              Container(
                height: 80,
                width: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _imageColor().withOpacity(0.2)),
                child: Text(
                  _tempProfessorList[index]
                      .name
                      .toString()
                      .substring(0, 2)
                      .toUpperCase(),
                  style: const TextStyle(
                    color: UniversityColor.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    _tempProfessorList[index].name.toString(),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  _tempProfessorList[index].mobile.toString(),
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: Text(
                  _tempProfessorList[index].department.toString(),
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: Text(
                  _tempProfessorList[index].date.toString(),
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(180, 60),
                    backgroundColor: index % 2 == 0
                        ? UniversityColor.primary
                        : UniversityColor.yellow,
                  ),
                  child: Text(
                    index % 2 == 0
                        ? _tempProfessorList[index].shift.toString()
                        : "Part-Time",
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _profileRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _nameData(),
        const SizedBox(
          width: 10,
        ),
        _htmlEditor(),
      ],
    );
  }

  Widget _profileColumn() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/images/profile.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dessie Parks",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        "119 Peepee Way, Hilo, HI, 96720",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "270",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                "Followers",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "310",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                "Following",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "908",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                "Likes",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 25.0,
        ),
        ExpansionTile(
          initiallyExpanded: true,
          // childrenPadding: const EdgeInsets.all(12.0),
          collapsedIconColor: UniversityColor.blue,
          collapsedShape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.grey.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.grey.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          title: const Text(
            'ABOUT ME',
            style: TextStyle(
              color: UniversityColor.teallight,
              fontSize: 18.0,
            ),
          ),
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(UniversityString.pAbout),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Container(
                height: 300,
                width: MediaQuery.sizeOf(context).width * 0.80,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: UniversityColor.grey.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    Map<String, dynamic> data = {
                      "Gender": "Female",
                      "Operation Done": "30+",
                      "Degree": "B.A., M.A., P.H.D.",
                      "Designation": "Jr. Professor",
                      "Java": "35%",
                      "Angualar": "72%",
                      "PhotoShop": "60%",
                    };
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data.keys.map((e) => e).toList()[index],
                            style: const TextStyle(fontSize: 14.0),
                          ),
                          Text(
                            data.values.map((e) => e).toList()[index],
                            style: const TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: UniversityColor.grey.withOpacity(0.3),
                    );
                  },
                  itemCount: 7,
                ),
              ),
            ),
            Divider(
              color: UniversityColor.grey.withOpacity(.5),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "37",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "Projects",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "51",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "Task",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "61",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "Uploads",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 25.0,
        ),
        _htmlEditorColumn(),
      ],
    );
  }

  Widget _nameData() {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/profile.jpeg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dessie Parks",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        "119 Peepee Way, Hilo, HI, 96720",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "270",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                "Followers",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "310",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                "Following",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "908",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                "Likes",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          ExpansionTile(
            initiallyExpanded: true,
            // childrenPadding: const EdgeInsets.all(12.0),
            collapsedIconColor: UniversityColor.blue,
            collapsedShape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.grey.withOpacity(0.3),
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.grey.withOpacity(0.3),
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            title: const Text(
              'ABOUT ME',
              style: TextStyle(
                color: UniversityColor.teallight,
                fontSize: 18.0,
              ),
            ),
            children: [
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(UniversityString.pAbout),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Container(
                  height: 425,
                  width: MediaQuery.sizeOf(context).width * 0.80,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: UniversityColor.grey.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      Map<String, dynamic> data = {
                        "Gender": "Female",
                        "Operation Done": "30+",
                        "Degree": "B.A., M.A., P.H.D.",
                        "Designation": "Jr. Professor",
                        "Java": "35%",
                        "Angualar": "72%",
                        "PhotoShop": "60%",
                      };
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              data.keys.map((e) => e).toList()[index],
                              style: const TextStyle(fontSize: 14.0),
                            ),
                            Text(
                              data.values.map((e) => e).toList()[index],
                              style: const TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: UniversityColor.grey.withOpacity(0.3),
                      );
                    },
                    itemCount: 7,
                  ),
                ),
              ),
              Divider(
                color: UniversityColor.grey.withOpacity(.5),
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "37",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Projects",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "51",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Task",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "61",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Uploads",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _htmlEditor() {
    return Expanded(
      flex: 4,
      child: SizedBox(
        child: ExpansionTile(
          initiallyExpanded: true,
          collapsedShape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.grey.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.grey.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          title: const Text(
            'Time Activity',
            style: TextStyle(
              color: UniversityColor.teallight,
              fontSize: 18.0,
            ),
          ),
          children: [
            Stepper(
              stepIconBuilder: (stepIndex, stepState) {
                return Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/images/profile.jpeg"),
                        fit: BoxFit.cover),
                  ),
                );
              },
              steps: [
                Step(
                  title: const Text('Html Editor'),
                  content: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      height: 300,
                      child: const HtmlEditorExample(
                        title: "",
                      ),
                    ),
                  ),
                ),
                for (int i = 0; i < 3; i++) ...[
                  const Step(
                    title: Row(
                      children: [
                        Text(
                          "Elisse Joson",
                          style: TextStyle(color: UniversityColor.blue),
                        ),
                        Text('San Francisco, CA'),
                        Spacer(),
                        Text('20-April-2019 - Today'),
                      ],
                    ),
                    subtitle: Text(
                        "Hello, 'Im a single div responsive timeline without media Queries!"),
                    content: Text(
                      UniversityString.pAbout,
                      style: TextStyle(
                        color: UniversityColor.grey,
                      ),
                    ),
                  )
                ]
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _htmlEditorColumn() {
    return ExpansionTile(
      initiallyExpanded: true,
      collapsedShape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.grey.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.grey.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      title: const Text(
        'Time Activity',
        style: TextStyle(
          color: UniversityColor.teallight,
          fontSize: 18.0,
        ),
      ),
      children: [
        Stepper(
          stepIconBuilder: (stepIndex, stepState) {
            return Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/images/profile.jpeg"),
                    fit: BoxFit.cover),
              ),
            );
          },
          steps: [
            Step(
              title: const Text('Html Editor'),
              content: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  height: 300,
                  child: const HtmlEditorExample(
                    title: "",
                  ),
                ),
              ),
            ),
            for (int i = 0; i < 3; i++) ...[
              const Step(
                title: Row(
                  children: [
                    Text(
                      "Elisse Joson",
                      style: TextStyle(color: UniversityColor.blue),
                    ),
                    Text('San Francisco, CA'),
                    Spacer(),
                    Text('20-April-2019 - Today'),
                  ],
                ),
                subtitle: Text(
                    "Hello, 'Im a single div responsive timeline without media Queries!"),
                content: Text(
                  UniversityString.pAbout,
                  style: TextStyle(
                    color: UniversityColor.grey,
                  ),
                ),
              )
            ]
          ],
        )
      ],
    );
  }

  Color _imageColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  Widget _addProfileRow() {
    return UniversityResponsive.isMobile(context) ||
            UniversityResponsive.isTablet(context)
        ? Column(
            children: [
              ExpansionTile(
                initiallyExpanded: true,
                collapsedShape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                title: const Text('Basic Information'),
                children: const [
                  Company(
                    admin: false,
                  ),
                ],
              ),
              FxBox.h10,
              ExpansionTile(
                title: const Text(UniversityString.accountInfo),
                initiallyExpanded: true,
                collapsedShape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                children: [_accountInfo()],
              ),
              FxBox.h10,
              ExpansionTile(
                title: const Text(UniversityString.accountInfo),
                initiallyExpanded: true,
                collapsedShape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                children: [_accountInfo2()],
              )
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: ExpansionTile(
                  initiallyExpanded: true,
                  collapsedShape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  title: const Text('Basic Information'),
                  children: const [
                    Company(
                      admin: false,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    ExpansionTile(
                      title: const Text(UniversityString.accountInfo),
                      initiallyExpanded: true,
                      collapsedShape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      children: [_accountInfo()],
                    ),
                    FxBox.h10,
                    ExpansionTile(
                      title: const Text(UniversityString.accountInfo),
                      initiallyExpanded: true,
                      collapsedShape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      children: [_accountInfo2()],
                    )
                  ],
                ),
              ),
            ],
          );
  }

  Widget _accountInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _textWithHeader(
            isRequired: false,
            controller: _accountUserName,
            text: 'User Name',
          ),
          FxBox.h10,
          _textWithHeader(
            isRequired: false,
            controller: _password,
            text: 'Password',
          ),
          FxBox.h10,
          _textWithHeader(
            isRequired: false,
            controller: _confirmPassword,
            text: 'Confirm Password',
          ),
          FxBox.h10,
          Row(
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(60, 40),
                      backgroundColor: UniversityColor.primary),
                  onPressed: () {},
                  child: const Text(
                    'Submit',
                  )),
              FxBox.w10,
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(60, 40),
                ),
                onPressed: () {},
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: UniversityColor.grey),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _accountInfo2() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _textWithHeader(
            isRequired: false,
            controller: _accountUserName,
            text: 'User Name',
          ),
          FxBox.h10,
          for (int i = 0; i < 5; i++) ...[
            _textWithHeader(
              isRequired: false,
              controller: _accounInfo2[i],
              text: _accountInfoString[i],
            ),
            FxBox.h4
          ],
          FxBox.h10,
          Row(
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(60, 40),
                      backgroundColor: UniversityColor.primary),
                  onPressed: () {},
                  child: const Text(
                    'Submit',
                  )),
              FxBox.w10,
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(60, 40),
                ),
                onPressed: () {},
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: UniversityColor.grey),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
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
      style:
          const TextStyle(fontSize: 16.0, color: UniversityColor.boxgreylight),
    ),
  );
}
