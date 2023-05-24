import 'package:get/get.dart';
import 'package:kutoa/controllers/auth_controller.dart';
import 'package:kutoa/controllers/main_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
    Get.put<MainController>(MainController());
  }
}
