import 'package:get/get.dart';
import 'package:pos_setec_system/data/repository/category_repository.dart';
import 'package:pos_setec_system/data/repository/customer_repository.dart';
import 'package:pos_setec_system/data/repository/product_repository.dart';
import 'package:pos_setec_system/data/repository/product_top_sold_repository.dart';
import 'package:pos_setec_system/data/repository/sale_repository.dart';
import 'package:pos_setec_system/presentation/controller/category_controller.dart';
import 'package:pos_setec_system/presentation/controller/customer_controller.dart';
import 'package:pos_setec_system/presentation/controller/product_controller.dart';
import 'package:pos_setec_system/presentation/controller/product_top_sold_controller.dart';
import 'package:pos_setec_system/presentation/controller/sale_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      CustomerRepository(),
      permanent: true,
    );
    Get.put(
      CustomerController(
        customerRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put(
      CategoryRepository(),
      permanent: true,
    );
    Get.put(
      CategoryController(
        categoryRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put(
      ProductRepository(),
      permanent: true,
    );
    Get.put(
      ProductController(
        productRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put(
      SaleRepository(),
      permanent: true,
    );
    Get.put(
        SaleController(
          saleRepository: Get.find(),
        ),
        permanent: true);
    Get.put(
      ProductTopSoldRepository(),
      permanent: true,
    );
    Get.put(
        ProductTopSoldController(
          productTopSoldRepository: Get.find(),
        ),
        permanent: true);
  }
}
