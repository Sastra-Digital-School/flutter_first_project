import 'package:flutter/material.dart';

class HomeV1Screen extends StatefulWidget {
  const HomeV1Screen({super.key});

  @override
  State<HomeV1Screen> createState() => _HomeV1ScreenState();
}

class _HomeV1ScreenState extends State<HomeV1Screen> {
  int curIndex = 0;
  @override
  void initState() {
    super.initState();

    setState(() {
      curIndex = 168;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
