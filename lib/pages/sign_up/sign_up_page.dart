// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/models/user.dart';
import '../../shared/constants/custom_colors.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  final TextEditingController _nameInputController = TextEditingController();
  final TextEditingController _mailInputController = TextEditingController();
  final TextEditingController _passwordInputController =
      TextEditingController();
  final TextEditingController _confirmInputController = TextEditingController();

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                CustomColors().getGradientBottomColor(),
                CustomColors().getGradientTopColor()
              ],
            )),
            child: SingleChildScrollView(
                child: Column(
              children: [
                const Icon(Icons.person, color: Colors.white, size: 35),
                const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text("Cadastro",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ))),
                Form(
                    child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(bottom: 15)),
                    TextFormField(
                        controller: _nameInputController,
                        style: const TextStyle(
                            color: Color.fromARGB(202, 255, 255, 255)),
                        autofocus: true,
                        decoration: InputDecoration(
                          prefixStyle: const TextStyle(color: Colors.white),
                          labelText: "Nome Completo",
                          labelStyle: const TextStyle(
                              color: Colors.white, fontSize: 14),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: CustomColors().getGradientBluePrimary(),
                                width: 2),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0.2)),
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: TextFormField(
                          controller: _mailInputController,
                          style: TextStyle(
                              color: Color.fromARGB(202, 255, 255, 255)),
                          decoration: InputDecoration(
                            labelText: "E-mail",
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 14),
                            prefixIcon: Icon(
                              Icons.mail,
                              color: Colors.white,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      CustomColors().getGradientBluePrimary(),
                                  width: 2),
                              borderRadius: BorderRadius.circular(9),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 0.2)),
                          )),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: TextFormField(
                            controller: _passwordInputController,
                            obscureText: (showPassword == true) ? false : true,
                            style: TextStyle(
                                color: Color.fromARGB(202, 255, 255, 255)),
                            autofocus: true,
                            decoration: InputDecoration(
                              labelText: "Senha",
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 14),
                              prefixIcon: Icon(Icons.key, color: Colors.white),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        CustomColors().getGradientBluePrimary(),
                                    width: 2),
                                borderRadius: BorderRadius.circular(9),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 0.2)),
                            ))),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: TextFormField(
                          controller: _confirmInputController,
                          obscureText: (showPassword == true) ? false : true,
                          style: TextStyle(
                              color: Color.fromARGB(202, 255, 255, 255)),
                          decoration: InputDecoration(
                            labelText: "Confirmar a senha",
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 14),
                            prefixIcon: Icon(
                              Icons.key,
                              color: Colors.white,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      CustomColors().getGradientBluePrimary(),
                                  width: 2),
                              borderRadius: BorderRadius.circular(9),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 0.2)),
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            checkColor: Colors.white,
                            value: showPassword,
                            onChanged: (value) {
                              setState(() {
                                showPassword = value!;
                              });
                            }),
                        Text(
                          "Mostrar Senha",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                )),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: TextButton(
                    onPressed: () {
                      _doSingUp();
                    },
                    style: TextButton.styleFrom(
                        foregroundColor:
                            CustomColors().getActivePrimaryButtonColor(),
                        minimumSize: Size(300, 50),
                        shadowColor:
                            CustomColors().getActivePrimaryButtonColor(),
                        backgroundColor:
                            CustomColors().getActivePrimaryButtonColor(),
                        padding: EdgeInsets.only(bottom: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text("Cadastrar",
                        style: TextStyle(color: Colors.white, height: 2)),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Divider(
                      color: Color.fromARGB(80, 255, 255, 255),
                    )),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    minimumSize: Size(300, 50),
                    shadowColor: CustomColors().getActivePrimaryButtonColor(),
                    backgroundColor:
                        CustomColors().getActiveSecondaryButtonColor(),
                    padding: EdgeInsets.only(bottom: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text("Já tenho uma conta",
                      style: TextStyle(
                        color: Colors.white,
                        height: 2,
                      )),
                )
              ],
            ))));
  }

  // Salvando Dados do user na memora
  void _doSingUp() {
    User newUser = User(
      name: _nameInputController.text,
      mail: _mailInputController.text,
      password: _passwordInputController.text,
      keepOn: true,
    );

    //  print(newUser);
    _saveUser(newUser);
  }

  // Pegando dados do user na memoria
  void _saveUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      "LOGGIN_USER_INFOS",
      json.encode(user.toJson()),
    );
  }
}
