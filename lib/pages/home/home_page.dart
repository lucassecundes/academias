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
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          title: const Text("Gym App"),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                i = i + 1;
              });
            },
            child: const Icon(Icons.add)),
        body: Center(
          child: Text(
            i.toString(),
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 72,
            ),
          ),
        ));
  }
}

// LISTA DE WIDGET APRENDIDOS
// Container
// Text
// Scaffold
// Appbar
// icon
// FloatingActionButton
// Center

