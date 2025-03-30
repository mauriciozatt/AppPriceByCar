// ignore: file_names
import 'package:http_interceptor/http_interceptor.dart';

class BasicInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    // print("Request to: ${data.url}");
    // print("Headers: ${data.headers}");
    // print("Body: ${data.body}");
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    // print("Response from: ${data.url}");
    //print("Status code: ${data.statusCode}");
    //print("Headers: ${data.headers}");
    //print("Body: ${data.body}");
    return data;
  }
}