import 'package:eventus/app/view/controllers/home/home_controller.dart';
import 'package:get/get.dart';

class HomeDependencies implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(authRepository: Get.find()),
    );
  }
}
