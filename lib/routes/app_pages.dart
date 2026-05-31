import 'package:flutterr/modules/auth/bindings/auth_binding.dart';
import 'package:flutterr/modules/auth/bindings/signup_binding.dart';
import 'package:flutterr/modules/auth/views/login_Screen.dart';
import 'package:flutterr/modules/auth/views/signup_Screen.dart';
import 'package:flutterr/modules/cart/views/cartitems.dart';
import 'package:flutterr/modules/product_detail/binding/product_detail_binding.dart';
import 'package:flutterr/modules/product_detail/view/product_detail.dart';
import 'package:flutterr/modules/products/bindings/product_binding.dart';
import 'package:flutterr/modules/products/views/product_screen.dart';
import 'package:flutterr/routes/app_routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static final routes = [
    // GetPage(
    //   name: AppRoutes.landing,
    //   page: () => LandingScreen(),
    // ),
    // GetPage(
    //   name: AppRoutes.home,
    //   page: () => HomeScreen(),
    // ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => SignupScreen(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: AppRoutes.products,
      page: () => ProductScreen(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: AppRoutes.productDetail,
      page: () => ProductDetail(),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.cart,
      page: () => Cartitems(),
      binding: ProductDetailBinding(),
    ),
  ];
}
