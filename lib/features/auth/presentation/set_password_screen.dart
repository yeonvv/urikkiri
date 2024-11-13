import 'package:flutter/material.dart';
import 'package:urikkiri_beta/core/constants/gaps.dart';
import 'package:urikkiri_beta/core/utils/appbar_pop.dart';
import 'package:urikkiri_beta/core/widgets/main_button.dart';
import 'package:urikkiri_beta/features/auth/presentation/widgets/app_title_text.dart';
import 'package:urikkiri_beta/features/auth/presentation/widgets/basic_textformfield.dart';

class SetPasswordScreen extends StatefulWidget {
  final bool isEmployee;
  final bool forgotPassword;
  const SetPasswordScreen({
    super.key,
    this.forgotPassword = false,
    this.isEmployee = true,
  });

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordReConfirmController =
      TextEditingController();

  bool _isButtonEnabled = false;

  void _checkFormValidity() {
    _isButtonEnabled = _passwordController.text.isNotEmpty &&
        _passwordReConfirmController.text.isNotEmpty;
    setState(() {});
  }

  String? _validatePasswordConfirmation(String? value) {
    if (value != _passwordController.text) {
      return "비밀번호가 일치하지 않습니다.";
    }
    return null;
  }

  void _submitForm() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Navigator.popUntil(
          context,
          ModalRoute.withName("/login"),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_checkFormValidity);
    _passwordReConfirmController.addListener(_checkFormValidity);
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _passwordReConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.forgotPassword ? "비밀번호 변경" : "비밀번호 설정"),
          leading: const AppBarPop()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppTitleText(isEmployee: widget.isEmployee),
            Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    FractionallySizedBox(
                      widthFactor: 0.7,
                      child: BasicTextformfield(
                        formInputValue:
                            widget.forgotPassword ? "새 비밀번호" : "비밀번호",
                        isLogIn: false,
                        isPasswordField: true,
                        controller: _passwordController,
                      ),
                    ),
                    Gaps.v14,
                    FractionallySizedBox(
                      widthFactor: 0.7,
                      child: BasicTextformfield(
                        formInputValue:
                            widget.forgotPassword ? "새 비밀번호 확인" : "비밀번호 확인",
                        isLogIn: false,
                        isPasswordField: true,
                        controller: _passwordReConfirmController,
                        addPasswordValidator: _validatePasswordConfirmation,
                      ),
                    ),
                    Gaps.v24,
                    MainButton(
                      labelText: widget.forgotPassword
                          ? "비밀번호 변경"
                          : widget.isEmployee
                              ? "무리에 합류하기"
                              : "우리 팀 만들기",
                      isEnabled: _isButtonEnabled,
                      onPressed: _submitForm,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
