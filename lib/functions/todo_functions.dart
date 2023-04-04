import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ToDoFunctios {
  //add a list to todolist
  static addDataToList({required String category, required String data}) async {
    String docId = const Uuid().v4();
    final timeStamp = FieldValue.serverTimestamp();
    if (data.isEmpty) {
      return;
    } else {
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection('tasks')
          .doc(docId)
          .set({
        'id': docId,
        'category': category,
        'data': data,
        'isComplete': false,
        'timeStamp': timeStamp
      });
    }
  }

  //category color
  static Color categoryColor({required String category}) {
    if (category == 'Personal') {
      return (Colors.green);
    }
    if (category == 'Work') {
      return (Colors.blue);
    } else {
      return (Colors.red);
    }
  }

  //delete task
  static void deletTask({required String id}) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('tasks')
        .doc(id)
        .delete();
  }

  //checkbox task
  static void checkBox({required bool isComplete, required String id}) {
    final docref = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('tasks')
        .doc(id);
    if (isComplete == false) {
      docref.update({'isComplete': true});
    } else {
      docref.update({'isComplete': false});
    }
  }
}
