import 'package:get/get.dart';
import 'package:pos_setec_system/data/model/category_model.dart';
import 'package:pos_setec_system/data/model/product_model.dart';
import 'package:pos_setec_system/data/repository/product_repository.dart';
import 'package:pos_setec_system/presentation/widget/alert_box.dart';

class ProductController extends GetxController {
  final ProductRepository productRepository; // Inject the repository

  List<ProductModel> listAllProduct = [];

  var listOfProduct = RxList<ProductModel>();

  var blankCategory = ProductModel(
    id: '',
    name: '',
    categoryModel: CategoryModel(
      id: '',
      name: '',
    ),
    price: 0,
    qty: 0,
  );
  late ProductModel? selectedProduct;
  late CategoryModel categoryModel;

  var isLoading = false.obs;

  ProductController({required this.productRepository}); // Inject the repository

  @override
  void onInit() async {
    selectedProduct = blankCategory;
    _getStreamListOfProduct();
    super.onInit();
  }

  void selectProduct(ProductModel? model) {
    selectedProduct = model;
    listOfProduct.refresh();
  }

  void resetData() {
    selectedProduct = blankCategory;
    listOfProduct.assignAll(listAllProduct);
  }

  void searchData(String strSearch) {
    isLoading.value = true;
    strSearch = strSearch.toLowerCase();
    if (strSearch.isEmpty) {
      listOfProduct.assignAll(listAllProduct);
    } else {
      listOfProduct.assignAll(
        listAllProduct.where((x) => x.name.toLowerCase().contains(strSearch)),
      );
    }
    isLoading.value = false;
  }

  void _getStreamListOfProduct() {
    productRepository.getStreamOfProduct().listen(
      (event) {
        isLoading.value = true;
        listAllProduct.clear();
        listAllProduct.addAll(event);
        listAllProduct.sort(((a, b) => a.name.compareTo(b.name)));
        listOfProduct.assignAll(listAllProduct);
        //selectedCustomer = blankCustomer;
        isLoading.value = false;
      },
      onError: (error) {
        AlertBox.warning(message: 'Warning');
      },
    );
  }

  Future<bool> saveData(ProductModel model) async {
    var bCheck = false;
    try {
      selectedProduct = await productRepository.saveProduct(model);
      bCheck = true;
    } catch (error) {
      AlertBox.warning(message: 'Warning');
    }
    return bCheck;
  }

  Future<bool> updateData(ProductModel model) async {
    var bCheck = false;
    try {
      await productRepository.updateProduct(model);
      bCheck = true;
      selectedProduct = model;
    } catch (error) {
      AlertBox.warning(message: 'Warning');
    }
    return bCheck;
  }

  Future<bool> deleteData(String recordId) async {
    var bCheck = false;
    try {
      await productRepository.deleteProduct(recordId);
      selectedProduct = blankCategory;
      bCheck = true;
    } catch (error) {
      AlertBox.warning(message: 'Warning');
    }
    return bCheck;
  }
}
