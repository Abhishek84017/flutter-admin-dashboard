class ProfessorDataModel {
  String? image;
  String? name;
  String? mobile;
  String? department;
  String? date;
  String? shift;

  ProfessorDataModel(
      {this.image,
      this.name,
      this.mobile,
      this.department,
      this.date,
      this.shift});

  ProfessorDataModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    mobile = json['mobile'];
    department = json['department'];
    date = json['date'];
    shift = json['shift'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['mobile'] = mobile;
    data['department'] = department;
    data['date'] = date;
    data['shift'] = shift;
    return data;
  }

  static  final List<ProfessorDataModel> tempProfessorList = [
    ProfessorDataModel(
      image: "assets/images/profile.jpeg",
      name: "Gladys J Smith",
      mobile: "(417) 646-8377	",
      department: "Computer",
      date: "04 Jan, 2019",
      shift: "Full Time",
    ),
    ProfessorDataModel(
      image: "assets/images/profile.jpeg",
      name: "Alan Johnson",
      mobile: "	(417) 646-8377",
      department: "Mechanical",
      date: "04 Jan, 2019",
      shift: "Full Time",
    ),
    ProfessorDataModel(
      image: "assets/images/profile.jpeg",
      name: "James A Johnson",
      mobile: "(417) 646-1636",
      department: "Mechanical",
      date: "04 Jan, 2019",
      shift: "Full Time",
    ),
    ProfessorDataModel(
      image: "assets/images/profile.jpeg",
      name: "Alice A Smith",
      mobile: "(417) 646-8377",
      department: "Mechanical",
      date: "04 Jan, 2019",
      shift: "Full Time",
    ),
    ProfessorDataModel(
      image: "assets/images/profile.jpeg",
      name: "Gladys J Smith",
      mobile: "(417) 646-5023",
      department: "Computer",
      date: "04 Jan, 2019",
      shift: "Full Time",
    ),
    ProfessorDataModel(
      image: "assets/images/profile.jpeg",
      name: "Gladys k Smith",
      mobile: "(417) 646-9207",
      department: "Computer",
      date: "04 Jan, 2019",
      shift: "Full Time",
    ),
    ProfessorDataModel(
      image: "assets/images/profile.jpeg",
      name: "Gladys m Smith",
      mobile: "(417) 646-8377	",
      department: "Science",
      date: "04 Jan, 2019",
      shift: "Full Time",
    ),
    ProfessorDataModel(
      image: "assets/images/profile.jpeg",
      name: "Gladys J Smith",
      mobile: "(417) 646-8377	",
      department: "Science",
      date: "04 Jan, 2019",
      shift: "Full Time",
    ),
    ProfessorDataModel(
      image: "assets/images/profile.jpeg",
      name: "Gladys J Smith",
      mobile: "(417) 646-8377",
      department: "Mechanical",
      date: "04 Jan, 2019",
      shift: "Full Time",
    ),
    ProfessorDataModel(
      image: "assets/images/profile.jpeg",
      name: "Patricia Smith",
      mobile: "(417) 646-9207",
      department: "Mathematics",
      date: "04 Jan, 2019",
      shift: "Full Time",
    ),
  ];

}
