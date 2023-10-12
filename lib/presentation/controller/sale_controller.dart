import 'package:get/get.dart';
import '../../data/model/sale_model.dart';
import '../../data/repository/sale_repository.dart';

import '../widget/alert_box.dart';

class SaleController extends GetxController {
  final SaleRepository saleRepository; // Inject the repository

  List<SaleModel> listAllSale = [];

  var listOfSale = RxList<SaleModel>();

  var blankSale = SaleModel(
    id: '',
    invoice: '',
    customerName: '',
    createAt: DateTime.now(),
    total: 0,
    listSaleDetail: [],
  );
  late SaleModel? selectedSale;

  var isLoading = false.obs;

  SaleController({required this.saleRepository}); // Inject the repository

  @override
  void onInit() async {
    selectedSale = blankSale;
    _getStreamListOfCategory();
    super.onInit();
  }

  void selectSaleReport(SaleModel? model) {
    selectedSale = model;
    listOfSale.refresh();
  }

  void resetData() {
    selectedSale = blankSale;
    listOfSale.assignAll(listAllSale);
  }

  void searchData(String strSearch) {
    isLoading.value = true;
    strSearch = strSearch.toLowerCase();
    if (strSearch.isEmpty) {
      listOfSale.assignAll(listAllSale);
    } else {
      listOfSale.assignAll(
        listAllSale
            .where((x) => x.customerName.toLowerCase().contains(strSearch)),
      );
    }
    isLoading.value = false;
  }

  void _getStreamListOfCategory() {
    saleRepository.getStreamOfSale().listen(
      (event) {
        isLoading.value = true;
        listAllSale.clear();
        listAllSale.addAll(event);
        listAllSale.sort(((a, b) => a.customerName.compareTo(b.customerName)));
        listOfSale.assignAll(listAllSale);
        //selectedCustomer = blankCustomer;
        isLoading.value = false;
      },
      onError: (error) {
        AlertBox.warning(message: 'Warning');
      },
    );
  }

  Future<bool> saveData(SaleModel model) async {
    var bCheck = false;
    try {
      selectedSale = await saleRepository.saveSale(model);
      bCheck = true;
    } catch (error) {
      AlertBox.warning(message: 'Warning');
    }
    return bCheck;
  }

  Future<bool> updateData(SaleModel model) async {
    var bCheck = false;
    try {
      await saleRepository.updateSale(model);
      bCheck = true;
      selectedSale = model;
    } catch (error) {
      AlertBox.warning(message: 'Warning');
    }
    return bCheck;
  }

  Future<bool> deleteData(String recordId) async {
    var bCheck = false;
    try {
      await saleRepository.deleteSale(recordId);
      selectedSale = blankSale;
      bCheck = true;
    } catch (error) {
      AlertBox.warning(message: 'Warning');
    }
    return bCheck;
  }
}
