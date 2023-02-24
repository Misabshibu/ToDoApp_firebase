import 'package:flutter/material.dart';

class TodoLists extends StatelessWidget {
  const TodoLists({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              width: double.infinity,
              height: size.height * 0.06,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Checkbox(
                    //   value: true,
                    //   onChanged: (value) {}
                    //   checkColor: Colors.white,
                    // ),
                    Container(
                      decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          color: const Color(0xffc4fff9),
                          borderRadius: BorderRadius.circular(5)),
                      child: const Icon(Icons.check, size: 20),
                    ),

                    SizedBox(
                        width: size.width * 0.55,
                        child: const Text(
                          'data',
                          overflow: TextOverflow.ellipsis,
                        )),
                    Container(
                      height: 15,
                      width: 15,
                      // color: Colors.red,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.red, width: 2)),
                    )
                  ]),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
