import 'package:get/get.dart';
import 'sample_service.dart';
import 'sample_controller.dart';

/// An example of how to register these in your bindings
class SampleBinding extends Bindings {
  @override
  void dependencies() {
    // 1. Register the service (It only needs ApiClient now)
    Get.lazyPut(() => SampleService(Get.find()));

    // 2. Register the controller
    Get.lazyPut(() => SampleController(Get.find(), Get.find()));
  }
}
