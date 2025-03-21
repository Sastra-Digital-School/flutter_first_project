import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: const Text('Go to the settings screen'),
              onTap: () {
                Navigator.of(context).pushNamed('/settings');
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Go to the about screen'),
              onTap: () {
                Navigator.of(context).pushNamed('/about');
              },
            ),
          ),
        ],
      ),
    );
  }
}
