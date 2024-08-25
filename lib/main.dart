import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginapp/Auth/login_page.dart';
import 'package:loginapp/Auth/regist_page.dart';
import 'package:loginapp/cubit/cubit/auth_cubit_cubit.dart';
import 'package:loginapp/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubitCubit(),
      child: MaterialApp(
        home: LoginPage(),
      ),
    );
  }
}
