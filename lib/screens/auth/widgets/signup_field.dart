import 'package:flutter/material.dart';
import '../../../functions/auth_functions.dart';
import '../../widgets/authbutton.dart';
import '../../widgets/authtextfield.dart';

class SignupField extends StatelessWidget {
  SignupField({
    super.key,
  });

  final TextEditingController nameContorller = TextEditingController();
  final TextEditingController emailContorller = TextEditingController();
  final TextEditingController passwordContorller = TextEditingController();
  final TextEditingController confirmPasswordContorller =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.47,
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width * 0.7,
                      height: size.height * 0.43,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            AuthTextField(
                                controller: nameContorller,
                                hintText: 'Name',
                                icon: Icons.abc),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            AuthTextField(
                                controller: emailContorller,
                                hintText: 'Email',
                                icon: Icons.mail),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            AuthTextField(
                                controller: passwordContorller,
                                hintText: 'Password',
                                icon: Icons.password),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            AuthTextField(
                                controller: confirmPasswordContorller,
                                hintText: 'Confirm Password',
                                icon: Icons.password),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                //signup button
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: InkWell(
                //     onTap: () {
                //   FirebaseAuth.instance
                //       .createUserWithEmailAndPassword(
                //           email: emailContorller.text.trim(),
                //           password: passwordContorller.text.trim())
                //       .then((value) {
                //     Navigator.pushReplacement(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => const HomeScreen()));
                //   });
                // },
                //     child: Container(
                //       width: size.width * 0.4,
                //       height: size.height * 0.08,
                //       decoration: BoxDecoration(
                //           color: const Color(0xff0b2545),
                //           borderRadius: BorderRadius.circular(10)),
                //       child: const Center(
                //         child: Text(
                //           'SignUp',
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
                    onTapfunc: () {
                      AuthFunctions.createUser(
                          name: nameContorller.text.trim(),
                          email: emailContorller.text.trim());
                      AuthFunctions.signupUser(
                          email: emailContorller.text.trim(),
                          password: passwordContorller.text.trim(),
                          context: context);
                    },
                    buttonText: 'SignUp',
                    width: 0.4,
                    heigh: 0.08)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
