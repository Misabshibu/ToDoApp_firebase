import 'package:flutter/material.dart';

class SignupField extends StatelessWidget {
  const SignupField({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
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
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Name',
                                prefixIcon: Icon(
                                  Icons.person_2_outlined,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Email Address',
                                prefixIcon: Icon(
                                  Icons.mail_outline_outlined,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Password',
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Confirm Password',
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: size.width * 0.4,
                    height: size.height * 0.08,
                    decoration: BoxDecoration(
                        color: const Color(0xff0b2545),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        'SignUp',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
