import 'package:flutter/material.dart';
import 'package:urikkiri_beta/constants/gaps.dart';
import 'package:urikkiri_beta/features/Authentication/views/widgets/app_title_text.dart';
import 'package:urikkiri_beta/features/Authentication/views/widgets/basic_scaffold.dart';
import 'package:urikkiri_beta/features/Authentication/views/widgets/basic_textformfield.dart';
import 'package:urikkiri_beta/features/Authentication/views/widgets/form_buttom.dart';
import 'package:urikkiri_beta/features/Authentication/views/widgets/otp_inputfield.dart';

class OwnerSignupScreen extends StatefulWidget {
  const OwnerSignupScreen({super.key});

  @override
  State<OwnerSignupScreen> createState() => _OwnerSignupScreenState();
}

class _OwnerSignupScreenState extends State<OwnerSignupScreen> {
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

  void _checkFormValidity() {
    _isButtonEnabled = _businessNumberController.text.isNotEmpty &&
        _ownerNameController.text.isNotEmpty &&
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
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gaps.v60,
            const AppTitleText(isEmployee: false),
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
                        formInputValue: "대표자 성함",
                        isNameField: true,
                        controller: _ownerNameController,
                      ),
                    ),
                    Gaps.v14,
                    FractionallySizedBox(
                      widthFactor: 0.7,
                      child: BasicTextformfield(
                        formInputValue: "전화번호",
                        isPhoneField: true,
                        controller: _phoneNumberController,
                      ),
                    ),
                    if (_showOTPField)
                      FractionallySizedBox(
                        widthFactor: 0.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    FormButton(
                      labelText: "전화번호 인증",
                      isEnabled: _isButtonEnabled,
                      onPressed: _submitForm,
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
