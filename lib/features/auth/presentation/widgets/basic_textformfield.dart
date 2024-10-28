import 'package:flutter/material.dart';

class BasicTextformfield extends StatelessWidget {
  final String formInputValue;
  final bool isBusinessRegistrationNumber;
  final bool isPasswordField;
  final bool isPhoneField;
  final bool isNameField;
  final bool isLogIn;
  final bool isID;
  final TextEditingController controller;

  BasicTextformfield({
    super.key,
    required this.formInputValue,
    this.isPasswordField = false,
    this.isPhoneField = false,
    this.isBusinessRegistrationNumber = false,
    required this.controller,
    this.isNameField = false,
    this.isLogIn = true,
    this.isID = false,
  });

  final Map<String, String> _formData = {};

  String? _validateBusinessNumber(String value) {
    final RegExp businessNumberRegex = RegExp(r'^\d{10}$');
    if (isLogIn) {
      return businessNumberRegex.hasMatch(value)
          ? null
          : '올바른 사업자 등록 번호가 아닙니다.';
    } else {
      return businessNumberRegex.hasMatch(value)
          ? null
          : '사업자 등록 번호 10자리를 입력하세요.';
    }
  }

  String? _validatePassword(String value) {
    final RegExp minLengthRegex = RegExp(r'^.{8,}$');
    final RegExp letterRegex = RegExp(r'[a-zA-Z]');
    final RegExp digitRegex = RegExp(r'\d');
    if (isLogIn) {
      if (!minLengthRegex.hasMatch(value) ||
          !letterRegex.hasMatch(value) ||
          !digitRegex.hasMatch(value)) {
        return "올바른 비밀번호가 아닙니다";
      }
    } else {
      if (!minLengthRegex.hasMatch(value)) {
        return '8자 이상이어야 합니다.';
      }
      if (!letterRegex.hasMatch(value)) {
        return '문자를 포함해야 합니다.';
      }
      if (!digitRegex.hasMatch(value)) {
        return '숫자를 포함해야 합니다.';
      }
    }
    return null;
  }

  String? _validateName(String value) {
    final RegExp nameRegex = RegExp(r'^[가-힣]{2,}$');
    return nameRegex.hasMatch(value) ? null : '2자 이상의 성함을 입력해 주세요.';
  }

  String? _validatePhoneNumber(String value) {
    final RegExp phoneNumberRegex = RegExp(r'^\d{11}$');
    return phoneNumberRegex.hasMatch(value) ? null : '전화번호 11자리를 입력해 주세요.';
  }

  @override
  Widget build(BuildContext context) {
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
        if (value == null || value.isEmpty) {
          return "필수 입력 항목입니다.";
        }
        if (isBusinessRegistrationNumber) {
          return _validateBusinessNumber(value);
        }
        if (isPasswordField) {
          return _validatePassword(value);
        }
        if (isPhoneField) {
          return _validatePhoneNumber(value);
        }
        if (isNameField) {
          return _validateName(value);
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
