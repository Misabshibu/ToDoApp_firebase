import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app_firebase/functions/todo_functions.dart';

class AlertDataDialogue extends StatelessWidget {
  const AlertDataDialogue({
    super.key,
    required this.data,
  });

  final QueryDocumentSnapshot<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(data['category']),
          const Icon(
            Icons.edit,
            color: Colors.green,
          )
        ],
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: Text(data['data']),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close',
                style: TextStyle(fontWeight: FontWeight.bold))),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Confirm Delete'),
                      titleTextStyle: const TextStyle(color: Colors.red),
                      content: const Text('Do you want to delete this task?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Close'),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              ToDoFunctios.deletTask(id: data['id']);
                            },
                            child: const Text(
                              'Delete',
                              style: TextStyle(color: Colors.red),
                            ))
                      ],
                    );
                  });
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ))
      ],
      scrollable: true,
    );
  }
}
