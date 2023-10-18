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

  void resetAndSortSalesListHighToLow() {
    listOfSale.assignAll(listAllSale);
    // Sort the list by the createAt property, in descending order (high to low)
    listOfSale.sort((a, b) => b.createAt.compareTo(a.createAt));
  }

  void filterSalesForLastWeek() {
    final DateTime now = DateTime.now();
    final DateTime lastWeek = now.subtract(const Duration(days: 7));

    // Filter the sales for the last week
    List<SaleModel> filteredSales =
        listAllSale.where((sale) => sale.createAt.isAfter(lastWeek)).toList();

    // Sort the filtered sales from low to high
    filteredSales.sort((a, b) => a.createAt.compareTo(b.createAt));

    // Update the list of sales with the sorted and filtered sales
    listOfSale.assignAll(filteredSales);
  }

  void filterSalesForLastMonth() {
    final DateTime now = DateTime.now();
    final DateTime lastMonthStart = DateTime(now.year, now.month - 1, 1);
    final DateTime lastMonthEnd =
        DateTime(now.year, now.month, 1).subtract(const Duration(days: 1));

    // Filter the sales for the last month
    List<SaleModel> filteredSales = listAllSale.where((sale) {
      final saleDate = sale.createAt;
      return saleDate.isAfter(lastMonthStart) &&
          saleDate.isBefore(lastMonthEnd);
    }).toList();

    // Sort the filtered sales from low to high
    filteredSales.sort((a, b) => a.createAt.compareTo(b.createAt));

    // Update the list of sales with the sorted and filtered sales
    listOfSale.assignAll(filteredSales);
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
