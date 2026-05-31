import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterr/data/models/product/product.dart';
import 'package:flutterr/modules/cart/controller/cartController.dart';
import 'package:flutterr/widgets/nav.dart';
import 'package:get/get.dart';

class Cartitems extends StatefulWidget {
  const Cartitems({super.key});

  @override
  State<Cartitems> createState() => _CartitemsState();
}

class _CartitemsState extends State<Cartitems> {
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Cart")),
      body: StreamBuilder<QuerySnapshot>(
        stream: cartController.getCartItems(),
        builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      }
      
      if (snapshot.hasError) {
        return Center(child: Text("Error loading cart items"));
      }
      
      final cartItems = snapshot.data?.docs ?? [];
      
      if (cartItems.isEmpty) {
        return Center(child: Text("Your cart is empty"));
      }
      
      return ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
      
          final data = item.data() as Map<String, dynamic>? ?? {};
      
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  width: 120,
                  height: 120,
                  child: data['image'] != null
            ? Image.network(
                data['image'],
                fit: BoxFit.cover,
              )
            : Icon(Icons.image, color: Colors.grey),
                ),
            
                SizedBox(width: 10),
            
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
            Text(data['title'] ?? "No Title", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text("Price: ${data['price']}", style: TextStyle(color:Colors.teal),),
            SizedBox(height: 15),
            Row(children: [
               GestureDetector(
                onTap: () {
                  Get.snackbar("Cart", "Proceeding to checkout");
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey[300]!),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text("Buy Now"),
                ),
              ), 
              Spacer(),
              GestureDetector(
                onTap: () {
                  cartController.removeFromCart(Product.fromMap(data));
                  Get.snackbar("Cart", "Removed from cart");
                   
                },
                child: 
              Icon(Icons.delete, color: Colors.red),
              ), 
              
             
            ],)
                    ],
                    
                  ),
                ),
              ],
            ),
          );
        },
      );
        },
      ),
      bottomNavigationBar: Nav(),
    );
  }
} 
