
import 'package:bytebank/web/http/interceptors/logging_intecerptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

final Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);
final Uri url = Uri.http("192.168.0.17:8080", "/transactions");


