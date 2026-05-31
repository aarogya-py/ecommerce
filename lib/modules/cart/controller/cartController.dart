import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterr/data/models/product/product.dart';
import 'package:get/get.dart';

class CartController  extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  String get userId => auth.currentUser?.uid ?? "";

  Future<void> addToCart(Product product) async{
    final cartItem =firestore
    .collection("users")
    .doc(userId)
    .collection("cart")
    .doc(product.id.toString());
    
    final snapshot = await cartItem.get();
    if(snapshot.exists){
      final currentQuantity = snapshot.data()?['quantity'] ?? 0;
      await cartItem.update({'quantity': currentQuantity + 1});
    } else {
      await cartItem.set({
        'productId': product.id,
        'title': product.title,
        'price': product.price,
        'image': product.image,
        'quantity': 1,
      });
    }
    
  }


Future<void> removeFromCart(Product product) async{
  final cartItem = firestore
    .collection("users")
    .doc(userId)
    .collection("cart")
    .doc(product.id.toString());

  await cartItem.delete();

}

Stream<QuerySnapshot> getCartItems() {
  return firestore
    .collection("users")
    .doc(userId)
    .collection("cart")
    .snapshots();
}
}