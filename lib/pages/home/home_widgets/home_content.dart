import 'package:academias/pages/home/home_widgets/home_list_item.dart';
import 'package:flutter/material.dart';

import 'home_list_model.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  List<HomeListModel> listMockedList = [
    HomeListModel(
        title: "Academia - O Club", assetIcon: "assets/icons/satelites.png"),
    HomeListModel(
        title: "Academia Felix", assetIcon: "assets/icons/satelites.png")
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 50,
        horizontal: 20,
      ),
      child: ListView.builder(
        itemCount: listMockedList.length,
        itemBuilder: (context, index) {
          return HomeListItem(homeListModel: listMockedList[index]);
        },
      ),
    );
  }
}
