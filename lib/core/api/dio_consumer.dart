import 'package:dio/dio.dart';
import 'package:loginapp/core/api/api_consumer.dart';
import 'package:loginapp/core/api/api_interseptor.dart';
import 'package:loginapp/core/api/end_point.dart';
import 'package:loginapp/core/errors/exceptions.dart';

class DioConsumer extends ApiConsumer{
  final Dio dio;

  DioConsumer({required this.dio}){
    dio.options.baseUrl=EndPoint.baseUrl;
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true
    ));
  }
  @override
  Future delet(String path, {dynamic data, Map<String, dynamic>? queryParametars,isFormData=false})async {
       try {
  var response=await dio.delete(path,data:isFormData?FormData.fromMap(data): data,queryParameters: queryParametars);
  return response.data;
} on DioException catch (e) {
   handelDioException(e);
   }
  }

 

  @override
  Future get(String path, {dynamic data, Map<String, dynamic>? queryParametars,isFormData=false}) async{
       try {
  final response   = await dio.get(path,data:isFormData?FormData.fromMap(data): data,queryParameters: queryParametars);
      return response.data;
} on DioException catch (e) {
      handelDioException(e);
}
  }

  @override
  Future patch(String path, {dynamic data, Map<String, dynamic>? queryParametars,isFormData=false})async {
        
        try {
  final response=await dio.patch(path,data:isFormData?FormData.fromMap(data): data,queryParameters: queryParametars);
  return response.data;
} on DioException catch (e) {
       handelDioException(e);
}
  }

  @override
  Future post(String path, {dynamic data, Map<String, dynamic>? queryParametars,isFormData=false}) async{
     
     try {
  final response=await dio.post(path,data:isFormData?FormData.fromMap(data): data,queryParameters: queryParametars);
  return response;
} on DioException catch (e) {
   handelDioException(e);
}
     
  }
 
}