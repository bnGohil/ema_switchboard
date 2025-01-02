import 'package:flutter/material.dart';
import 'package:switchboard/app/login/presentation/login_page.dart';


class LoginRoute{
  static String route = "/login";

  static Widget get child => const LoginPage();

  static goToLoginPage(BuildContext context) {
    Navigator.of(context).pushNamed(route);
  }
}
