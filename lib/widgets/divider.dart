import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          Expanded(child: Divider(thickness: 1, color: Colors.grey)),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text("Or log in with", style: TextStyle(color: Colors.grey)),
          ),

          Expanded(child: Divider(thickness: 1, color: Colors.grey)),
        ],
      ),
    );
  }
}
