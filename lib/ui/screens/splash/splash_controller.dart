import 'package:get/get.dart';
import 'package:sneakers_app/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(2.seconds).then(
      (value) {
        Get.offAllNamed(routeHome);
      },
    );
  }
}
