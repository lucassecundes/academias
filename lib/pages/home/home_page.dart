import 'package:academias/pages/home/home_widgets/home_appbar.dart';
import 'package:flutter/material.dart';

import '../../shared/constants/custom_colors.dart';

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
            colors: [const Color(0xFF0B2345), const Color(0xFF0E1621)]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: getHomeAppBar(),
        drawer: Drawer(),
        body: Container(),
      ),
    );
  }
}
