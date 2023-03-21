import 'package:flutter/material.dart';
import 'package:to_do_app_firebase/screens/home%20screen/widgets/filter_widget.dart';
import 'package:to_do_app_firebase/screens/home%20screen/widgets/category_sheet.dart';
import 'package:to_do_app_firebase/screens/home%20screen/widgets/textfield_widget.dart';
import 'package:to_do_app_firebase/screens/home%20screen/widgets/todolists.dart';

ValueNotifier<bool> isTextfield = ValueNotifier<bool>(false);
ValueNotifier<bool> isGatergorySheet = ValueNotifier<bool>(false);

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
            TodoLists(size: size),
            SizedBox(
              height: size.height * 0.01,
            ),
            ValueListenableBuilder(
                valueListenable: isTextfield,
                builder: (context, value, _) {
                  return isTextfield.value
                      ? TextfieldWidget(size: size)
                      : ReplaceWidget(size: size);
                }),
            SizedBox(
              height: size.height * 0.01,
            ),
            CategorySheet(size: size),
          ],
        ),
      ),
    );
  }
}
