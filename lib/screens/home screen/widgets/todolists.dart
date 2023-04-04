import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app_firebase/functions/todo_functions.dart';
import 'package:to_do_app_firebase/screens/home%20screen/widgets/alertdatadialogue.dart';

class TodoLists extends StatelessWidget {
  const TodoLists({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.email)
              .collection('tasks')
              .orderBy('timeStamp')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final subcollectionDocs = snapshot.data!.docs;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final data = subcollectionDocs[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDataDialogue(data: data);
                            });
                      },
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
                              InkWell(
                                onTap: () {
                                  ToDoFunctios.checkBox(
                                      isComplete: data['isComplete'],
                                      id: data['id']);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xffc4fff9),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: data['isComplete']
                                      ? const Icon(Icons.check, size: 20)
                                      : const Icon(
                                          Icons.square,
                                          size: 20,
                                          color: Color(0xffc4fff9),
                                        ),
                                ),
                              ),
                              SizedBox(
                                  width: size.width * 0.55,
                                  child: Text(
                                    data['data'],
                                    overflow: TextOverflow.ellipsis,
                                  )),
                              Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: ToDoFunctios.categoryColor(
                                            category: data['category']),
                                        width: 2)),
                              )
                            ]),
                      ),
                    ),
                  );
                },
                itemCount: subcollectionDocs.length,
              );
            }
            if (snapshot.hasError) {}
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
