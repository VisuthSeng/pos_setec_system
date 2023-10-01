import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pos_setec_system/data/firebase/firestore_collection.dart';
import 'package:pos_setec_system/data/model/sale_model.dart';

abstract class ISaleRepository {
  Future<SaleModel> saveSale(SaleModel model);
  Stream<List<SaleModel>> getStreamOfSale();
  Future<void> updateSale(SaleModel model);
  Future<void> deleteSale(String id);
}

class SaleRepository extends ISaleRepository {
  @override
  Future<void> deleteSale(String id) async {
    await FirestoreCollection.sale.doc(id).delete();
  }

  @override
  Stream<List<SaleModel>> getStreamOfSale() {
    return FirestoreCollection.sale.snapshots().map(
      (QuerySnapshot snapshot) {
        List<SaleModel> listSale = [];
        for (var doc in snapshot.docs) {
          listSale.add(SaleModel.fromMap(doc.data() as Map<String, dynamic>));
        }
        return listSale;
      },
    );
  }

  @override
  Future<SaleModel> saveSale(SaleModel model) async {
    await FirestoreCollection.sale.doc(model.id).set(model.toMap());
    return model;
  }

  @override
  Future<void> updateSale(SaleModel model) async {
    await FirestoreCollection.sale.doc(model.id).set(model.toMap());
  }
}
