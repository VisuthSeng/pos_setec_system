import 'package:get/get.dart';
import 'package:pos_setec_system/data/model/category_model.dart';
import 'package:pos_setec_system/data/repository/category_repository.dart';
import 'package:pos_setec_system/presentation/widget/alert_box.dart';

class CategoryController extends GetxController {
  final CategoryRepository categoryRepository; // Inject the repository

  List<CategoryModel> listAllCategory = [];

  var listOfCategory = RxList<CategoryModel>();

  var blankCategory = CategoryModel(
    id: '',
    name: '',
    img: '',
  );
  late CategoryModel? selectedCategory;

  var isLoading = false.obs;

  CategoryController(
      {required this.categoryRepository}); // Inject the repository

  @override
  void onInit() async {
    selectedCategory = blankCategory;
    _getStreamListOfCategory();
    super.onInit();
  }

  void selectCategory(CategoryModel? model) {
    selectedCategory = model;
    listOfCategory.refresh();
  }

  void resetData() {
    selectedCategory = blankCategory;
    listOfCategory.assignAll(listAllCategory);
  }

  void searchData(String strSearch) {
    isLoading.value = true;
    strSearch = strSearch.toLowerCase();
    if (strSearch.isEmpty) {
      listOfCategory.assignAll(listAllCategory);
    } else {
      listOfCategory.assignAll(
        listAllCategory.where((x) => x.name.toLowerCase().contains(strSearch)),
      );
    }
    isLoading.value = false;
  }

  void _getStreamListOfCategory() {
    categoryRepository.getStreamOfCategory().listen(
      (event) {
        isLoading.value = true;
        listAllCategory.clear();
        listAllCategory.addAll(event);
        listAllCategory.sort(((a, b) => a.name.compareTo(b.name)));
        listOfCategory.assignAll(listAllCategory);
        //selectedCustomer = blankCustomer;
        isLoading.value = false;
      },
      onError: (error) {
        AlertBox.warning(message: 'Warning');
      },
    );
  }

  Future<bool> saveData(CategoryModel model) async {
    var bCheck = false;
    try {
      selectedCategory = await categoryRepository.saveCategory(model);
      bCheck = true;
    } catch (error) {
      AlertBox.warning(message: 'Warning');
    }
    return bCheck;
  }

  Future<bool> updateData(CategoryModel model) async {
    var bCheck = false;
    try {
      await categoryRepository.updateCategory(model);
      bCheck = true;
      selectedCategory = model;
    } catch (error) {
      AlertBox.warning(message: 'Warning');
    }
    return bCheck;
  }

  Future<bool> deleteData(String recordId) async {
    var bCheck = false;
    try {
      await categoryRepository.deleteCategory(recordId);
      selectedCategory = blankCategory;
      bCheck = true;
    } catch (error) {
      AlertBox.warning(message: 'Warning');
    }
    return bCheck;
  }
}
