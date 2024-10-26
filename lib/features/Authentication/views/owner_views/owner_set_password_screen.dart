import 'package:flutter/material.dart';
import 'package:urikkiri_beta/constants/gaps.dart';
import 'package:urikkiri_beta/features/Authentication/views/widgets/app_title_text.dart';
import 'package:urikkiri_beta/features/Authentication/views/widgets/basic_scaffold.dart';
import 'package:urikkiri_beta/features/Authentication/views/widgets/basic_textformfield.dart';
import 'package:urikkiri_beta/features/Authentication/views/widgets/form_buttom.dart';

class OwnerSetPasswordScreen extends StatefulWidget {
  const OwnerSetPasswordScreen({super.key});

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
      appBar: AppBar(),
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
                        formInputValue: "비밀번호",
                        isPasswordField: true,
                        controller: _passwordController,
                      ),
                    ),
                    Gaps.v14,
                    FractionallySizedBox(
                      widthFactor: 0.7,
                      child: BasicTextformfield(
                        formInputValue: "비밀번호 확인",
                        isPasswordField: true,
                        controller: _passwordReConfirmController,
                      ),
                    ),
                    Gaps.v24,
                    FormButton(
                      labelText: "우리 팀 만들기",
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
