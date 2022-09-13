import 'package:flutter/material.dart';

Drawer getHomeDrawer() {
  return Drawer(
    backgroundColor: const Color(0XFF172741),
    child: ListView(
      padding: EdgeInsets.zero,
      children: const [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: Color(0xFF0E1621)),
          accountName: Text("Lucas Secundes"),
          accountEmail: Text("Lucas@besat.com.br"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Color(0XFF172741),
            child: Text(
              "LS",
              style: TextStyle(fontSize: 48),
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: Colors.white,
          ),
          title: Text("Configurações",
              style: TextStyle(
                color: Colors.white,
              )),
        ),
        ListTile(
          leading: Icon(
            Icons.exit_to_app_outlined,
            color: Colors.white,
          ),
          title: Text("Sair",
              style: TextStyle(
                color: Colors.white,
              )),
        ),
      ],
    ),
  );
}
