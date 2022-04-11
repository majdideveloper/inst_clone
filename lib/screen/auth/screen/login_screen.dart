import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instg_app/screen/auth/widget/bottom_text_widget.dart';
import 'package:instg_app/screen/auth/widget/button_auth.dart';
import 'package:instg_app/screen/shared/text_field_input.dart';
import 'package:instg_app/utils/colors.dart';
import 'package:instg_app/utils/helper/helper_widget.dart';

import '../widget/logo_widget.dart';

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
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) =>
              SingleChildScrollView(
            reverse: true,
            physics: const BouncingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: Container(),
                        flex: 2,
                      ),

                      // ! svg image
                      const LogoWidget(),
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
                      ButtonAuth(
                        text: 'log in',
                        onTap: () {},
                      ),
                      smallVerticalSpacer,
                      Flexible(
                        fit: FlexFit.loose,
                        child: Container(),
                        flex: 2,
                      ),

                      const BottomTextWidget(
                        msg: 'Don\'t have an account!',
                        textDirection: ' Sign Up',
                      ),

                      // ! transitioning to signing up
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
