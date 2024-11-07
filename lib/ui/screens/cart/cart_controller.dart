import 'package:get/get.dart';
import 'package:sneakers_app/core/helpers/keys.dart';
import 'package:sneakers_app/core/models/product_model.dart';

class CartController extends GetxController {
  List<Map> items = [];
  void addToCart(Product product) {
    bool found = false;

    for (var item in items) {
      if (item[kProduct] == product) {
        item[kQuantity]++;
        found = true;
        break;
      }
    }
    if (!found) {
      items.add(
        {
          kProduct: product,
          kQuantity: 1,
        },
      );
    }
    update();
  }

  void removeFromCart(Product product) {
    for (var item in items) {
      if (item[kProduct] == product) {
        item[kQuantity]--;
        if (item[kQuantity] == 0) {
          items.removeWhere((item) => item[kProduct] == product);
        }
        break;
      }
    }
    update();
  }
}
