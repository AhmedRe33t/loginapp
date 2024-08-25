import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class DefaultPhoneField extends StatelessWidget{
  TextEditingController ? controller;
  String? Function(String?)? validator;
  TextInputType? keyBoardType;
  Function(CountryCode)? onChange;
  String? hintText;
  String? labelText;
  Color? color;
  DefaultPhoneField({super.key, required this.controller,this.hintText,this.labelText,
    required this.validator, this.keyBoardType,
    this.onChange,this.color
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
     
      style:TextStyle(
        color: color
      ) ,
      controller:controller ,
      validator: validator,
      keyboardType: keyBoardType,
      decoration: InputDecoration(
         border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:const BorderSide(
                        color: Colors.transparent
                      )
                    ),
        prefixIcon:
         CountryCodePicker(
          onChanged:onChange ,
          initialSelection: 'EG',
          favorite: const ['+20','EG'],textStyle:const TextStyle(color:Colors.white ),
          backgroundColor: Colors.white,
        ),
        hintText: hintText,
        labelText: labelText,

      ),

    );
  }

}