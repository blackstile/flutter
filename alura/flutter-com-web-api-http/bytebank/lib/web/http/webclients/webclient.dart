import 'package:bytebank/web/http/interceptors/logging_intecerptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

final localhost = "10.0.2.2";
final Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()], requestTimeout: Duration(seconds: 5));
final Uri url = Uri.http("$localhost:8080", "/transactions");
