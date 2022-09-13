import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../shared/constants/routes.dart';

class SignUpService {
  signUp(String email, String password) async {
    //  Uri uri = Uri.https(Routes.urlSignUp, "/");
    http.Response response = await http.post(
      Uri.parse(Routes.urlSignUp),
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
