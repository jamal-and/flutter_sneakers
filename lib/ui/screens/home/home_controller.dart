import 'package:get/get.dart';
import 'package:sneakers_app/core/api/sneakers_api.dart';
import 'package:sneakers_app/core/models/product_model.dart';
import 'package:sneakers_app/ui/screens/cart/cart_controller.dart';

// HomeScreenViewModel

class HomeController extends GetxController {
  List<Product>? products;
  bool isLoading = true;

  @override
  void onInit() {
    super.onInit();
    // Initialize cart controller
    Get.put(CartController());
    getData();
  }

  void getData() async {
    products = await SneakersApi().fetchSneakers();
    isLoading = false;
    update();
  }
}
