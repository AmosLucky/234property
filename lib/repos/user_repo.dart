import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dd_property/functions/navigate.dart';
import 'package:dd_property/models/user_model.dart';
import 'package:dd_property/screens/mainscreen.dart';
import 'package:dd_property/screens/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/homescreen.dart';

class UserRepo extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  UserModel? _userModel;
  UserModel get userModel => _userModel!;

  Future<String> signin(String email, String password) async {
    String result = "";
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (emailValid) {
      if (password.trim().length >= 6) {
        try {
          UserCredential userCredential = await firebaseAuth
              .signInWithEmailAndPassword(email: email, password: password);
          String user_id = userCredential.user!.uid;
          var doc =
              await firebaseFirestore.collection("users").doc(user_id).get();
          UserModel userModel = UserModel.fromDocs(doc);
          _userModel = userModel;
          notifyListeners();
          result = "success";
        } catch (e) {
          String msg = e.toString();
          if (msg == "user-not-found") {
            result = "User not found";
          } else {
            result = e.toString();
          }
        }
      } else {
        result = "Password is less than 6 characters";
      }
    } else {
      result = "Email is invalid";
    }

    return result;
  }

  Future<String> signUp(
    String email,
    String password,
    String username,
  ) async {
    String result = "";
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (emailValid) {
      if (password.trim().length >= 6) {
        try {
          UserCredential userCredential = await firebaseAuth
              .createUserWithEmailAndPassword(email: email, password: password);
          String user_id = userCredential.user!.uid;
          var doc = await firebaseFirestore
              .collection("users")
              .doc(user_id)
              .set({"email": email, "username": username, "user_id": user_id});
          UserModel userModel =
              new UserModel(email: email, username: username, user_id: user_id);
          _userModel = userModel;
          notifyListeners();
          result = "success";
        } catch (e) {
          String msg = e.toString();
          if (msg == "user-already-exists") {
            result = "User already exists";
          } else {
            result = e.toString();
          }
        }
      } else {
        result = "Password is less than 6 characters";
      }
    } else {
      result = "Email is invalid";
    }

    return result;
  }

  void signInOldUser(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      signInWithId(user.uid, context);
    } else {
      NavigateLeftToRight(context, Welcome());
    }
  }

  void signInWithId(String user_id, BuildContext context) async {
    try {
      var doc = await firebaseFirestore.collection("users").doc(user_id).get();
      UserModel userModel = UserModel.fromDocs(doc);
      _userModel = userModel;
      notifyListeners();
      NavigateLeftToRight(context, MainScreen());
    } catch (e) {
      print(user_id);
      print(e);
      NavigateLeftToRight(context, Welcome());
    }
  }
}
