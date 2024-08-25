import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginapp/Auth/regist_page.dart';
import 'package:loginapp/constant.dart';
import 'package:loginapp/cubit/cubit/auth_cubit_cubit.dart';
import 'package:loginapp/home.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubitCubit, AuthCubitState>(
      listener: (BuildContext context, AuthCubitState state) { 
            if(state is SignInSuccess){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('success')));
            }else if(state is SignInFaluier){
               ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(state.massege)));
            }
       },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/images/df1innp-812c3dbd-588e-419b-9f21-abd61895169c.jpg'),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Email',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromARGB(255, 216, 13, 13)),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(20),
                        child: TextFormField(
                          controller: emailControllerLogin,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                  ))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your email';
                            } else if (!value.contains('@gmail.com')) {
                              return 'email should contain @gmail.com';
                            // } else if (value != emailControllerRegist.text) {
                            //   return 'Wrong email';
                            }
                            setState(() {});
                            return null;
                          },
                        )),
                    const Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Pssword',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromARGB(255, 234, 11, 11)),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(20),
                        child: TextFormField(
                          obscureText: obsecure,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'empty password';
                            // } else if (value != PasswordControllerRegist.text) {
                            //   return 'wrong password';
                            }

                            setState(() {});
                            return null;
                          },
                          controller: PasswordControllerLogin,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  style: ButtonStyle(
                                      iconColor:
                                          WidgetStateProperty.all(Colors.red)),
                                  onPressed: () {
                                    obsecure = !obsecure;
                                    setState(() {});
                                  },
                                  icon: obsecure
                                      ? Icon(Icons.visibility)
                                      : Icon(Icons.visibility_off)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent))),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                   state is SignInLoading?const CircularProgressIndicator(): ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: WidgetStateColor.transparent),
                      onPressed: () {
                        print(emailControllerLogin.text);
                        print(PasswordControllerLogin.text);
                        print(emailControllerRegist.text);
                        if (formKey.currentState!.validate()) {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (_) => HomePage()));
                          context.read<AuthCubitCubit>().signIn();
                        }
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromARGB(255, 222, 2, 2)),
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Dont have an acount.....',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromARGB(255, 10, 10, 10)),
                        ),
                        ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor: WidgetStateColor.transparent),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => RegistPage()));
                          },
                          child: const Text(
                            'Regist',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color.fromARGB(255, 230, 9, 9)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }, 
    );
  }
}
