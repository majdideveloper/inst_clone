import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class ButtonAuth extends StatelessWidget {
  const ButtonAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('log in'),
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20.0),
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        color: blueColor,
      ),
    );
  }
}
