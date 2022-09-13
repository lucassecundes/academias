import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../shared/constants/routes.dart';

class LoginService {
  login(String email, String password) async {
    //  Uri uri = Uri.https(Routes.urlSignUp, "/");
    http.Response response = await http.post(
      Uri.parse(Routes.urlLogin),
      body: jsonEncode(
        {
          "email": email,
          "password": password,
          "returnSecureToken": true,
        },
      ),
    );

    print(response.body);
  }
}
