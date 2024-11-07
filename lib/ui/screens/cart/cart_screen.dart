import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers_app/core/helpers/constants.dart';
import 'package:sneakers_app/core/helpers/keys.dart';
import 'package:sneakers_app/core/helpers/sizes.dart';
import 'package:sneakers_app/core/models/product_model.dart';
import 'package:sneakers_app/ui/screens/cart/cart_controller.dart';
import 'package:sneakers_app/ui/styles/colors.dart';
import 'package:sneakers_app/ui/styles/decoration.dart';
import 'package:sneakers_app/ui/widgets/product_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (CartController controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cart'),
          ),
          body: controller.items.isEmpty
              ? const Center(
                  child: Text(
                    'Your cart items will be shown here!',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.grey,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: controller.items.length,
                  padding: generalPadding,
                  itemBuilder: (context, index) {
                    int quantity = controller.items[index][kQuantity];
                    Product item = controller.items[index][kProduct];
                    return Row(
                      children: [
                        Expanded(
                          child: ProductCard(item: item),
                        ),
                        generalBox,
                        Column(
                          children: [
                            SizedBox(
                              height: horizontalSpacing * 1.5,
                              width: horizontalSpacing * 1.5,
                              child: CupertinoButton(
                                padding: const EdgeInsets.all(4),
                                color: AppColors.accent,
                                onPressed: () {
                                  controller.addToCart(item);
                                },
                                borderRadius:
                                    BorderRadius.circular(kDeviceWidth),
                                child: const Icon(
                                  CupertinoIcons.plus,
                                  size: 18,
                                ),
                              ),
                            ),
                            generalSmallBox,
                            Text(
                              quantity.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            generalSmallBox,
                            SizedBox(
                              height: horizontalSpacing * 1.5,
                              width: horizontalSpacing * 1.5,
                              child: CupertinoButton(
                                padding: const EdgeInsets.all(4),
                                color: AppColors.accent,
                                onPressed: () {
                                  controller.removeFromCart(item);
                                },
                                borderRadius:
                                    BorderRadius.circular(kDeviceWidth),
                                child: const Icon(
                                  CupertinoIcons.minus,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  },
                ),
        );
      },
    );
  }
}
