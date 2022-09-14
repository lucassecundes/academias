import 'package:academias/pages/home/home_widgets/home_list_model.dart';
import 'package:academias/shared/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class HomeListItem extends StatefulWidget {
  final HomeListModel homeListModel;
  HomeListItem({required this.homeListModel});

  @override
  State<HomeListItem> createState() => _HomeListItemState();
}

class _HomeListItemState extends State<HomeListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Container(
              height: 15, // Altura do conteiner
              decoration: BoxDecoration(
                  color: CustomColors().getActivePrimaryButtonColor(),
                  borderRadius: const BorderRadius.only(
                    //borda do conteiner, TOP e Righet
                    topLeft: Radius.circular(7),
                    topRight: Radius.circular(7),
                  ))),
          Container(
            decoration: BoxDecoration(
                color: CustomColors().getCardBackgroundColor(),
                borderRadius: const BorderRadius.only(
                    //borda do conteiner, TOP e Righet
                    bottomLeft: Radius.circular(7),
                    bottomRight: Radius.circular(7))),
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Image.asset(
                      widget.homeListModel.assetIcon
                          .toString(), // Imagem adicionada em asset
                    ),
                    const Padding(padding: EdgeInsets.only(left: 15)),
                    Text(
                      widget.homeListModel.title.toString(),
                      textAlign: TextAlign.right,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ]),
                  const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
