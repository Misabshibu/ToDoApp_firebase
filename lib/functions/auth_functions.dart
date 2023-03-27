import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app_firebase/model/user_model.dart';
import '../screens/auth/auth_screen.dart';
import '../screens/splash%20screen/splash_screen.dart';

import '../screens/home screen/home_screen.dart';

class AuthFunctions {
  //sign up using email and password firebase
  static signupUser(
      {required String email,
      required String password,
      required BuildContext context}) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }

  //sign in using email and password firebase
  static signingUser(
      {required String email,
      required String password,
      required BuildContext context}) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }

  //
  static samapfunct({required BuildContext context}) async {
    await Future.delayed(const Duration(seconds: 2));
    FirebaseAuth.instance.currentUser == null
        // ignore: use_build_context_synchronously
        ? Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => AuthScreen()))
        // ignore: use_build_context_synchronously
        : Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

// signout user
  static signoutUser({required BuildContext context}) {
    FirebaseAuth.instance.signOut();
    Navigator.of(context).pushAndRemoveUntil(
        (MaterialPageRoute(builder: (context) => const SplashScreen())),
        (route) => false);
  }

  //create user in firebase
  static Future createUser(
      {required String name, required String email}) async {
    //reference to document
    final docUser = FirebaseFirestore.instance.collection('users').doc(email);

    final user = AuthUser(name: name, id: email);
    final json = user.toJson();

    await docUser.set(json);
  }
}
