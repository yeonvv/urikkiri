import 'package:flutter/material.dart';
import 'package:urikkiri_beta/constants/sizes.dart';

class OTPInputField extends StatelessWidget {
  final int length;
  final Function(String) onCompleted;

  const OTPInputField({
    super.key,
    required this.length,
    required this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return _OTPInputForm(length: length, onCompleted: onCompleted);
  }
}

class _OTPInputForm extends StatefulWidget {
  final int length;
  final Function(String) onCompleted;

  const _OTPInputForm({
    required this.length,
    required this.onCompleted,
  });

  @override
  State<_OTPInputForm> createState() => __OTPInputFormState();
}

class __OTPInputFormState extends State<_OTPInputForm> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  late List<bool> _hasValue;

  @override
  void initState() {
    super.initState();
    _controllers =
        List.generate(widget.length, (index) => TextEditingController());
    _focusNodes = List.generate(widget.length, (index) {
      final focusNode = FocusNode();
      focusNode.addListener(() {
        setState(() {});
      });
      return focusNode;
    });
    _hasValue = List.generate(widget.length, (index) => false);
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    _hasValue[index] = value.isNotEmpty;
    if (value.isNotEmpty && index < widget.length - 1) {
      _focusNodes[index + 1].requestFocus();
    }

    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    if (_controllers.every((controller) => controller.text.isNotEmpty)) {
      widget.onCompleted(
          _controllers.map((controller) => controller.text).join());
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.length, (index) {
        return SizedBox(
          width: Sizes.size56,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size5),
            child: TextField(
              showCursor: false,
              style: Theme.of(context).textTheme.titleLarge,
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              maxLength: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              onChanged: (value) => _onChanged(value, index),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 30),
                counterText: "",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Sizes.size12),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: _hasValue[index] ? Sizes.size3 : Sizes.size1,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
