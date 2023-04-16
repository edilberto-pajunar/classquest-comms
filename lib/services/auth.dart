import 'package:classquest/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // sign in with email

  Future signIn(String email, String password, context) async {
    try {
      UserCredential _cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final snackBar = SnackBar(
        duration: Duration(seconds: 2),
        content: Text("Successfully logged in"),
        backgroundColor: Colors.green,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (error) {
      const snackBar = SnackBar(
        duration: Duration(seconds: 2),
        content: Text("Wrong authentication"),
        backgroundColor: Colors.red,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print("Error $error");
    }
  }

  // sign up with email

  Future signUp(String email, String password, String username, context) async {
    try {
      UserCredential _cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // add to firestore

      UserModel _user =
          UserModel(email: email, password: password, username: username);

      await _db.collection("users").doc(_cred.user!.uid).set(_user.toJson());

      const snackBar = SnackBar(
        duration: Duration(seconds: 2),
        content: Text("Signed in"),
        backgroundColor: Colors.green,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } on FirebaseAuthException catch (error) {
      final snackBar = SnackBar(
        duration: Duration(seconds: 2),
        content: Text("Failed: $error"),
        backgroundColor: Colors.red,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print("Error: $error");
    }
  }

  // sign out
  Future signOut() async {
    await _auth.signOut();
  }

  // firestore
  // Future createUser(UserModel user) async {
  //   await _db.collection("Users").add(user.toJson());
  // }
}
