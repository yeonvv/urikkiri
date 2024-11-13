import 'package:flutter/material.dart';
import 'package:urikkiri_beta/core/constants/gaps.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';
import 'package:urikkiri_beta/core/utils/appbar_pop.dart';
import 'package:urikkiri_beta/core/widgets/main_button.dart';
import 'package:urikkiri_beta/core/widgets/main_navigation.dart';
import 'package:urikkiri_beta/core/widgets/ripple_effect.dart';
import 'package:urikkiri_beta/features/auth/presentation/signup_validate_screen.dart';
import 'package:urikkiri_beta/features/auth/presentation/widgets/app_title_text.dart';
import 'package:urikkiri_beta/features/auth/presentation/widgets/basic_textformfield.dart';
import 'package:urikkiri_beta/features/auth/presentation/widgets/maintain_login_button.dart';

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
            builder: (context) => const MainNavigation(),
          ),
          (route) => false,
        );
      }
    }
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
    return Scaffold(
      appBar: AppBar(leading: const AppBarPop()),
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
                    MainButton(
                      labelText: widget.isEmployee ? "합류하기" : "우리 팀 관리하기",
                      isEnabled: _isButtonEnabled,
                      onPressed: _submitForm,
                    ),
                    Gaps.v24,
                    const MaintainLoginButton(),
                    Gaps.v24,
                    RippleEffect(
                      borderRadius: Sizes.size8,
                      brightTone: false,
                      destination: SignupScreen(
                        forgotPassword: false,
                        isEmployee: widget.isEmployee,
                      ),
                      routeName: "signup",
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size20, vertical: Sizes.size6),
                        child: Text(
                          "처음 오는 ${widget.isEmployee ? '팀원코끼리' : '대장코끼리'}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                    Gaps.v20,
                    RippleEffect(
                      borderRadius: Sizes.size8,
                      brightTone: false,
                      destination: SignupScreen(
                        forgotPassword: true,
                        isEmployee: widget.isEmployee,
                      ),
                      routeName: "find_password",
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size20, vertical: Sizes.size6),
                        child: const Text("비밀번호를 잊어버렸어요"),
                      ),
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
