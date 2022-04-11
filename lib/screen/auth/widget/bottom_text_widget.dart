import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BottomTextWidget extends StatelessWidget {
  final String? msg, textDirection;
  const BottomTextWidget(
      {Key? key, required this.msg, required this.textDirection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: msg,
        style: const TextStyle(),
        children: <TextSpan>[
          TextSpan(
            text: textDirection,
            recognizer: TapGestureRecognizer()..onTap = (() {}),
            style: const TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
