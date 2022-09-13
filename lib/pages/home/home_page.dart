import 'package:academias/pages/home/home_widgets/home_appbar.dart';
import 'package:academias/pages/home/home_widgets/home_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0B2345),
              Color.fromARGB(255, 18, 28, 44),
              Color(0xFF0E1621),
              Color(0xFF0E1621)
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: getHomeAppBar(),
        drawer: getHomeDrawer(),
        body: Container(),
      ),
    );
  }
}
