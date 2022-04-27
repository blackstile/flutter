
import 'package:http_interceptor/http/http.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';

class LoggingInterceptor implements InterceptorContract{

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async{
    print ("Request Data");
    print("Method ${data.method}");
    print("Url: ${data.url}");
    print ("Headers: ${data.headers}");
    print ("Body: ${data.body}");
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print ("Response Data");
    print ("Status Code: ${data.statusCode}");
    print ("Headers: ${data.headers}");
    print ("Body: ${data.body}");
    return data;
  }

}