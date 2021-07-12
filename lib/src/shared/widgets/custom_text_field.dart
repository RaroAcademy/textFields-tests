import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key key,
    this.errorMessage,
    this.hintText,
    this.labelText,
    this.helperText,
    this.obscureText = false,
    this.onChanged,
    this.inputFormatters,
    this.controller,
    this.icon,
    this.suffixIcon,
    this.suffix,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.onEditingComplete,
    this.validator,
  }) : super(key: key);

  final String errorMessage;

  final String hintText;
  final String labelText;
  final String helperText;
  final bool obscureText;
  final ValueChanged<String> onChanged;
  final Function(String) validator;
  final List<TextInputFormatter> inputFormatters;
  final TextEditingController controller;
  final Widget icon;
  final Widget suffixIcon;
  final Widget suffix;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Function onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: obscureText,
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onEditingComplete: onEditingComplete,
      validator: validator,
      decoration: InputDecoration(
        icon: icon,
        suffixIcon: suffixIcon,
        suffix: suffix,
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.black),
        helperText: helperText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              16.0,
            ),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              16.0,
            ),
          ),
          borderSide: BorderSide(color: Colors.green),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              60.0,
            ),
          ),
          borderSide: BorderSide(color: Colors.red),
        ),
        errorText: errorMessage,
      ),
      inputFormatters: inputFormatters,
    );
  }
}
