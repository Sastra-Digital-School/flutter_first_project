import 'package:flutter/material.dart';
import 'package:flutter_first_project/screen/subject_detail.dart';
import 'package:flutter_first_project/widget/card_home_widget.dart';
import 'package:flutter_first_project/widget/date_time_line_widget.dart';
import 'package:flutter_first_project/widget/schedule_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  void bottomNavigationBarTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  DateTime selectDate = DateTime.now();

  void onChageDate(DateTime dateValue) {
    setState(() {
      selectDate = dateValue;
    });
  }

  get screen => [
    _buildBodyHome,
    Container(color: Colors.amber),
    Container(color: Colors.blue),
  ];

  Future<void> _navigateAndDisplaySelection(
    BuildContext context, {
    required int index,
    required String titleName,
    required String time,
    required String teacher,
    required String data,
  }) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => SubjectDetailScreen(
              index: index,
              titleName: titleName,
              time: time,
              teacher: teacher,
              date: DateTime.now().toString(),
            ),
      ),
    );

    if (!context.mounted) return;

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('${result[1]}')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Home'),
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back_ios_new_rounded),
      //     onPressed: () {
      //       Navigator.pop(context, ['Welcome back!!!']);
      //     },
      //   ),
      // ),
      body: screen[currentIndex],
      bottomNavigationBar: _buildBottomNavigationBar,
    );
  }

  final List<String> _slideRowTitle = [
    'Acadamix success',
    'Learn by doing',
    'Join the community',
    'Find the best resources',
    'Get support',
    'Showcase your work',
    'Plan your time wisely',
    'Stay motivated',
  ];

  get _buildBodyHome {
    return Column(
      children: [
        CardHomeWidget(
          name: 'Chamroeun Sithy',
          urlImage: 'assets/image/profile_sithy.jpg',
          isUrlNetwork: false,
          // urlImage:
          //     'https://www.pix-star.com/blog/wp-content/uploads/2021/05/digital-photo-frames.jpg',
          slideRowTitle: _slideRowTitle,
        ),
        DateTimeLineWidget(
          initialDate: DateTime.now(),
          onDateChange: (value) {
            onChageDate(value);
          },
        ),
        _buildSchedule(selectDate),
      ],
    );
  }

  Widget _buildSchedule(DateTime dateValue) {
    final Map<String, List<Map<String, String>>> schedules = {
      "2025-04-11": [
        {
          "time": "07:00 - 07:45",
          "subject": "Japan",
          "teacher": "Floyd Miles",
          "duration": "15 min",
        },
        {
          "time": "08:00 - 08:45",
          "subject": "Mechanic",
          "teacher": "Sophia Carter",
          "duration": "10 min",
        },
        {
          "time": "08:00 - 08:45",
          "subject": "Mechanic",
          "teacher": "Sophia Carter",
          "duration": "10 min",
        },
        {
          "time": "08:00 - 08:45",
          "subject": "Mechanic",
          "teacher": "Sophia Carter",
          "duration": "10 min",
        },
        {
          "time": "08:00 - 08:45",
          "subject": "Mechanic",
          "teacher": "Sophia Carter",
          "duration": "10 min",
        },
        {
          "time": "08:00 - 08:45",
          "subject": "Mechanic",
          "teacher": "Sophia Carter",
          "duration": "10 min",
        },
      ],
      "2025-04-08": [
        {
          "time": "07:00 - 07:45",
          "subject": "Physics",
          "teacher": "Michael Johnson",
          "duration": "15 min",
        },
        {
          "time": "08:00 - 08:45",
          "subject": "Chemistry",
          "teacher": "Emma Brown",
          "duration": "10 min",
        },
      ],
    };

    String dateKey =
        "${dateValue.year}-${dateValue.month.toString().padLeft(2, '0')}-${dateValue.day.toString().padLeft(2, '0')}";

    List<Map<String, String>> selectedSchedule = schedules[dateKey] ?? [];

    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(left: 8, right: 8, top: 15),
        itemCount: selectedSchedule.length,
        itemBuilder: (context, index) {
          return ScheduleCardWidget(
            time: selectedSchedule[index]["time"]!,
            subject: selectedSchedule[index]["subject"]!,
            teacher: selectedSchedule[index]["teacher"]!,
            duration: selectedSchedule[index]["duration"]!,
            onTap: () {
              _navigateAndDisplaySelection(
                context,
                index: index,
                titleName: selectedSchedule[index]["subject"]!,
                time: selectedSchedule[index]["time"]!,
                teacher: selectedSchedule[index]["teacher"]!,
                data: dateKey,
              );
            },
          );
        },
      ),
    );
  }

  get _buildBottomNavigationBar {
    List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    ];
    return BottomNavigationBar(
      currentIndex: currentIndex,
      items: items,
      onTap: (index) {
        bottomNavigationBarTap(index);
      },
    );
  }
}
