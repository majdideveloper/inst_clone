import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instg_app/providers/app_provider.dart';
import 'package:instg_app/providers/user_provider.dart';
import 'package:instg_app/responsive/mobile_screen_layout.dart';
import 'package:instg_app/responsive/responsive_layout_screen.dart';
import 'package:instg_app/responsive/web_screen_layout.dart';
import 'package:instg_app/screen/auth/screen/login_screen.dart';
import 'package:instg_app/utils/colors.dart';
import 'package:provider/provider.dart';

import 'screen/auth/screen/sign_up_screen.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        Provider(
          create: (_) => AppProvider(),
          lazy: true,
        ),
      ],
      child: MaterialApp(
          title: 'instagram clone',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: mobileBackgroundColor,
          ),
          // home: const ResponsiveLayout(
          //   mobileScreenLayout: MobileScreenLayout(),
          //   webScreenLayout: WebScreenLayout(),
          // ));
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return const ResponsiveLayout(
                    mobileScreenLayout: MobileScreenLayout(),
                    webScreenLayout: WebScreenLayout(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.hasError}'),
                  );
                }
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(
                  color: Colors.white,
                );
              }
              return const LoginScreen();
            },
          )),
    );
  }
}
