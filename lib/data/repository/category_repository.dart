import 'package:cloud_firestore/cloud_firestore.dart';
import '../firebase/firestore_collection.dart';
import '../model/category_model.dart';

abstract class ICategoryRepository {
  Future<CategoryModel> saveCategory(CategoryModel model);
  Stream<List<CategoryModel>> getStreamOfCategory();
  Future<void> updateCategory(CategoryModel model);
  Future<void> deleteCategory(String id);
}

class CategoryRepository extends ICategoryRepository {
  @override
  Future<void> deleteCategory(String id) async {
    await FirestoreCollection.category.doc(id).delete();
  }

  @override
  Stream<List<CategoryModel>> getStreamOfCategory() {
    return FirestoreCollection.category.snapshots().map(
      (QuerySnapshot snapshot) {
        List<CategoryModel> listCategory = [];
        for (var doc in snapshot.docs) {
          listCategory
              .add(CategoryModel.fromMap(doc.data() as Map<String, dynamic>));
        }
        return listCategory;
      },
    );
  }

  @override
  Future<CategoryModel> saveCategory(CategoryModel model) async {
    await FirestoreCollection.category.doc(model.id).set(model.toMap());
    return model;
  }

  @override
  Future<void> updateCategory(CategoryModel model) async {
    await FirestoreCollection.category.doc(model.id).set(model.toMap());
  }
}
