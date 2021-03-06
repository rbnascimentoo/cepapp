import 'dart:convert';

import 'package:cepapp/data/repositories/interceptor_utils.dart';
import 'package:cepapp/utils/constants/constants.dart';
import 'package:cepapp/utils/enums/type_rest.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_client_with_interceptor.dart';

class ServiceHttpUtil {

  static final http.Client client = HttpClientWithInterceptor.build(interceptors: [
    ApiInterceptor(),
  ]);

  static Future<dynamic> callService(
      bool isHttps, String host, TypeRest rest, String uri,
      {String json,
        String msgConnection = Constants.connectionError,
        String msgTimeOut = Constants.timeoutError,
        String msgFailure = Constants.communicationError,
        Map<String, dynamic> qParam}) async {

    Uri url = isHttps
        ? Uri.https(host, uri, qParam)
        : Uri.http(host, uri, qParam);

    http.Response response;

    switch (rest) {
      case TypeRest.GET:
        debugPrint('------------------------------- REQUEST GET --------------------------------');
        debugPrint('Link de conexão -> $url');
        debugPrint('----------------------------------------------------------------------------');
        response = await client.get(url);
        break;

      case TypeRest.POST:
        debugPrint('------------------------------- REQUEST POST --------------------------------');
        debugPrint('Link de conexão -> $url');
        debugPrint('POST -> $json');
        debugPrint('----------------------------------------------------------------------------');
        response = await client.post(url, body: json);
        break;

      default:
        {
          debugPrint('callService -> default');
          break;
        }
    }

    if (response.statusCode != 200) {
      throw msgFailure;
    }

    return jsonDecode(response.body);

  }

}