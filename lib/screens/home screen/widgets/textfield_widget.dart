import 'package:flutter/material.dart';
import 'package:to_do_app_firebase/functions/todo_functions.dart';
import '../../home%20screen/home_screen.dart';

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget({
    super.key,
    required this.size,
  });

  final Size size;
  static ValueNotifier<String> selectedCategory =
      ValueNotifier<String>('Personal');

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
              width: size.width * 0.45,
              child: TextField(
                onTap: () {
                  isGatergorySheet.value = false;
                },
                autofocus: true,
                onSubmitted: (value) {
                  isTextfield.value = false;
                  isGatergorySheet.value = false;
                  ToDoFunctios.addDataToList(
                      category: selectedCategory.value, data: value);
                },
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: 'Write a new task'),
              ),
            ),
            InkWell(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
                isGatergorySheet.value = true;
              },
              child: Container(
                width: size.width * 0.3,
                height: size.height * 0.05,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: ValueListenableBuilder(
                    valueListenable: selectedCategory,
                    builder: (context, value, _) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 15,
                            width: 15,
                            // color: Colors.red,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: ToDoFunctios.categoryColor(
                                        category: selectedCategory.value),
                                    width: 2)),
                          ),
                          Text(selectedCategory.value),
                          const Icon(
                            Icons.arrow_drop_down_rounded,
                            size: 20,
                          )
                        ],
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
