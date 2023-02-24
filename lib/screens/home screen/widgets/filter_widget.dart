import 'package:flutter/material.dart';
import 'package:to_do_app_firebase/screens/home%20screen/home_screen.dart';

class ReplaceWidget extends StatelessWidget {
  const ReplaceWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            isTextfield.value = false;
          },
          child: Container(
            height: size.height * 0.07,
            width: size.width * 0.6,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: const Center(
              child: Text(
                'write a new task',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ),
        SizedBox(
          width: size.width * 0.03,
        ),
        Container(
          height: size.height * 0.07,
          width: size.width * 0.15,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Icon(Icons.tune),
          ),
        )
      ],
    );
  }
}
