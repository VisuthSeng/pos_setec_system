import 'dart:convert';

class SaleDetailModel {
  final String id;
  final String productName;
  final double qty;
  final double price;
  final int discount;
  final double amount;
  SaleDetailModel({
    required this.id,
    required this.productName,
    required this.qty,
    required this.price,
    required this.discount,
    required this.amount,
  });

  SaleDetailModel copyWith({
    String? id,
    String? productName,
    double? qty,
    double? price,
    int? discount,
    double? amount,
  }) {
    return SaleDetailModel(
      id: id ?? this.id,
      productName: productName ?? this.productName,
      qty: qty ?? this.qty,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productName': productName,
      'qty': qty,
      'price': price,
      'discount': discount,
      'amount': amount,
    };
  }

  factory SaleDetailModel.fromMap(Map<String, dynamic> map) {
    return SaleDetailModel(
      id: map['id'] ?? '',
      productName: map['productName'] ?? '',
      qty: map['qty']?.toDouble() ?? 0.0,
      price: map['price']?.toDouble() ?? 0.0,
      discount: map['discount']?.toInt() ?? 0,
      amount: map['amount']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory SaleDetailModel.fromJson(String source) =>
      SaleDetailModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SaleDetail(id: $id, productName: $productName, qty: $qty, price: $price, discount: $discount, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SaleDetailModel &&
        other.id == id &&
        other.productName == productName &&
        other.qty == qty &&
        other.price == price &&
        other.discount == discount &&
        other.amount == amount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        productName.hashCode ^
        qty.hashCode ^
        price.hashCode ^
        discount.hashCode ^
        amount.hashCode;
  }
}
