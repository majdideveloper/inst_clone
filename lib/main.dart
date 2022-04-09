import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instg_app/responsive/mobile_screen_layout.dart';
import 'package:instg_app/responsive/responsive_layout_screen.dart';
import 'package:instg_app/responsive/web_screen_layout.dart';
import 'package:instg_app/screen/auth/login_screen.dart';
import 'package:instg_app/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyCDtWGxOGqkHGVGT23-8EKyOdmHC0VS4LU",
      appId: "1:258980818115:web:aafe30053b0ffdb3d3c676",
      messagingSenderId: "258980818115",
      projectId: "instagram-clone-8ad08",
      storageBucket: "instagram-clone-8ad08.appspot.com",
    ));
  }

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'instagram clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: const ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(),
      //   webScreenLayout: WebScreenLayout(),
      // ));
      home: const LoginScreen(),
    );
  }
}