import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_setec_system/data/model/category_model.dart';
import 'package:pos_setec_system/presentation/controller/category_controller.dart';
import 'package:pos_setec_system/presentation/controller/customer_controller.dart';
import 'package:pos_setec_system/presentation/screen/master_data/category/category_form.dart';
import 'package:pos_setec_system/presentation/screen/master_data/category/component/category_list.dart';
import 'package:pos_setec_system/presentation/util/form_list_title.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final CategoryController categoryController = Get.find();
  final CustomerController customerController = Get.find();
  late TextEditingController tecSearch;
  late FocusNode fnSearch;
  @override
  void initState() {
    tecSearch = TextEditingController();
    fnSearch = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    tecSearch.dispose();
    fnSearch.dispose();

    super.dispose();
  }

  void onDelete(CategoryModel model) {
    categoryController.deleteData(model.id);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        width: 1010,
        height: constraints.maxHeight,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Obx(
            () => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  FormListTitle(
                    title: 'Category',
                    record: categoryController.listOfCategory.length,
                    fnSearch: fnSearch,
                    tecSearch: tecSearch,
                    onSearch: (search) {
                      categoryController.searchData(search);
                    },
                    onPress: () {
                      Get.to(() => const CategoryForm());
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade400,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: constraints.maxWidth - 10,
                    height: constraints.maxHeight - 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 223, 226, 228),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20.0,
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 30,
                                  child: Text(
                                    '#',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Center(
                                    child: Text(
                                      'Category',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Center(
                                    child: Text(
                                      'Product',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: constraints.maxWidth - 10,
                          height: constraints.maxHeight - 60 - 42,
                          child: SingleChildScrollView(
                            child: Column(
                              children: List.generate(
                                categoryController.listOfCategory.length,
                                (index) => CategoryList(
                                  categoryModel:
                                      categoryController.listOfCategory[index],
                                  index: index,
                                  onSelect: () =>
                                      categoryController.selectCategory(
                                    categoryController.listOfCategory[index],
                                  ),
                                  onEdit: () {
                                    categoryController.selectCategory(
                                        categoryController
                                            .listOfCategory[index]);
                                    Get.to(
                                      () => const CategoryForm(
                                        formEdit: true,
                                      ),
                                    );
                                  },
                                  onDelete: () => onDelete(
                                    categoryController.listOfCategory[index],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
