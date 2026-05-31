import 'package:flutter/material.dart';
import 'package:flutterr/modules/auth/controller/auth_Controller.dart';
import 'package:flutterr/routes/app_routes.dart';
import 'package:flutterr/widgets/custom_button.dart';
import 'package:flutterr/widgets/custom_textFeild.dart';
import 'package:flutterr/widgets/divider.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Icon(Icons.arrow_back_ios)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        "Log In",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.account_circle_outlined, size: 32),
                    ],
                  ),

                  SizedBox(height: 10),

                  Text("Welcome back! Please login to your account"),

                  SizedBox(height: 20),

                  CustomTextfeild(
                    label: "Email",
                    controller: controller.email,
                  ),

                  SizedBox(height: 20),

                  CustomTextfeild(
                    label: "Password",
                    controller: controller.password,
                  ),

                  SizedBox(height: 20),

                  CustomButton(text: "Log In", onTap: () { 
                    controller.signIn(controller.email.text, controller.password.text); 
                    controller.email.clear(); 
                    controller.password.clear(); }),

                  SizedBox(height: 20),

                  CustomDivider(),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.signup);
                    },
                    child: Container(
                      child: Text(
                        " Sign up",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
