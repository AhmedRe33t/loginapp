abstract class ApiConsumer{
 Future<dynamic> post(
     String path,{
      Object? data,
      Map<String,dynamic>? queryParametars,
      bool isFormData=false
     }

  );
  Future<dynamic> get(
     String path,{
      Object? data,
      Map<String,dynamic>? queryParametars,
     bool isFormData=false
     }
  );
  Future<dynamic> patch(
     String path,{
      Object? data,
      Map<String,dynamic>? queryParametars,
    bool  isFormData=false
     }
  );
  Future<dynamic> delet(
     String path,{
      Object? data,
      Map<String,dynamic>? queryParametars,
    bool  isFormData=false
     }
  );
}