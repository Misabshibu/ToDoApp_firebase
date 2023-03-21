import 'package:flutter/material.dart';
import 'package:to_do_app_firebase/screens/auth/auth_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    navigateAuthPage(context);
    return const Scaffold(
      body: Center(
          child: Text(
        'Loading...',
      )),
    );
  }
}

//---------------------------------------------------------------------//

//navigate function to auth screen
navigateAuthPage(context) {
  Future.delayed(
      const Duration(
        seconds: 2,
      ), () {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => AuthScreen()));
  });
}
