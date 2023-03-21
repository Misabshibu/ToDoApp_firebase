import 'package:flutter/material.dart';
import 'package:to_do_app_firebase/screens/auth/auth_screen.dart';

class ToggleLoginSignup extends StatefulWidget {
  const ToggleLoginSignup({super.key});

  @override
  State<ToggleLoginSignup> createState() => _ToggleLoginSignupState();
}

class _ToggleLoginSignupState extends State<ToggleLoginSignup> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              color: const Color(0xff0b2545),
              borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ToggleButtons(
              textStyle:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              color: Colors.white,
              renderBorder: false,
              selectedColor: Colors.black,
              onPressed: (newIndex) {
                setState(() {
                  for (int index = 0;
                      index < AuthScreen.isSelectedIndex.length;
                      index++) {
                    if (index == newIndex) {
                      AuthScreen.isSelectedIndex[index] = true;
                      AuthScreen.loginColor = false;
                      isLogin.value = false;
                      AuthScreen.signupColor = true;
                      AuthScreen.pageController.jumpToPage(1);
                    } else {
                      AuthScreen.isSelectedIndex[index] = false;
                      AuthScreen.loginColor = true;
                      AuthScreen.signupColor = false;
                      isLogin.value = true;
                      AuthScreen.pageController.jumpToPage(0);
                    }
                  }
                });
              },
              isSelected: AuthScreen.isSelectedIndex,
              children: [
                Container(
                  width: size.width * 0.35,
                  decoration: BoxDecoration(
                      color: AuthScreen.signupColor
                          ? const Color(0xff0b2545)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text('Existing'),
                  ),
                ),
                Container(
                  width: size.width * 0.35,
                  decoration: BoxDecoration(
                      color: AuthScreen.loginColor
                          ? const Color(0xff0b2545)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text('New'),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
