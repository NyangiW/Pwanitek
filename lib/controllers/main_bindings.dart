
import 'package:get/get.dart';
import 'package:kutoa/controllers/auth_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
  }
}