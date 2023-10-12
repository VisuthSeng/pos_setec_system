// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductTopSoldModel {
  final String id;
  final String productName;
  final int qty;
  final DateTime date;

  ProductTopSoldModel({
    required this.id,
    required this.productName,
    required this.qty,
    required this.date,
  });

  ProductTopSoldModel copyWith({
    String? id,
    String? productName,
    int? qty,
    DateTime? date,
  }) {
    return ProductTopSoldModel(
      id: id ?? this.id,
      productName: productName ?? this.productName,
      qty: qty ?? this.qty,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'productName': productName,
      'qty': qty,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory ProductTopSoldModel.fromMap(Map<String, dynamic> map) {
    return ProductTopSoldModel(
      id: map['id'] as String,
      productName: map['productName'] as String,
      qty: map['qty'] as int,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductTopSoldModel.fromJson(String source) =>
      ProductTopSoldModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductTopSold(id: $id, productName: $productName, qty: $qty, date: $date)';
  }

  @override
  bool operator ==(covariant ProductTopSoldModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.productName == productName &&
        other.qty == qty &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^ productName.hashCode ^ qty.hashCode ^ date.hashCode;
  }
}
