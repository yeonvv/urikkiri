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
  final String? Function(String?)? addPasswordValidator;

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
    this.addPasswordValidator,
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

  String? _validateID(String value) {
    final RegExp idRegex = RegExp(r'^.{4,20}$');
    return idRegex.hasMatch(value) ? null : "4자 이상 20자 이하로 설정해 주세요";
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      showCursor: false,
      style: Theme.of(context).textTheme.labelLarge,
      textAlign: TextAlign.center,
      keyboardType: isPhoneField || isBusinessRegistrationNumber
          ? TextInputType.number
          : TextInputType.text,
      obscureText: isPasswordField,
      decoration: InputDecoration(
        hintText: formInputValue,
      ),
      autocorrect: false,
      validator: (value) {
        String? validationError;
        if (value == null || value.isEmpty) {
          return "필수 입력 항목입니다.";
        }
        if (isBusinessRegistrationNumber) {
          validationError = _validateBusinessNumber(value);
        }
        if (isPasswordField) {
          validationError = _validatePassword(value);
        }
        if (isPhoneField) {
          validationError = _validatePhoneNumber(value);
        }
        if (isNameField) {
          validationError = _validateName(value);
        }
        if (isID) {
          validationError = _validateID(value);
        }
        if (addPasswordValidator != null) {
          validationError ??= addPasswordValidator!(value);
        }
        return validationError;
      },
      onSaved: (newValue) {
        if (newValue != null) {
          _formData[formInputValue] = newValue;
        }
      },
    );
  }
}
