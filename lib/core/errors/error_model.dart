import 'package:loginapp/core/api/end_point.dart';

class ErrorModel {
  final String statues;
  final String errorMassge;

  ErrorModel({required this.statues, required this.errorMassge});

  factory ErrorModel.fromJson(Map<String,dynamic> jsonData){
    return ErrorModel( 
      statues:jsonData[ApiKey.status] ,
       errorMassge: jsonData[ApiKey.massege][0]);
  }
}