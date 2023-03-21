import 'package:flutter/material.dart';
import 'package:to_do_app_firebase/screens/auth/widgets/login_field.dart';
import 'package:to_do_app_firebase/screens/auth/widgets/toggle_auth.dart';

import 'widgets/signup_field.dart';

ValueNotifier<bool> isLogin = ValueNotifier(true);

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  static List<bool> isSelectedIndex = [true, false];

  static bool signupColor = false;

  static bool loginColor = true;
  static PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List pages = [LoginField(size: size), SignupField(size: size)];
    return Scaffold(
      backgroundColor: const Color(0xffdee2ff),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const Spacer(),
        const ToggleLoginSignup(),
        SizedBox(height: size.height * 0.03),
        SizedBox(
          height: size.height * 0.7,
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: pages.length,
            controller: pageController,
            itemBuilder: (context, index) {
              return pages[index];
            },
          ),
        ),
      ]),
    );
  }
}
