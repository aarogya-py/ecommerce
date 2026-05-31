import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterr/data/models/product/product.dart';
import 'package:flutterr/modules/products/controller/product_controll.dart';
import 'package:flutterr/routes/app_routes.dart';
import 'package:flutterr/widgets/nav.dart';
import 'package:get/get.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
 final controller = Get.find<ProductController>();
  bool get isLoading => controller.isLoading.value;

   @override
   void initState() {
    super.initState();
    controller.getProducts();
  }

  @override
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Screen")),
body: Obx(() {
  if (controller.isLoading.value) {
    return Center(child: CircularProgressIndicator());
  }

  final products = controller.products.value ?? [];

  return GridView.builder(
    itemCount: products.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.7,
    ),
    itemBuilder: (context, index) {
      final item = products[index];

      return GestureDetector(
        onTap: () {Get.toNamed(AppRoutes.productDetail, arguments: item);},
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
              Expanded(
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: item.image ?? "",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
        
              SizedBox(height: 10),
        
              Text(
                item.title ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
        
              SizedBox(height: 5),
        
              Text(item.category ?? ""),
        
              SizedBox(height: 5),
        
              Row(
                children: [
                  Icon(Icons.star, size: 16, color: Colors.orange),
                  SizedBox(width: 5),
                  Text("${item.rating?.rate ?? 0}"),
                ],
              ),
        
              SizedBox(height: 5),
        
              Text("Rs ${item.price}"),
            
            ],
          ),
        ),
      );
    },
  );
}),
bottomNavigationBar: Nav(),
    );
    }
}
