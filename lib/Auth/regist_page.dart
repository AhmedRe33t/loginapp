import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:loginapp/Auth/login_page.dart';
import 'package:loginapp/Auth/regist_page.dart';
import 'package:loginapp/constant.dart';
import 'package:loginapp/widgets/defualt_phone_field.dart';

class RegistPage extends StatefulWidget {
   RegistPage({super.key});

  @override
  State<RegistPage> createState() => _RegistPageState();
}

class _RegistPageState extends State<RegistPage> {
 CountryCode mycountry=CountryCode(name: 'EG',dialCode: '+20');

  GlobalKey<FormState> formKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:const BoxDecoration(color: Colors.black),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: ListView(
              children:  [
                Container(
                  height: 200,
                  
                  decoration:const BoxDecoration(
                    image:DecorationImage(image: AssetImage('assets/images/71f1a93b6932fffc6a4e8bd43dab7f39.gif'))
                    ),
                ),
              const  Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Email..',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                     color: Color.fromARGB(255, 128, 8, 8)
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    style:const TextStyle(color:Color.fromARGB(255, 124, 20, 169)),
                      validator: (value) {
                        if(value!.isEmpty){
                          return 'please enter your email';
                        } else if(!value.contains('@gmail.com')){
                          return 'email should contain @gmail.com';
                        }
                      },
                    controller: emailControllerRegist,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:const BorderSide(
                          color: Colors.transparent,
                          
                        )
                      )
                    ),
                  )
                ),
                const  Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Pssword..',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromARGB(255, 128, 8, 8)
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    obscureText: obsecure,
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'empty password';
                      }

                    },
                    style:const TextStyle(color: Color.fromARGB(255, 124, 20, 169)),
                    controller: PasswordControllerRegist,
                    decoration: InputDecoration(
                       suffixIcon: IconButton(
                        style: ButtonStyle(iconColor: WidgetStateProperty.all(Colors.red)),
                        onPressed: (){
                        obsecure = ! obsecure;
                        setState(() {
                          
                        });
                      },
                       icon:obsecure? Icon(Icons.visibility): Icon(Icons.visibility_off) ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:const BorderSide(
                          color: Colors.transparent
                        )
                      )
                    ),
                    
                  )
                  
                ),
                const  Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Name..',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromARGB(255, 128, 8, 8)
                  ),),
                ),
                 Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'empty name';
                      }

                    },
                    style:const TextStyle(color: Color.fromARGB(255, 124, 20, 169)),
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:const BorderSide(
                          color: Colors.transparent
                        )
                      )
                    ),
                  )
                ),
                const  Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Number..',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromARGB(255, 128, 8, 8)
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: DefaultPhoneField(
                    color:const Color.fromARGB(255, 124, 20, 169),
                    controller:phoneController ,
                   validator: (value) {  
                        if(value!.isEmpty){
                          return 'empty number';
                        }return null;
                   },
                   onChange: (countryCode) {
                     mycountry=countryCode;
                   },
                   
                   ),
                ),
               const SizedBox(height: 30,),
               ElevatedButton(
                style:const ButtonStyle(
                  backgroundColor:WidgetStateColor.transparent
                ),
                onPressed: (){
                  if(formKey.currentState!.validate()){
                    print(emailControllerRegist.text);
                    print(PasswordControllerRegist.text);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LoginPage()));
                  }
                },
                child:const Text('Regist',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                     color: Color.fromARGB(255, 124, 20, 169)
                  ),),),
            
                  Row(
                    children: [
                     const Text('I have an acount actually..',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                     color:Color.fromARGB(255, 128, 8, 8)
                  ),),
                  ElevatedButton(
                style:const ButtonStyle(
                  backgroundColor:WidgetStateColor.transparent
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginPage()));
                },
                child:const Text('Login',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                     color:Color.fromARGB(255, 124, 20, 169)
                  ),),),
                    ],
                  )
              ],
              
                   ),
          ),
        ),
        ),
    );
  }
}