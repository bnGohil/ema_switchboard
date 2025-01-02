part of "../base.dart";

enum Status { loading, completed, error, unAuthorised }

enum NetworkMethod {
  get(value: "GET"),
  post(value: "POST");

  const NetworkMethod({required this.value});

  final String value;
}





