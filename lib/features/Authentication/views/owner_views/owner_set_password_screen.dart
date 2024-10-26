import 'package:flutter/material.dart';
import 'package:urikkiri_beta/constants/gaps.dart';
import 'package:urikkiri_beta/features/Authentication/views/widgets/app_title_text.dart';
import 'package:urikkiri_beta/features/Authentication/views/widgets/basic_scaffold.dart';
import 'package:urikkiri_beta/features/Authentication/views/widgets/basic_textformfield.dart';
import 'package:urikkiri_beta/features/Authentication/views/widgets/form_buttom.dart';

class OwnerSetPasswordScreen extends StatefulWidget {
  final forgotPassword;
  const OwnerSetPasswordScreen({
    super.key,
    this.forgotPassword = false,
  });

  @override
  State<OwnerSetPasswordScreen> createState() => _OwnerSetPasswordScreenState();
}

class _OwnerSetPasswordScreenState extends State<OwnerSetPasswordScreen> {
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

  void _submitForm() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Navigator.popUntil(
          context,
          ModalRoute.withName("/ownerLogin"),
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
    return BasicScaffold(
      appBar: AppBar(
        title: Text(widget.forgotPassword ? "비밀번호 변경" : "비밀번호 설정"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppTitleText(isEmployee: false),
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
                      ),
                    ),
                    Gaps.v24,
                    FormButton(
                      labelText: widget.forgotPassword ? "비밀번호 변경" : "우리 팀 만들기",
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
