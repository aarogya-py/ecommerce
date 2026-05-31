import 'package:dio/dio.dart';
import 'package:flutterr/data/models/product/product.dart';

class ProductService {
   Future<List<Product>> getProducts() async {
    final Dio dio = Dio();
    try {
      final response = await dio.get('https://fakestoreapi.com/products');
      
      return (response.data as List).map((e) => Product.fromJson(e)).toList();
    } catch (e) {
      print("Products Error: $e");
      return [];
    }
  }
}