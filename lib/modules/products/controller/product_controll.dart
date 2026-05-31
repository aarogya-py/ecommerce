import 'package:flutterr/data/models/product/product.dart';
import 'package:flutterr/data/service/product_service.dart';
import 'package:get/get.dart';

class ProductController {
 final ProductService _productService = ProductService();
   var products=Rxn<List<Product>>([]);
  var isLoading = false.obs;
  Future<void> getProducts() async {
    isLoading.value = true;
    products.value = await _productService.getProducts();
    isLoading.value = false;
    }
  }

  