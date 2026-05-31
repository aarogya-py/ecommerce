import 'package:flutterr/data/models/product/rating.dart';

class Product {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: json['rating'] != null
          ? Rating.fromJson(json['rating'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating?.toJson(),
    };
  }

  // SAFE Firestore mapping (IMPORTANT)
  factory Product.fromMap(Map<String, dynamic>? data) {
    if (data == null) return Product();

    return Product(
      id: data['id'],
      title: data['title'],
      price: (data['price'] as num?)?.toDouble(),
      description: data['description'],
      category: data['category'],
      image: data['image'],
    );
  }
}