import 'package:flutter/material.dart';
import '../../../functions/auth_functions.dart';
import '../../widgets/authbutton.dart';
import '../../widgets/authtextfield.dart';

class LoginField extends StatelessWidget {
  LoginField({
    super.key,
  });

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.3,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: size.width * 0.7,
                height: size.height * 0.23,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      AuthTextField(
                          controller: emailController,
                          hintText: 'Email',
                          icon: Icons.mail),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      AuthTextField(
                          controller: passwordController,
                          hintText: 'Password',
                          icon: Icons.password),
                      const Spacer()
                    ],
                  ),
                ),
              ),

              //Login button
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: InkWell(
              //     onTap: () {
              //       FirebaseAuth.instance
              //           .signInWithEmailAndPassword(
              //               email: emailController.text.trim(),
              //               password: passwordController.text.trim())
              //           .then((value) {
              //         Navigator.pushReplacement(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => const HomeScreen()));
              //       });
              //     },
              //     child: Container(
              //       width: size.width * 0.4,
              //       height: size.height * 0.08,
              //       decoration: BoxDecoration(
              //           color: const Color(0xff0b2545),
              //           borderRadius: BorderRadius.circular(10)),
              //       child: const Center(
              //         child: Text(
              //           'Login',
              //           style: TextStyle(
              //               color: Colors.white,
              //               fontSize: 20,
              //               fontWeight: FontWeight.bold),
              //         ),
              //       ),
              //     ),
              //   ),
              // )
              AuthButton(
                buttonText: 'Login',
                width: 0.4,
                heigh: 0.08,
                onTapfunc: () {
                  AuthFunctions.signingUser(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                      context: context);
                },
              )
            ],
          ),
        ),
        TextButton(
            onPressed: () {},
            child: const Text(
              'Forget Password?',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.black54,
                  decorationThickness: 1.5,
                  color: Colors.black,
                  fontSize: 16),
            )),
        Row(
          children: [
            Expanded(
              child: Divider(
                thickness: 2,
                color: Colors.black,
                indent: 100,
                height: size.height * 0.1,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Or',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Divider(
                thickness: 2,
                color: Colors.black,
                endIndent: 100,
                height: size.height * 0.1,
              ),
            )
          ],
        ),
        Row(
          children: [
            const Spacer(),
            const CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xff3566A5),
              backgroundImage: AssetImage(
                'assets/images/facebook_logo.png',
              ),
            ),
            SizedBox(
              width: size.width * 0.05,
            ),
            const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/images/google_logo.png'),
            ),
            const Spacer()
          ],
        )
      ],
    );
  }
}
