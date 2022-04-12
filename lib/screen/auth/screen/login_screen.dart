import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instg_app/resources/auth_methods.dart';
import 'package:instg_app/screen/auth/screen/sign_up_screen.dart';
import 'package:instg_app/screen/auth/widget/bottom_text_widget.dart';
import 'package:instg_app/screen/auth/widget/button_auth.dart';
import 'package:instg_app/screen/shared/text_field_input.dart';
import 'package:instg_app/utils/colors.dart';
import 'package:instg_app/utils/helper/helper_widget.dart';

import '../../../responsive/mobile_screen_layout.dart';
import '../../../responsive/responsive_layout_screen.dart';
import '../../../responsive/web_screen_layout.dart';
import '../../../utils/utils.dart';
import '../../main/main_screen.dart';
import '../widget/logo_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();

  late ValueNotifier<bool> _isLoading;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passWordController.dispose();
    _isLoading.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    _isLoading = ValueNotifier<bool>(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) =>
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
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
                        ValueListenableBuilder(
                          valueListenable: _isLoading,
                          builder: (context, bool isLoading, child) =>
                              ButtonAuth(
                            text: 'log in',
                            onTap: loginUser,
                            isLoading: isLoading,
                          ),
                        ),
                        smallVerticalSpacer,
                        Flexible(
                          child: Container(),
                          flex: 2,
                        ),

                        BottomTextWidget(
                            msg: 'Don\'t have an account!',
                            textDirection: ' Sign Up',
                            onTap: () {
                              setState(() {
                                navigatorToAtherScreen(
                                    context, const SignUpScreen());
                              });
                            }),

                        // ! transitioning to signing up
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void loginUser() async {
    _isLoading.value = true;
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passWordController.text);
    if (res != 'login success') {
      showSnakBar(context, res);
      _isLoading.value = false;
    } else {
      showSnakBar(context, res);
      _isLoading.value = false;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            mobileScreenLayout: MobileScreenLayout(),
            webScreenLayout: WebScreenLayout(),
          ),
        ),
      );
    }
  }
}
