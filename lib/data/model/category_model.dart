import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:pos_setec_system/data/model/product_model.dart';

class CategoryModel {
  final String id;
  final String name;
  final List<ProductModel> listProduct;

  CategoryModel({
    required this.id,
    required this.name,
    required this.listProduct,
  });

  CategoryModel copyWith({
    String? id,
    String? name,
    List<ProductModel>? listProduct,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      listProduct: listProduct ?? this.listProduct,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'listProduct': listProduct.map((x) => x.toMap()).toList(),
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      listProduct: List<ProductModel>.from(
          map['listProduct']?.map((x) => ProductModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CategoryModel(id: $id, name: $name, listProduct: $listProduct)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryModel &&
        other.id == id &&
        other.name == name &&
        listEquals(other.listProduct, listProduct);
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ listProduct.hashCode;
}
