import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool enabletextfield;
  final TextEditingController? controller;
  final String hintText;
  final dynamic validation;
  final TextInputType? textInputType;
  final int? maxline;
  final int? minline;
  // final String initialval;
  final bool autofocus;

  const InputField({
    Key? key,
    this.prefixIcon,
    this.suffixIcon,
    this.validation,
    this.textInputType,
    this.obscureText = false,
    this.enabletextfield = true,
    this.controller,
    this.hintText = '',
    this.maxline,
    this.minline,
    // this.initialval = '',
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabletextfield,
      keyboardType: textInputType,
      // initialValue: initialval,

      scrollPadding: const EdgeInsets.all(20.0),
      autofocus: autofocus,
      maxLines: maxline,
      minLines: minline,
      validator: validation,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(15),
        hintText: hintText,
        filled: true,
        fillColor: const Color(0xffEBF6F7),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black.withOpacity(0.01),
            ),
            borderRadius: BorderRadius.circular(10)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xff6EBFC3),
            ),
            borderRadius: BorderRadius.circular(10)),
        // errorBorder: OutlineInputBorder(
        //   //<-- SEE HERE
        //   borderSide: BorderSide(width: 1, color: Color(0xffFD2FE2)),
        // ),

        hintStyle: const TextStyle(color: Color(0xff6EBFC3), fontSize: 14),
      ),
    );
  }
}
