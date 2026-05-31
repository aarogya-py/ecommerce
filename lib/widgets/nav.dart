import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';

class Nav extends StatelessWidget {
  const Nav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: GestureDetector(
          onTap: () {
          Get.toNamed(AppRoutes.products);
          },
          child: Icon(Icons.home)), label: "Home"),
       
        BottomNavigationBarItem(icon: GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.cart);
          },
           child: Icon(Icons.shopping_cart)), label: "Cart"),
        BottomNavigationBarItem(icon: GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.login);
          },
           child: Icon(Icons.account_circle),), label: "Profile"),
      ],    
    ) ; 
  }
} 