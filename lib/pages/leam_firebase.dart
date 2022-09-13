import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LearnFirebase extends StatefulWidget {
  const LearnFirebase({super.key});

  @override
  State<LearnFirebase> createState() => _LearnFirebaseState();
}

class _LearnFirebaseState extends State<LearnFirebase> {
  List<String> listStrings = <String>["Nenhum registro carregado"];
  Uri url =
      Uri.https("gym-app-f8948-default-rtdb.firebaseio.com", "/words.json");
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(30),
      child: Center(
        child:
            // Mostrar circulo de carregamento
            (_isLoading)
                ? const CircularProgressIndicator()
                : RefreshIndicator(
                    onRefresh: () => _getInformationFromBack(),
                    child: ListView(children: [
                      TextFormField(
                        controller: _controller,
                        decoration: const InputDecoration(
                            labelText: "Insira uma palavra aqui"),
                        textAlign: TextAlign.center,
                      ),
                      ElevatedButton(
                          onPressed: () => _addStringToBack(),
                          child: const Text("Gravar no Firebase")),
                      for (String s in listStrings)
                        Text(
                          s,
                          textAlign: TextAlign.center,
                        )
                    ]),
                  ),
      ),
    ));
  }

  Future<void> _getInformationFromBack() {
    return http.get(url).then((response) {
      Map<String, dynamic> map = jsonDecode(response.body);
      listStrings = [];
      map.forEach((key, value) {
        setState(() {
          listStrings.add(map[key]["word"]);
        });
      });
    });
  }

  void _addStringToBack() {
    setState(() {
      // Deixa Tela de login verdadeira
      _isLoading = true;
    });
    http
        .post(url,
            body: jsonEncode(
              {"word": _controller.text},
            ))
        .then((value) {
      _getInformationFromBack().then((value) {
        setState(() {
          _isLoading = false;
        });
        _controller.text = "";

        final snackBar = SnackBar(
          content: const Text('Gravada com sucesso!'),
          action: SnackBarAction(
              label: "Dispensar",
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              }),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    });
  }
}
