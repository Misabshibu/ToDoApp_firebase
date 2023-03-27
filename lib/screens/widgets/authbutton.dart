import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(
      {super.key,
      required this.onTapfunc,
      required this.buttonText,
      required this.width,
      required this.heigh});

  final Function()? onTapfunc;
  final String buttonText;
  final double width;
  final double heigh;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.bottomCenter,
      child: InkWell(
        onTap: onTapfunc,
        child: Container(
          width: size.width * width,
          height: size.height * heigh,
          decoration: BoxDecoration(
              color: const Color(0xff0b2545),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              buttonText,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
