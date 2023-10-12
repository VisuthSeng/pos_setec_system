import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pos_setec_system/data/model/product_top_sold.dart';
import '../firebase/firestore_collection.dart';

abstract class IProductTopSoldRepository {
  Future<ProductTopSoldModel> saveProductTopSold(ProductTopSoldModel model);
  Stream<List<ProductTopSoldModel>> getStreamOfProductTopSold();
  Future<void> updateProductTopSold(ProductTopSoldModel model);
  Future<void> deleteProductTopSold(String id);
}

class ProductTopSoldRepository extends IProductTopSoldRepository {
  @override
  Future<void> deleteProductTopSold(String id) async {
    await FirestoreCollection.productTopSold.doc(id).delete();
  }

  @override
  Stream<List<ProductTopSoldModel>> getStreamOfProductTopSold() {
    return FirestoreCollection.productTopSold.snapshots().map(
      (QuerySnapshot snapshot) {
        List<ProductTopSoldModel> listProductTopSold = [];
        for (var doc in snapshot.docs) {
          listProductTopSold.add(
              ProductTopSoldModel.fromMap(doc.data() as Map<String, dynamic>));
        }
        return listProductTopSold;
      },
    );
  }

  @override
  Future<ProductTopSoldModel> saveProductTopSold(
      ProductTopSoldModel model) async {
    await FirestoreCollection.productTopSold.doc(model.id).set(model.toMap());
    return model;
  }

  @override
  Future<void> updateProductTopSold(ProductTopSoldModel model) async {
    await FirestoreCollection.productTopSold.doc(model.id).set(model.toMap());
  }
}
