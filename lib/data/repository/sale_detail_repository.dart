import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pos_setec_system/data/firebase/firestore_collection.dart';
import 'package:pos_setec_system/data/model/sale_detail_model.dart';

abstract class ISaleDetailRepository {
  Future<SaleDetailModel> saveSaleDetail(SaleDetailModel model);
  Stream<List<SaleDetailModel>> getStreamOfSaleDetail();
  Future<void> updateSaleDetail(SaleDetailModel model);
  Future<void> deleteSaleDetail(String id);
}

class SaleDetailRepository extends ISaleDetailRepository {
  @override
  Future<void> deleteSaleDetail(String id) async {
    await FirestoreCollection.saleDetail.doc(id).delete();
  }

  @override
  Stream<List<SaleDetailModel>> getStreamOfSaleDetail() {
    return FirestoreCollection.saleDetail.snapshots().map(
      (QuerySnapshot snapshot) {
        List<SaleDetailModel> listSaleDetail = [];
        for (var doc in snapshot.docs) {
          listSaleDetail
              .add(SaleDetailModel.fromMap(doc.data() as Map<String, dynamic>));
        }
        return listSaleDetail;
      },
    );
  }

  @override
  Future<SaleDetailModel> saveSaleDetail(SaleDetailModel model) async {
    await FirestoreCollection.saleDetail.doc(model.id).set(model.toMap());
    return model;
  }

  @override
  Future<void> updateSaleDetail(SaleDetailModel model) async {
    await FirestoreCollection.saleDetail.doc(model.id).set(model.toMap());
  }
}
