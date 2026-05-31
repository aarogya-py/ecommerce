import 'package:flutterr/modules/cart/controller/cartController.dart';
import 'package:get/get.dart';

class ProductDetailBinding  extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController());
  }
}