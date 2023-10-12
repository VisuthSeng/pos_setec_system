import 'package:get/get.dart';

import 'package:pos_setec_system/data/model/product_top_sold.dart';
import 'package:pos_setec_system/data/repository/product_top_sold_repository.dart';

import 'package:pos_setec_system/presentation/widget/alert_box.dart';

class ProductTopSoldController extends GetxController {
  final ProductTopSoldRepository
      productTopSoldRepository; // Inject the repository

  List<ProductTopSoldModel> listAllProduct = [];

  var listOfProduct = RxList<ProductTopSoldModel>();

  var blankProductTopSold = ProductTopSoldModel(
    id: '',
    productName: '',
    qty: 0,
    date: DateTime.now(),
  );
  late ProductTopSoldModel? selectedTopSoldProduct;

  var isLoading = false.obs;

  ProductTopSoldController(
      {required this.productTopSoldRepository}); // Inject the repository

  @override
  void onInit() async {
    selectedTopSoldProduct = blankProductTopSold;
    _getStreamListOfProduct();
    super.onInit();
  }

  void selectProduct(ProductTopSoldModel? model) {
    selectedTopSoldProduct = model;
    listOfProduct.refresh();
  }

  void resetData() {
    selectedTopSoldProduct = blankProductTopSold;
    listOfProduct.assignAll(listAllProduct);
  }

  void searchData(String strSearch) {
    isLoading.value = true;
    strSearch = strSearch.toLowerCase();
    if (strSearch.isEmpty) {
      listOfProduct.assignAll(listAllProduct);
    } else {
      listOfProduct.assignAll(
        listAllProduct
            .where((x) => x.productName.toLowerCase().contains(strSearch)),
      );
    }
    isLoading.value = false;
  }

  void _getStreamListOfProduct() {
    productTopSoldRepository.getStreamOfProductTopSold().listen(
      (event) {
        isLoading.value = true;
        listAllProduct.clear();
        listAllProduct.addAll(event);
        listAllProduct.sort(((a, b) => a.productName.compareTo(b.productName)));
        listOfProduct.assignAll(listAllProduct);
        //selectedCustomer = blankCustomer;
        isLoading.value = false;
      },
      onError: (error) {
        AlertBox.warning(message: 'Warning');
      },
    );
  }

  Future<bool> saveData(ProductTopSoldModel model) async {
    var bCheck = false;
    try {
      selectedTopSoldProduct =
          await productTopSoldRepository.saveProductTopSold(model);
      bCheck = true;
    } catch (error) {
      AlertBox.warning(message: 'Warning');
    }
    return bCheck;
  }

  Future<bool> updateData(ProductTopSoldModel model) async {
    var bCheck = false;
    try {
      await productTopSoldRepository.updateProductTopSold(model);
      bCheck = true;
      selectedTopSoldProduct = model;
    } catch (error) {
      AlertBox.warning(message: 'Warning');
    }
    return bCheck;
  }

  Future<bool> deleteData(String recordId) async {
    var bCheck = false;
    try {
      await productTopSoldRepository.deleteProductTopSold(recordId);
      selectedTopSoldProduct = blankProductTopSold;
      bCheck = true;
    } catch (error) {
      AlertBox.warning(message: 'Warning');
    }
    return bCheck;
  }
}
