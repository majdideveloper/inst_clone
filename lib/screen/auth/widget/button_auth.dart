import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class ButtonAuth extends StatelessWidget {
  final Function()? onTap;
  final bool? isLoading;
  final String? text;
  const ButtonAuth(
      {Key? key,
      required this.text,
      required this.onTap,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          child: Center(
            child: isLoading!
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(text!),
          ),
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
        ));
  }
}
