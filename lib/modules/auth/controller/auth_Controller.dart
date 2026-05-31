import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterr/routes/app_routes.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  
  Rxn<User?> user = Rxn<User?>(null);
  @override
  void onInit() {
    user.bindStream(auth.authStateChanges());
    super.onInit();
  }
  // Signup
  Future<void> signUp(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
       
      );
      Get.snackbar("Success", "User Signed Up: ${auth.currentUser?.email}");
      Get.toNamed(AppRoutes.login);     
    } catch (e) {
      print("Signup Error: $e");
    }
  }
  // Signin
  Future<void> signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar("Success", "User Signed In: ${auth.currentUser?.email}");
      Get.toNamed(AppRoutes.products);
      email="";
      password="";
    } catch (e) {
      print("Signin Error: $e");
    }
  }
  // Signout
  Future<void> signOut() async {
    try {      await auth.signOut();
    } catch (e) {
      print("Signout Error: $e");
    }
  }
}
