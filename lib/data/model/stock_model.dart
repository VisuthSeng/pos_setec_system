import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:pos_setec_system/data/model/sale_detail_model.dart';

class SaleModel {
  final String id;
  final String invoice;
  final String customerName;
  final DateTime createAt;
  final double total;
  final List<SaleDetail> listSaleDetail;
  SaleModel({
    required this.id,
    required this.invoice,
    required this.customerName,
    required this.createAt,
    required this.total,
    required this.listSaleDetail,
  });

  SaleModel copyWith({
    String? id,
    String? invoice,
    String? customerName,
    DateTime? createAt,
    double? total,
    List<SaleDetail>? listSaleDetail,
  }) {
    return SaleModel(
      id: id ?? this.id,
      invoice: invoice ?? this.invoice,
      customerName: customerName ?? this.customerName,
      createAt: createAt ?? this.createAt,
      total: total ?? this.total,
      listSaleDetail: listSaleDetail ?? this.listSaleDetail,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'invoice': invoice,
      'customerName': customerName,
      'createAt': createAt.millisecondsSinceEpoch,
      'total': total,
      'listSaleDetail': listSaleDetail.map((x) => x.toMap()).toList(),
    };
  }

  factory SaleModel.fromMap(Map<String, dynamic> map) {
    return SaleModel(
      id: map['id'] ?? '',
      invoice: map['invoice'] ?? '',
      customerName: map['customerName'] ?? '',
      createAt: DateTime.fromMillisecondsSinceEpoch(map['createAt']),
      total: map['total']?.toDouble() ?? 0.0,
      listSaleDetail: List<SaleDetail>.from(
          map['listSaleDetail']?.map((x) => SaleDetail.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory SaleModel.fromJson(String source) =>
      SaleModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SaleModel(id: $id, invoice: $invoice, customerName: $customerName, createAt: $createAt, total: $total, listSaleDetail: $listSaleDetail)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SaleModel &&
        other.id == id &&
        other.invoice == invoice &&
        other.customerName == customerName &&
        other.createAt == createAt &&
        other.total == total &&
        listEquals(other.listSaleDetail, listSaleDetail);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        invoice.hashCode ^
        customerName.hashCode ^
        createAt.hashCode ^
        total.hashCode ^
        listSaleDetail.hashCode;
  }
}
