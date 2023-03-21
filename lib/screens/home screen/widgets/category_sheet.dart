import 'package:flutter/material.dart';
import 'package:to_do_app_firebase/screens/home%20screen/home_screen.dart';

class CategorySheet extends StatelessWidget {
  CategorySheet({
    super.key,
    required this.size,
  });

  final Size size;
  final List<String> category = ["Personal", "Work", "Other ", "No list"];
  final List<Color> categoryColor = [
    (Colors.green),
    (Colors.blue),
    (Colors.red),
    (Colors.grey)
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: isGatergorySheet,
        builder: (context, index, _) {
          return Visibility(
            visible: isGatergorySheet.value,
            child: Container(
              width: size.width * 0.8,
              height: size.height * 0.25,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: InkWell(
                        onTap: () {
                          isGatergorySheet.value = false;
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 15,
                              width: 15,
                              // color: Colors.red,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: categoryColor[index], width: 2)),
                            ),
                            Text(
                              category[index],
                              style: TextStyle(color: categoryColor[index]),
                            ),
                            SizedBox(
                              width: size.width * 0.25,
                            ),
                            const Icon(Icons.numbers)
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          );
        });
  }
}
