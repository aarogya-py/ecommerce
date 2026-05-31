import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterr/data/models/product/product.dart';
import 'package:flutterr/modules/cart/controller/cartController.dart';
import 'package:flutterr/routes/app_routes.dart';
import 'package:get/get.dart';

class ProductDetail extends StatefulWidget {
  
  const ProductDetail({super.key});


  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    final product = Get.arguments as Product;
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: Text(product.title ?? "Product"),
        actions: [
          Icon(Icons.favorite_border),
          SizedBox(width: 15),
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.cart);
              Get.snackbar("Cart", "Viewing cart");
            },
            child: Icon(Icons.shopping_cart)),
          SizedBox(width: 10),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🔥 PRODUCT IMAGE
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.white,
              child: CachedNetworkImage(
                imageUrl: product.image ?? "",
                fit: BoxFit.contain,
              ),
            ),

            SizedBox(height: 10),

            // 🔥 DETAILS SECTION
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // TITLE
                  Text(
                    product.title ?? "",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  // PRICE
                  Text(
                    "${product.price ?? 0} USD",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  // RATING
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange),
                      SizedBox(width: 5),
                      Text("${product.rating?.rate ?? 0}"),
                      SizedBox(width: 10),
                      Text("(${product.rating?.count ?? 0} reviews)"),
                    ],
                  ),

                  SizedBox(height: 15),

                  // CATEGORY
                  Text(
                    "Category: ${product.category ?? "Unknown"}",
                    style: TextStyle(color: Colors.grey),
                  ),

                  SizedBox(height: 20),

                  // DESCRIPTION
                  Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    product.description ?? "No description available",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),

            SizedBox(height: 80), // space for bottom bar
          ],
        ),
      ),

      // 🔥 BOTTOM BAR (Daraz style)
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey.shade300, blurRadius: 5),
          ],
        ),
        child: Row(
          children: [

            // ADD TO CART
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                onPressed: () {
                  cartController.addToCart(product);
                  Get.snackbar("Cart", "Added to cart");
                },
                child: Text("Add to Cart"),
              ),
            ),

            SizedBox(width: 10),

            // BUY NOW
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  Get.snackbar("Buy", "Proceed to checkout");
                },
                child: Text("Buy Now"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}