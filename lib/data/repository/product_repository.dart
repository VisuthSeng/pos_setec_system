import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pos_setec_system/data/firebase/firestore_collection.dart';
import 'package:pos_setec_system/data/model/product_model.dart';

abstract class IProductRepository {
  Future<ProductModel> saveProduct(ProductModel model);
  Stream<List<ProductModel>> getStreamOfProduct();
  Future<void> updateProduct(ProductModel model);
  Future<void> deleteProduct(String id);
}

class ProductRepository extends IProductRepository {
  @override
  Future<void> deleteProduct(String id) async {
    await FirestoreCollection.product.doc(id).delete();
  }

  @override
  Stream<List<ProductModel>> getStreamOfProduct() {
    return FirestoreCollection.product.snapshots().map(
      (QuerySnapshot snapshot) {
        List<ProductModel> listProduct = [];
        for (var doc in snapshot.docs) {
          listProduct
              .add(ProductModel.fromMap(doc.data() as Map<String, dynamic>));
        }
        return listProduct;
      },
    );
  }

  @override
  Future<ProductModel> saveProduct(ProductModel model) async {
    await FirestoreCollection.product.doc(model.id).set(model.toMap());
    return model;
  }

  @override
  Future<void> updateProduct(ProductModel model) async {
    await FirestoreCollection.product.doc(model.id).set(model.toMap());
  }
}
