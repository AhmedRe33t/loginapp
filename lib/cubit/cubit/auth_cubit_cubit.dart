import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../constant.dart';

part 'auth_cubit_state.dart';

class AuthCubitCubit extends Cubit<AuthCubitState> {
  AuthCubitCubit() : super(AuthCubitInitial());




 signIn()async{
  try {
    emit(SignInLoading());
        final response=await Dio().post('https://project1.amit-learning.com/api/auth/login',data: {
    'email':emailControllerLogin.text,
    'password':PasswordControllerLogin.text
  }
    
  );
  print(response);
  emit(SignInSuccess());
}  catch (e) {
  emit(SignInFaluier(massege: e.toString()));
  print(e.toString());
}
 }

}
