import 'package:flutter/material.dart';

AppBar getHomeAppBar() {
  return AppBar(
      title: const Text(
        "Miinhas Academias",
        style: TextStyle(color: Color(0xFFEDF0F9)),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.more_vert_rounded,
            color: Color(0xFFEDF0F9),
          ),
          onPressed: () {},
        ),
      ]);
}
