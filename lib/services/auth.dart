import 'package:classquest/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // sign in with email

  Future<String> signIn(String email, String password, context) async {
    String res = "Some error occurred";
    try {
      UserCredential _cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      res = "success";
    } catch (e) {
      res = e.toString();
      print("Error: $res");
    }

    return res;
  }

  // sign up with email

  Future<String> signUp(String email, String password, context) async {
    String res = "Some error occurred";
    try {
      UserCredential _cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      _auth.signInWithEmailAndPassword(email: email, password: password);

      res = "success";
    } on FirebaseAuthException catch (e) {
      res = e.toString();
      print("Error: $e");
    }

    return res;
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
