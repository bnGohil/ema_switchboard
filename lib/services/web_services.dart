import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:switchboard/services/secure_storage.dart';
import '../base/base.dart';
import '../utils/utils.dart';
import 'package:http/http.dart' as http;


class WebService {
  WebService();

  static final _instance = WebService();

  static WebService get instance => _instance;
  final _dio = Dio();

  request({required NetworkRequest request}) async {

    if (kDebugMode) {
      log(request.toString());
    }

    if(SecureStorage.token == null) {
      await SecureStorage().setStaticValues();
    }

    try {
      final response = await _dio.request(
              request.url,
              queryParameters: request.queryParameters,
              data: request.data,
              options: Options(
                  method: request.method.value,
                  headers: {

                    "Authorization" : "Bearer ${SecureStorage.token}"

                  }
              ));



      final responseData = response.data;


      if (kDebugMode) {
        log(request.toResponseString(responseData));
      }

      if(responseData["status"] == 0) {
        throw responseData["message"];
      }

      return responseData;

    } on DioException catch (e) {

      decodeErrorResponse(error: e, request: request);

    } on SocketException {

      throw "Internet connection not available";

    } catch (e) {
      if(e is TimeoutException) {
        throw "Request TimeOut.";
      }

      rethrow;
    }

  }

  getContentType(String? path)async{

    if(path == null && path?.isEmpty == true){
      return ;
    }

    try {
      final response = await http.head(Uri.parse(path ?? ""));
      if(response.statusCode == 200){
        print(response.headers['content-type']);
      }
      return response;
    } catch (e) {
      return e;
    }





  }

  decodeErrorResponse({required DioException error, required NetworkRequest request}) {

    if(error.response?.statusCode == 401) {
      // kClearAppState();
      throw UnauthorisedException();
    }

    if (kDebugMode) {
      log(request.toErrorString(error));
    }
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        throw 'Connection timeOut';
        case DioExceptionType.sendTimeout:
        // TODO: Handle this case.
        break;
      case DioExceptionType.receiveTimeout:
        throw 'Connection timeOut';
      case DioExceptionType.badCertificate:
        throw 'Connection timeOut';
      case DioExceptionType.badResponse:
        throw 'Something went wrong.';
      case DioExceptionType.cancel:
        throw 'Request Canceled by user';
      case DioExceptionType.connectionError:
        throw 'Something went wrong.';
      case DioExceptionType.unknown:

        if((error.message ?? "").contains("SocketException") || (error.error) is SocketException){
          throw "Internet connection not available";
        } else {
          throw "Something went wrong.";
        }

    }
  }
}

class NetworkRequest {
  final String url;
  final Map<String, dynamic>? queryParameters;
  final dynamic data;

  NetworkMethod method = NetworkMethod.post;

  NetworkRequest({required this.url, this.queryParameters, this.data, NetworkMethod? method}) : method = method ?? NetworkMethod.post;

  String toErrorString(DioException error) {
    try {

      final uri = Uri.parse(url);

      final log = '''===⚠️ START ERROR ⚠️===
      
      API is for ${uri.pathSegments.last}
      URL = ${Uri(queryParameters: queryParameters, host: uri.host, path: uri.path, scheme: uri.scheme, port: uri.port, userInfo: uri.userInfo)}
      Data = ${getFormData()}
      queryParameters = $queryParameters
      Code = ${error.response?.statusCode}
      Error:
        Error Response is for this ${error.response?.toString()}
        Error = ${error.error?.toString()} - ${error.response?.statusCode}
        
===⚠️ END ERROR ⚠️===''';

      return log;
    } catch (e) {
      return '''===⚠️ START ERROR ⚠️===
      
      URL = $url
      Data = ${getFormData()}
      Error:
        Error Response is for this ${error.response?.toString()}
        Error = ${error.error?.toString()} - ${error.response?.statusCode}
        
===⚠️ END ERROR ⚠️===''';
    }
  }

  String toResponseString(dynamic response) {
    try {
      final uri = Uri.parse(url);

      final log = '''===👍️ START RESPONSE 👍===
        
      API is for ${uri.pathSegments.last}
      URL = ${Uri(queryParameters: queryParameters, host: uri.host, path: uri.path, scheme: uri.scheme, port: uri.port, userInfo: uri.userInfo)}
      Data = ${getFormData()}
      header data = 
      Response:
        $response
        
===👍️ END RESPONSE 👍===''';

      return log;
    } catch (e) {
      return '''===👍️ START RESPONSE 👍===
      
      URL = $url
      Data = ${getFormData()}
      Response:
        $response
        
===👍️ END RESPONSE 👍===
      ''';
    }
  }

  dynamic getFormData() {
    if(data is FormData) {
      final formData = data as FormData;
      return formData.fields;
    } else {
      return data;
    }
  }

  @override
  toString() {
    try {
      final uri = Uri.parse(url);

      final log = '''===🌐 START REQUEST 🌐===
      
      API is for ${uri.pathSegments.last}
      URL = ${Uri(queryParameters: queryParameters, host: uri.host, path: uri.path, scheme: uri.scheme, port: uri.port, userInfo: uri.userInfo)}
      Data = ${getFormData()}
      
      ===🌐 END REQUEST 🌐===''';

      return log;
    } catch (e) {
      return "API is for $url\nQuery = $queryParameters\n Data = $data";
    }
  }
}
