import 'package:flutter/material.dart';
import 'package:urikkiri_beta/core/constants/gaps.dart';
import 'package:urikkiri_beta/core/widgets/main_buttom.dart';
import 'package:urikkiri_beta/features/auth/presentation/signup_validate_screen.dart';
import 'package:urikkiri_beta/features/auth/presentation/widgets/app_title_text.dart';
import 'package:urikkiri_beta/features/auth/presentation/widgets/basic_scaffold.dart';
import 'package:urikkiri_beta/features/auth/presentation/widgets/basic_textformfield.dart';
import 'package:urikkiri_beta/features/auth/presentation/widgets/maintain_login_button.dart';
import 'package:urikkiri_beta/features/home/presentation/home_screen.dart';

class LoginPage extends StatefulWidget {
  final bool isEmployee;
  const LoginPage({
    super.key,
    required this.isEmployee,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
          (route) => false,
        );
      }
    }
  }

  void _onSignUpTap(bool isEmployee) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => SignupScreen(isEmployee: isEmployee),
          settings: const RouteSettings(name: "/signup")),
    );
  }

  void _checkFormValidity() {
    _isButtonEnabled = _businessNumberController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
    setState(() {});
  }

  void _onForgotPassword(bool isEmployee) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => SignupScreen(
                forgotPassword: true,
                isEmployee: isEmployee,
              ),
          settings: const RouteSettings(name: "/find_password")),
    );
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
            AppTitleText(
              isEmployee: widget.isEmployee,
            ),
            Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    FractionallySizedBox(
                      widthFactor: 0.7,
                      child: BasicTextformfield(
                        formInputValue: widget.isEmployee ? "아이디" : "사업자 등록 번호",
                        isBusinessRegistrationNumber:
                            widget.isEmployee ? false : true,
                        isID: widget.isEmployee ? true : false,
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
                    MainButtom(
                      labelText: widget.isEmployee ? "합류하기" : "우리 팀 관리하기",
                      isEnabled: _isButtonEnabled,
                      onPressed: _submitForm,
                    ),
                    Gaps.v24,
                    const MaintainLoginButton(),
                    Gaps.v24,
                    GestureDetector(
                      onTap: () => _onSignUpTap(widget.isEmployee),
                      child: Text(
                        "처음 오는 ${widget.isEmployee ? '팀원코끼리' : '대장코끼리'}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Gaps.v20,
                    GestureDetector(
                      onTap: () => _onForgotPassword(widget.isEmployee),
                      child: const Text("비밀번호를 잊어버렸어요"),
                    ),
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
