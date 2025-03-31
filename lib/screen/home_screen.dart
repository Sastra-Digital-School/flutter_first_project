import 'package:flutter/material.dart';
import 'package:flutter_first_project/config/theme/theme_style.dart';

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
  final List<IconData> _slideRowIcon = [
    Icons.check_circle,
    Icons.construction,
    Icons.people,
    Icons.find_in_page,
    Icons.support_agent,
    Icons.desktop_mac,
    Icons.calendar_today,
    Icons.mood,
  ];
  final List<Color> _slideRowColor = [
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red,
    Colors.purple,
    Colors.pink,
    Colors.brown,
  ];

  get _buildBody => Column(
    children: [
      SizedBox(height: 88),
      Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            height: 400,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppTheme.secondarySwatch,
              borderRadius: BorderRadius.circular(35),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  spacing: 20,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Chamroeun Sithy',
                          style: AppTextStyle.bold22(color: Colors.white),
                        ),
                        Text(
                          '9th Grade',
                          style: AppTextStyle.regular16(
                            color: Colors.white.withValues(alpha: 95),
                          ),
                        ),
                      ],
                    ),
                    _slideRow,
                    _bottomCard,
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: -40,
            child: Container(
              margin: EdgeInsets.all(20),
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.white, width: 3),
              ),
            ),
          ),
        ],
      ),
    ],
  );

  get _slideRow => SingleChildScrollView(
    padding: EdgeInsets.only(left: 20),
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List.generate(
        _slideRowTitle.length,
        (index) => Container(
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.all(8),
          height: 68,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            spacing: 10,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: _slideRowColor[index],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(_slideRowIcon[index], color: Colors.white),
              ),
              Text(_slideRowTitle[index], style: AppTextStyle.bold14()),
            ],
          ),
        ),
      ),
    ),
  );

  get _bottomCard => Container(
    padding: EdgeInsets.all(20),
    height: 135,
    decoration: BoxDecoration(
      color: AppTheme.secondarySwatch[800],
      borderRadius: BorderRadius.circular(25),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        3,
        (index) => Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 5),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(30),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('A-', style: AppTextStyle.regular18(color: Colors.white)),
                Text(
                  'Letter grade',
                  style: AppTextStyle.regular16(
                    color: Colors.white.withAlpha(80),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
