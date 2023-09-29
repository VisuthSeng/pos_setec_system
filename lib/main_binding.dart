import 'package:get/get.dart';
import 'package:pos_setec_system/data/repository/customer_repository.dart';
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
  }
}
