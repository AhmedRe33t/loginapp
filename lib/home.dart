import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/constant.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
  CountryCode mycountry=CountryCode(name: 'EG',dialCode: '+20');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text('Profile',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Email : ${emailControllerLogin.text}',style:const TextStyle(fontWeight: FontWeight.bold,
            ),),
           const SizedBox(height: 10,),
             Text('Name : ${nameController.text}',style:const TextStyle(fontWeight: FontWeight.bold,
            ),),
          const  SizedBox(height: 10,),
             Text('Phone : ${mycountry} ${phoneController.text}',style:const TextStyle(fontWeight: FontWeight.bold,
            ),),
          const  SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}