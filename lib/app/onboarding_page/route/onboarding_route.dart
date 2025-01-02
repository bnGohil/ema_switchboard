import 'package:flutter/material.dart';
import '../presentation/onboarding.dart';


class OnBoardingRoute{
  static String route = "/onboarding_route";

  static Widget get child => const OnBoardingPage();

  static goToOnBoardingPage(BuildContext context) {
    Navigator.of(context).pushNamed(route);
  }
}
