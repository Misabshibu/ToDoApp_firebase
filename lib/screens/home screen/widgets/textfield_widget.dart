import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: size.height * 0.07,
        width: size.width * 0.8,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: size.width * 0.5,
              child: const TextField(),
            ),
            Container(
              width: size.width * 0.25,
              height: size.height * 0.05,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
            )
          ],
        ),
      ),
    );
  }
}
