import 'package:get/get.dart';
import 'package:pos_setec_system/data/repository/category_repository.dart';
import 'package:pos_setec_system/data/repository/customer_repository.dart';
import 'package:pos_setec_system/presentation/controller/category_controller.dart';
import 'package:pos_setec_system/presentation/controller/customer_controller.dart';

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
  }
}
