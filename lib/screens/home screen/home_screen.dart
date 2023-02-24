import 'package:flutter/material.dart';
import 'package:to_do_app_firebase/screens/home%20screen/widgets/filter_widget.dart';
import 'package:to_do_app_firebase/screens/home%20screen/widgets/textfield_widget.dart';

ValueNotifier<bool> isTextfield = ValueNotifier<bool>(true);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffc4fff9),
      appBar: AppBar(
        title: const Text(
          'Your Tasks',
        ),
        backgroundColor: const Color(0xff14213d),
        actions: [
          const Icon(Icons.more_vert),
          SizedBox(width: size.width * 0.03)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      width: double.infinity,
                      height: size.height * 0.06,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
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
                                  border:
                                      Border.all(color: Colors.red, width: 2)),
                            )
                          ]),
                    ),
                  );
                },
                itemCount: 10,
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            ValueListenableBuilder(
                valueListenable: isTextfield,
                builder: (context, value, _) {
                  return isTextfield.value
                      ? ReplaceWidget(size: size)
                      : TextfieldWidget(size: size);
                }),
            SizedBox(
              height: size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
