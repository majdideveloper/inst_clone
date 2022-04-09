import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instg_app/screen/auth/widget/bottom_text_widget.dart';
import 'package:instg_app/screen/auth/widget/button_auth.dart';
import 'package:instg_app/screen/shared/text_field_input.dart';
import 'package:instg_app/utils/colors.dart';
import 'package:instg_app/utils/helper/helper_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passWordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              // ! svg image
              SvgPicture.asset(
                'ic_instagram.svg',
                color: primaryColor,
                height: 64,
              ),
              largeVerticalSpacer,
              // ? text field input for email
              TextFieldInput(
                  textEditingController: _emailController,
                  hintText: 'Enter your Email',
                  textInputType: TextInputType.emailAddress),

              mediumVerticalSpacer,

              // ? text field input for password
              TextFieldInput(
                textEditingController: _passWordController,
                hintText: 'Enter your PassWord',
                textInputType: TextInputType.visiblePassword,
                isobscure: true,
              ),
              mediumVerticalSpacer,
              // ? button login
              const ButtonAuth(),
              smallVerticalSpacer,
              Flexible(
                child: Container(),
                flex: 2,
              ),
              const BottomTextWidget(),

              // ! transitioning to signing up
            ],
          ),
        ),
      ),
    );
  }
}
