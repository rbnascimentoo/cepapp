import 'package:http_interceptor/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';

class ApiInterceptor implements InterceptorContract {

  @override
  Future<RequestData> interceptRequest({RequestData data}) async {

    try {
      data.headers["Content-Type"] = "application/json";
    } catch (e) {
      print(e);
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    return data;
  }

}