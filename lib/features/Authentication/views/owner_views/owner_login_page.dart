import 'package:flutter/material.dart';
import 'package:urikkiri_beta/constants/gaps.dart';
import 'package:urikkiri_beta/features/Authentication/views/owner_views/owner_signup_screen.dart';
import 'package:urikkiri_beta/features/Authentication/views/widgets/app_title_text.dart';
import 'package:urikkiri_beta/features/Authentication/views/widgets/basic_scaffold.dart';
import 'package:urikkiri_beta/features/Authentication/views/widgets/basic_textformfield.dart';
import 'package:urikkiri_beta/features/Authentication/views/widgets/form_buttom.dart';
import 'package:urikkiri_beta/features/Authentication/views/widgets/maintain_login_button.dart';

class OwnerLoginPage extends StatefulWidget {
  const OwnerLoginPage({super.key});

  @override
  State<OwnerLoginPage> createState() => _OwnerLoginPageState();
}

class _OwnerLoginPageState extends State<OwnerLoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _businessNumberController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isButtonEnabled = false;

  void _submitForm() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
      }
    }
  }

  void _onSignUpTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const OwnerSignupScreen(),
      ),
    );
  }

  void _checkFormValidity() {
    _isButtonEnabled = _businessNumberController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _businessNumberController.addListener(_checkFormValidity);
    _passwordController.addListener(_checkFormValidity);
  }

  @override
  void dispose() {
    _businessNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gaps.v60,
            const AppTitleText(
              isEmployee: false,
            ),
            Gaps.v96,
            Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    FractionallySizedBox(
                      widthFactor: 0.7,
                      child: BasicTextformfield(
                        formInputValue: "사업자 등록 번호",
                        isBusinessRegistrationNumber: true,
                        controller: _businessNumberController,
                      ),
                    ),
                    Gaps.v14,
                    FractionallySizedBox(
                      widthFactor: 0.7,
                      child: BasicTextformfield(
                        formInputValue: "비밀번호",
                        isPasswordField: true,
                        controller: _passwordController,
                      ),
                    ),
                    Gaps.v24,
                    FormButton(
                      labelText: "우리 팀 관리하기",
                      isEnabled: _isButtonEnabled,
                      onPressed: _submitForm,
                    ),
                    Gaps.v24,
                    const MaintainLoginButton(),
                    Gaps.v24,
                    GestureDetector(
                      onTap: _onSignUpTap,
                      child: Text(
                        "처음 오는 대장코끼리",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Gaps.v20,
                    const Text("비밀번호를 잊어버렸어요"),
                  ],
                ),
              ),
            ),
            Gaps.v32,
          ],
        ),
      ),
    );
  }
}
