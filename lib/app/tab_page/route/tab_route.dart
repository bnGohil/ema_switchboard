import 'package:flutter/material.dart';
import 'package:switchboard/app/login/presentation/login_page.dart';

import '../presentation/tab_page.dart';


class TabRoute{
  static String route = "/tab_page";

  static Widget get child => const TabPage();

  static goToTabPage(BuildContext context) {
    Navigator.of(context).pushNamed(route);
  }
}
