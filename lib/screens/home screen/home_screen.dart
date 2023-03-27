import 'package:flutter/material.dart';
import '../../functions/auth_functions.dart';
import '../home%20screen/widgets/filter_widget.dart';
import '../home%20screen/widgets/category_sheet.dart';
import '../home%20screen/widgets/textfield_widget.dart';
import '../home%20screen/widgets/todolists.dart';

ValueNotifier<bool> isTextfield = ValueNotifier<bool>(false);
ValueNotifier<bool> isGatergorySheet = ValueNotifier<bool>(false);

final List<String> appbarMessages = [
  'Get things done',
  'Maximize your efficiency',
  'Stay on top.',
  'Streamline your tasks',
  'Simplify your life',
  'Optimize your workflow',
  'Boost your productivity',
  'Take control today',
  'Make it happen'
];

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
          IconButton(
              onPressed: () {
                AuthFunctions.signoutUser(context: context);
              },
              icon: const Icon(Icons.logout)),
          // SizedBox(width: size.width * 0.03)
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
