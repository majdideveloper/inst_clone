import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BottomTextWidget extends StatelessWidget {
  final void Function()? onTap;
  final String? msg, textDirection;
  const BottomTextWidget(
      {Key? key, required this.msg, required this.textDirection, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: RichText(
        text: TextSpan(
          text: msg,
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
              text: textDirection,
              recognizer: TapGestureRecognizer()..onTap = onTap,
              style: const TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
