import 'package:flutter/material.dart';
import 'package:urikkiri_beta/core/constants/gaps.dart';
import 'package:urikkiri_beta/core/widgets/main_button.dart';
import 'package:urikkiri_beta/features/auth/presentation/set_password_screen.dart';
import 'package:urikkiri_beta/features/auth/presentation/widgets/app_title_text.dart';
import 'package:urikkiri_beta/features/auth/presentation/widgets/basic_scaffold.dart';
import 'package:urikkiri_beta/features/auth/presentation/widgets/basic_textformfield.dart';
import 'package:urikkiri_beta/features/auth/presentation/widgets/otp_inputfield.dart';

class SignupScreen extends StatefulWidget {
  final bool isEmployee;
  final bool forgotPassword;
  const SignupScreen({
    super.key,
    this.forgotPassword = false,
    this.isEmployee = true,
  });

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _businessNumberController =
      TextEditingController();
  final TextEditingController _ownerNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  bool _isButtonEnabled = false;
  bool _showOTPField = false;
  String _otp = "";

  void _submitForm() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        _showOTPField = true;
        setState(() {});
      }
    }
  }

  void _onPasswordSet(bool isEmployee) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SetPasswordScreen(
          forgotPassword: widget.forgotPassword,
          isEmployee: isEmployee,
        ),
        settings: const RouteSettings(name: "/set_password"),
      ),
    );
  }

  void _checkFormValidity() {
    _isButtonEnabled = _businessNumberController.text.isNotEmpty &&
        (widget.isEmployee ? true : _ownerNameController.text.isNotEmpty) &&
        _phoneNumberController.text.isNotEmpty;
    setState(() {});
  }

  void _onOtpCompleted(String otp) {
    _otp = otp;
    setState(() {});
    _checkFormValidity();
  }

  @override
  void initState() {
    super.initState();
    _businessNumberController.addListener(_checkFormValidity);
    _ownerNameController.addListener(_checkFormValidity);
    _phoneNumberController.addListener(_checkFormValidity);
  }

  @override
  void dispose() {
    _businessNumberController.dispose();
    _ownerNameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      appBar: AppBar(
        title: Text(widget.forgotPassword ? "비밀번호 찾기" : "회원가입"),
      ),
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
                        formInputValue: widget.isEmployee ? "아이디" : "사업자 등록 번호",
                        isLogIn: false,
                        isBusinessRegistrationNumber:
                            widget.isEmployee ? false : true,
                        isID: widget.isEmployee ? true : false,
                        controller: _businessNumberController,
                      ),
                    ),
                    widget.isEmployee ? const SizedBox.shrink() : Gaps.v14,
                    widget.isEmployee
                        ? const SizedBox.shrink()
                        : FractionallySizedBox(
                            widthFactor: 0.7,
                            child: BasicTextformfield(
                              formInputValue: "대표자 성함",
                              isLogIn: false,
                              isNameField: true,
                              controller: _ownerNameController,
                            ),
                          ),
                    Gaps.v14,
                    FractionallySizedBox(
                      widthFactor: 0.7,
                      child: BasicTextformfield(
                        formInputValue: "전화번호",
                        isLogIn: false,
                        isPhoneField: true,
                        controller: _phoneNumberController,
                      ),
                    ),
                    if (_showOTPField)
                      FractionallySizedBox(
                        widthFactor: 0.7,
                        child: Column(
                          children: [
                            Gaps.v14,
                            OTPInputField(
                              length: 4,
                              onCompleted: _onOtpCompleted,
                            ),
                          ],
                        ),
                      ),
                    Gaps.v24,
                    MainButton(
                      labelText: _showOTPField ? "전화번호 인증" : "인증번호 전송",
                      isEnabled: _isButtonEnabled,
                      onPressed: _showOTPField
                          ? () => _onPasswordSet(widget.isEmployee)
                          : _submitForm,
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
