part of "../utils.dart";

extension StringValidation on String {
  static String get emailValidation =>
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static String get mobileValidation =>
      r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$';
  bool get isTrimEmpty => trim().isEmpty;


  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

}

