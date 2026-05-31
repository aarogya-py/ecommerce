import 'package:flutter/material.dart';
import 'package:flutterr/modules/auth/controller/auth_Controller.dart';
import 'package:flutterr/routes/app_routes.dart';
import 'package:flutterr/widgets/custom_button.dart';
import 'package:flutterr/widgets/custom_textFeild.dart';
import 'package:flutterr/widgets/divider.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Icon(Icons.arrow_back_ios_new_rounded)),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Row(
                    children: [
                      Text(
                        "Create Your Account",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.account_circle_outlined,
                        size: 32,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Welcome back! Please login to your account",
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  CustomTextfeild(
                    label: "Name",
                    controller: controller.name,
                  ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(value: true, onChanged: (v) {}),
                          Text("Must be at least 8 characters"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    text: "Sign Up",
                    onTap: () {
                      controller.signUp(controller.email.text, controller.password.text);
                      controller.name.clear();
                      controller.email.clear();
                      controller.password.clear();
                      print(controller.name.text);
                    },
                  ),
                  SizedBox(height: 20),
                  CustomDivider(),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.login);
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                margin: EdgeInsets.all(40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    Text("Log IN", style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
            ),
          ),
          Row(),
        ],
      ),
    );
  }
}
