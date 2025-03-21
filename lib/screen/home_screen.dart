import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: const Text('Go to details screen'),
              onTap: () {
                Navigator.pushNamed(context, '/details');
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Go to settings screen'),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ),
        ],
      ),
    );
  }
}
