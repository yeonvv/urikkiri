import 'package:flutter/material.dart';

class BasicTextformfield extends StatelessWidget {
  final String formInputValue;
  final bool isBusinessRegistrationNumber;
  final bool isPasswordField;
  final bool isPhoneField;
  final bool isNameField;
  final TextEditingController controller;

  BasicTextformfield({
    super.key,
    required this.formInputValue,
    this.isPasswordField = false,
    this.isPhoneField = false,
    this.isBusinessRegistrationNumber = false,
    required this.controller,
    this.isNameField = false,
  });

  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    final RegExp businessNumberRegex = RegExp(r'^\d{10}$');
    final RegExp passwordRegex =
        RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#\$%\^&\*])(?=.{6,})');
    final RegExp phoneNumberRegex = RegExp(r'^\d{11}$');
    final RegExp nameRegex = RegExp(r'^[a-zA-Z가-힣]{2,}$');
    String errorText = "올바른 $formInputValue 를 입력하세요";

    return TextFormField(
      controller: controller,
      showCursor: false,
      style: Theme.of(context).textTheme.labelLarge,
      textAlign: TextAlign.center,
      keyboardType: isPhoneField || isBusinessRegistrationNumber
          ? TextInputType.phone
          : TextInputType.text,
      obscureText: isPasswordField,
      decoration: InputDecoration(
        hintText: formInputValue,
      ),
      autocorrect: false,
      validator: (value) {
        if (isBusinessRegistrationNumber &&
            !businessNumberRegex.hasMatch(value.toString())) {
          return errorText;
        }
        if (isPasswordField && !passwordRegex.hasMatch(value.toString())) {
          return errorText;
        }
        if (isPhoneField && !phoneNumberRegex.hasMatch(value.toString())) {
          return errorText;
        }
        if (isNameField && !nameRegex.hasMatch(value.toString())) {
          return errorText;
        }
        return null;
      },
      onSaved: (newValue) {
        if (newValue != null) {
          _formData[formInputValue] = newValue;
        }
      },
    );
  }
}
