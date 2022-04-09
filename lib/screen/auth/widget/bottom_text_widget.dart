import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BottomTextWidget extends StatelessWidget {
  const BottomTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Don\'t have an account! ',
        style: const TextStyle(),
        children: <TextSpan>[
          TextSpan(
            text: ' Sign up',
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
