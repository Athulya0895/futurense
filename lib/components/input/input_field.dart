import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final String hintText;
  final dynamic validation;
  final TextInputType? textInputType;
  final int? maxline;
  final int? minline;
  // final String initialval;
  const InputField({
    Key? key,
    this.prefixIcon,
    this.suffixIcon,
    this.validation,
    this.textInputType,
    this.obscureText = false,
    this.controller,
    this.hintText = '',
    this.maxline,
    this.minline,
    // this.initialval = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      // initialValue: initialval,
      maxLines: maxline,
      minLines: minline,
      validator: validation,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Color(0xffEBF6F7),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black.withOpacity(0.01),
            ),
            borderRadius: BorderRadius.circular(10)),
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff6EBFC3),
            ),
            borderRadius: BorderRadius.circular(10)),
        hintStyle: TextStyle(color: Color(0xff6EBFC3)),
      ),
    );
  }
}
