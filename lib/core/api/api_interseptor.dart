import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor{
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
              options.headers['Accept_Language']='en';
    super.onRequest(options, handler);
  }
 
}