import 'dart:developer';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instg_app/resources/auth_methods.dart';
import 'package:instg_app/screen/auth/screen/login_screen.dart';
import 'package:instg_app/screen/auth/widget/bottom_text_widget.dart';
import 'package:instg_app/screen/auth/widget/button_auth.dart';
import 'package:instg_app/screen/auth/widget/image_user_widget.dart';
import 'package:instg_app/screen/auth/widget/logo_widget.dart';
import 'package:instg_app/screen/shared/text_field_input.dart';
import 'package:instg_app/utils/colors.dart';
import 'package:instg_app/utils/helper/helper_widget.dart';
import 'package:instg_app/utils/utils.dart';

import '../../../responsive/mobile_screen_layout.dart';
import '../../../responsive/responsive_layout_screen.dart';
import '../../../responsive/web_screen_layout.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  Uint8List? _image;

  late ValueNotifier<bool> _isLoading;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passWordController.dispose();
    _userNameController.dispose();
    _bioController.dispose();
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
                          flex: 1,
                        ),

                        const LogoWidget(),
                        largeVerticalSpacer,
                        ImageUserWidget(
                          onPressed: selecetImage,
                          image: _image,
                        ),
                        mediumVerticalSpacer,
                        // ? text field input for username
                        TextFieldInput(
                            textEditingController: _userNameController,
                            hintText: 'Enter your userName',
                            textInputType: TextInputType.text),

                        mediumVerticalSpacer,
                        // ? text field input for email
                        TextFieldInput(
                            textEditingController: _emailController,
                            hintText: 'Enter your Email',
                            textInputType: TextInputType.emailAddress),

                        mediumVerticalSpacer,
                        // ? text field input for bio
                        TextFieldInput(
                            textEditingController: _bioController,
                            hintText: 'Enter your bio',
                            textInputType: TextInputType.text),

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
                            text: 'sign Up',
                            onTap: signUpUser,
                            isLoading: isLoading,
                          ),
                        ),
                        smallVerticalSpacer,
                        Flexible(
                          child: Container(),
                          flex: 2,
                        ),

                        BottomTextWidget(
                            msg: 'you have Account ?',
                            textDirection: ' Log In',
                            onTap: () {
                              setState(() {
                                navigatorToAtherScreen(
                                  context,
                                  const LoginScreen(),
                                );
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

  void selecetImage() async {
    Uint8List? image = await pickeImage(ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  void signUpUser() async {
    _isLoading.value = true;
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passWordController.text,
      username: _userNameController.text,
      bio: _bioController.text,
      file: _image!,
    );
    if (res != 'success') {
      showSnakBar(context, res);
      _isLoading.value = false;
    } else {
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
