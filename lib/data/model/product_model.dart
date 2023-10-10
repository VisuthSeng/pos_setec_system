import 'dart:convert';

import 'category_model.dart';

class ProductModel {
  final String id;
  final CategoryModel categoryModel;
  final String name;
  final double price;
  final double qty;
  final String img;

  ProductModel({
    required this.id,
    required this.categoryModel,
    required this.name,
    required this.price,
    required this.qty,
    required this.img,
  });

  ProductModel copyWith({
    String? id,
    CategoryModel? categoryModel,
    String? name,
    double? price,
    double? qty,
    String? img,
  }) {
    return ProductModel(
      id: id ?? this.id,
      categoryModel: categoryModel ?? this.categoryModel,
      name: name ?? this.name,
      price: price ?? this.price,
      qty: qty ?? this.qty,
      img: img ?? this.img,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categoryModel': categoryModel.toMap(),
      'name': name,
      'price': price,
      'qty': qty,
      'img': img,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? '',
      categoryModel: CategoryModel.fromMap(map['categoryModel']),
      name: map['name'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      qty: map['qty']?.toDouble() ?? 0.0,
      img: map['img'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, categoryModel: $categoryModel, name: $name, price: $price, qty: $qty, img: $img)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.id == id &&
        other.categoryModel == categoryModel &&
        other.name == name &&
        other.price == price &&
        other.qty == qty &&
        other.img == img;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        categoryModel.hashCode ^
        name.hashCode ^
        price.hashCode ^
        qty.hashCode ^
        img.hashCode;
  }
}
