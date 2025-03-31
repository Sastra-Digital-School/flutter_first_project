import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var iconsTab = [
      Icon(Icons.abc),
      Icon(Icons.directions_transit),
      Icon(Icons.directions_bike),
    ];

    return DefaultTabController(
      length: iconsTab.length,
      initialIndex: currentIndex,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
          bottom: TabBar(
            tabs: List.generate(iconsTab.length, (index) {
              return Tab(icon: iconsTab[index]);
            }),
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        body:
        // switch (currentIndex) {
        //   0 => Container(
        //     color: Colors.amber,
        //     child: Center(child: iconsTab[currentIndex]),
        //   ),
        //   1 => Container(
        //     color: Colors.red,
        //     child: Center(child: iconsTab[currentIndex]),
        //   ),
        //   2 => Container(
        //     color: Colors.cyan,
        //     child: Center(child: iconsTab[currentIndex]),
        //   ),
        //   int() => throw UnimplementedError(),
        // },
        TabBarView(
          children: [
            Column(
              children: [
                Text(
                  'ABC',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                iconsTab[0],
                FlutterLogo(),
                Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(color: Colors.cyan.shade400, blurRadius: 10),
                    ],
                  ),
                ),
              ],
            ),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
