import 'package:admin_dashboard/src/university/constant/string.dart';

final List<Map<String, dynamic>> taskdata = [
  {
    'task': {
      '1': 'New code Update on github',
      '2': 'It is a long established fact that a reader will be distracted...',
    },
    'team': 3,
    'duration': {
      'start': '03 Jun 2019',
      'end': '15 Jun 2019',
    },
    'action': UniversityString.planned,
    'progess': 0.0,
  },
  {
    'task': {
      '1': 'Design Events',
      '2': 'It is a long established fact that a reader will be distracted...',
    },
    'team': 1,
    'duration': {
      'start': '02 Jun 2019',
      'end': '08 Jun 2019',
    },
    'action': UniversityString.completed,
    'progess': 100.0,
  },
  {
    'task': {
      '1': 'Feed Details on Dribbble',
      '2': 'It is a long established fact that a reader will be distracted...',
    },
    'team': 3,
    'duration': {
      'start': '02 Jun 2019',
      'end': '08 Jun 2019',
    },
    'action': UniversityString.inProgress,
    'progess': 35.0,
  },
  {
    'task': {
      '1': 'New code Update on github',
      '2': 'It is a long established fact that a reader will be distracted...',
    },
    'team': 5,
    'duration': {
      'start': '13 Jun 2019',
      'end': '23 Jun 2019',
    },
    'action': UniversityString.inProgress,
    'progess': 75.0,
  },
  {
    'task': {
      '1': 'Angular App Design bug',
      '2': 'There are many variations of passages of Lorem Ipsum available...',
    },
    'team': 3,
    'duration': {
      'start': '03 Jun 2019',
      'end': '15 Jun 2019',
    },
    'action': UniversityString.inProgress,
    'progess': 35.0,
  },
];

final List<String> taskHeader = [
  '#',
  UniversityString.task,
  UniversityString.team,
  UniversityString.duration,
  UniversityString.action,
  ''
];
