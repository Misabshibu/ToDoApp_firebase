import 'package:flutter/material.dart';
import '../../functions/auth_functions.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Navigating after checking that login or not
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AuthFunctions.samapfunct(context: context);
      // Add Your Code here.
    });
    //----------------------------------------------//

    return const Scaffold(
      body: Center(
          child: Text(
        'Loading...',
      )),
    );
  }
}
