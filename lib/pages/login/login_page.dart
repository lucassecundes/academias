// import 'dart:html';

import 'package:academias/pages/sign_up/sign_up_page.dart';
import 'package:academias/shared/constants/custom_colors.dart';
import 'package:flutter/material.dart';

import 'login_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _mailInputController = TextEditingController();
  final TextEditingController _passwordInputController =
      TextEditingController();
  bool continueConnecting = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          CustomColors().getGradientTopColor(),
          CustomColors().getGradientBottomColor(),
          CustomColors().getGradientBottomColor()
        ],
      )),
      child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Image.asset(
              "assets/satelites.png",
              height: 125,
            ),
          ),
          const Text(
            "Entrar",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(bottom: 15)),
                  TextFormField(
                      // Criando validador de email
                      validator: (value) {
                        if (value.toString().length < 5) {
                          return "Esse email parece curto demais";
                        } else if (!value.toString().contains("@")) {
                          return "Email não contem o @";
                        }
                        return null;
                      }, // final do validador de email
                      style: const TextStyle(
                          color: Color.fromARGB(202, 255, 255, 255)),
                      controller: _mailInputController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        labelStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(
                          Icons.mail_outline,
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
                            borderSide: const BorderSide(
                                color: Colors.white, width: 0.2)),
                      )),
                  const Padding(padding: EdgeInsets.only(bottom: 15)),
                  TextFormField(
                      validator: (value) {
                        if (value.toString().length < 6) {
                          return "Minimo é de 6 caracteres";
                        }
                        return null;
                      },
                      style: const TextStyle(
                          color: Color.fromARGB(202, 255, 255, 255)),
                      controller: _passwordInputController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(
                          Icons.key,
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
                            borderSide: const BorderSide(
                                color: Colors.white, width: 0.2)),
                      ))
                ],
              )),
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          GestureDetector(
            onTap: () {},
            child: const Text(
              "Esqueceu a senha?",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                  checkColor: Colors.white,
                  value: continueConnecting,
                  onChanged: (value) {
                    setState(() {
                      continueConnecting = value!;
                    });
                  }),
              const Text(
                "Continuar conectado?",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          TextButton(
            onPressed: () {
              _doLogin();
            },
            style: TextButton.styleFrom(
                foregroundColor: CustomColors().getActivePrimaryButtonColor(),
                shadowColor: CustomColors().getActivePrimaryButtonColor(),
                backgroundColor: CustomColors().getActivePrimaryButtonColor(),
                padding: const EdgeInsets.only(bottom: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: const Text("Login",
                style: TextStyle(color: Colors.white, height: 2)),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(
              color: Color.fromARGB(80, 255, 255, 255),
            ),
          ),
          const Text(
            "Ainda não tem uma conta?",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 11, color: Colors.white),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SingUpPage()));
            },
            style: TextButton.styleFrom(
              shadowColor: CustomColors().getActivePrimaryButtonColor(),
              backgroundColor: CustomColors().getActiveSecondaryButtonColor(),
              padding: const EdgeInsets.only(bottom: 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text("Cadastre-se",
                style: TextStyle(
                  color: Colors.white,
                  height: 2,
                )),
          )
        ],
      )),
    ));
  }

  void _doLogin() async {
    // ignore: unrelated_type_equality_checks
    if (_formKey.currentState!.validate()) {
      LoginService()
          .login(_mailInputController.text, _passwordInputController.text);
    } else {
      print("invalido");
    }
  }

  // Future<LoginModel> _getSavedUser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String jsonUser = prefs.getString(PreferencesKeys.activeUser);
  //   print(jsonUser);

  //   Map<String, dynamic> mapUser = json.decode(jsonUser);
  //   LoginModel user = LoginModel.fromJson(mapUser);
  //   return user;
  // }
}

// WIDGETS
// BoxDecoration
// LinearGradient
// MediaQuery.of(context).size.width
// SingleChildScrollView
// Column
// Form
// TextFormField
// InputDecoration
// GestureDectector