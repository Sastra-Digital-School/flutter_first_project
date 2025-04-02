import 'package:flutter/material.dart';
import 'package:flutter_first_project/widget/card_home_widget.dart';

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
          name: 'Vichra',
          urlImage:
              'https://images.unsplash.com/photo-1541516160071-4bb0c5af65ba?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dGFraW5nJTIwcGhvdG98ZW58MHx8MHx8fDA%3D',
          slideRowTitle: _slideRowTitle,
        ),
      ],
    );
  }
}
