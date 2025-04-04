import 'package:flutter/material.dart';
import 'package:flutter_first_project/widget/card_home_widget.dart';
import 'package:flutter_first_project/widget/date_time_line_widget.dart';
import 'package:flutter_first_project/widget/schedule_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody);
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

  get _buildBody {
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
          onDateChange: (value) {},
        ),
        _buildSchedule(DateTime.now()),
      ],
    );
  }

  Widget _buildSchedule(DateTime dateValue) {
    final Map<String, List<Map<String, String>>> schedules = {
      "2025-04-04": [
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
      "2025-02-10": [
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
            onTap: () {},
          );
        },
      ),
    );
  }
}
