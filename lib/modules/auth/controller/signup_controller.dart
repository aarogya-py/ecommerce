import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SignupController extends GetxController {
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  Future<void> register() async {
    if (namecontroller.text.isEmpty ||
        emailcontroller.text.isEmpty ||
        passwordcontroller.text.isEmpty) {
      Get.snackbar("Error", "Please fill all the fields");
    } else {
      final signupData = {
        "name": namecontroller.text,
        "email": emailcontroller.text,
        "password": passwordcontroller.text,
      };
      print(signupData);
    }
  }
}
