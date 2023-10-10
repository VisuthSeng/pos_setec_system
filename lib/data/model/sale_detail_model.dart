import 'dart:convert';

class SaleDetailModel {
  final String id;
  final String productName;
  double qty;
  final double price;
  final int discount;
  final double amount;
  final String img;

  SaleDetailModel({
    required this.id,
    required this.productName,
    required this.qty,
    required this.price,
    required this.discount,
    required this.amount,
    required this.img,
  });

  SaleDetailModel copyWith({
    String? id,
    String? productName,
    double? qty,
    double? price,
    int? discount,
    double? amount,
    String? img,
  }) {
    return SaleDetailModel(
      id: id ?? this.id,
      productName: productName ?? this.productName,
      qty: qty ?? this.qty,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      amount: amount ?? this.amount,
      img: img ?? this.img,
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
      'img': img,
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
      img: map['img'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SaleDetailModel.fromJson(String source) =>
      SaleDetailModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SaleDetailModel(id: $id, productName: $productName, qty: $qty, price: $price, discount: $discount, amount: $amount, img: $img)';
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
        other.amount == amount &&
        other.img == img;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        productName.hashCode ^
        qty.hashCode ^
        price.hashCode ^
        discount.hashCode ^
        amount.hashCode ^
        img.hashCode;
  }
}
