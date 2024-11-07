import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:sneakers_app/core/models/product_model.dart';

class ProductDetailsController extends GetxController {
  late Product product;
  bool isFav = false;

  final CarouselSliderController sliderController = CarouselSliderController();
  int currentSliderIndex = 0;

  @override
  void onInit() {
    super.onInit();
    product = Get.arguments;
  }

  void changeFav() {
    isFav = !isFav;
    update();
  }

  onSliderChange(int index) {
    currentSliderIndex = index;
    update();
  }
}
