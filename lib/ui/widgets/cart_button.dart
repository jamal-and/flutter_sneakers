import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sneakers_app/routes.dart';
import 'package:sneakers_app/ui/screens/cart/cart_controller.dart';
import 'package:sneakers_app/ui/styles/colors.dart';
import 'package:sneakers_app/ui/styles/decoration.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CupertinoButton(
          onPressed: () {
            Get.toNamed(routeCart);
          },
          child: const Icon(CupertinoIcons.cart),
        ),
        Positioned(
          top: 0,
          right: -4,
          child: Container(
            decoration: circleDecoration(color: AppColors.primary),
            padding: const EdgeInsets.all(8),
            child: GetBuilder<CartController>(
                builder: (CartController controller) {
              return Text(
                Get.find<CartController>().items.length.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.white,
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
