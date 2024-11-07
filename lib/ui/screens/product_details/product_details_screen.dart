import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers_app/core/helpers/constants.dart';
import 'package:sneakers_app/core/helpers/sizes.dart';
import 'package:sneakers_app/ui/screens/cart/cart_controller.dart';
import 'package:sneakers_app/ui/screens/product_details/product_details_controller.dart';
import 'package:sneakers_app/ui/styles/colors.dart';
import 'package:sneakers_app/ui/styles/decoration.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.accentDark,
      body: GetBuilder<ProductDetailsController>(
        init: ProductDetailsController(),
        builder: (ProductDetailsController controller) {
          return SafeArea(
            bottom: false,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Icon(
                        CupertinoIcons.back,
                        color: AppColors.white,
                      ),
                    ),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '${controller.product.name} Details',
                          style: const TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    CupertinoButton(
                      onPressed: () {
                        controller.changeFav();
                      },
                      child: Icon(
                        controller.isFav
                            ? CupertinoIcons.heart_fill
                            : CupertinoIcons.heart,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                generalBox,
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(
                          horizontalSpacing,
                        ),
                      ),
                      color: AppColors.white,
                    ),
                    padding: generalPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SliderOfProduct(),
                        generalBox,
                        Text(
                          '${controller.product.name}',
                          style: const TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        generalBox,
                        Text(
                          '${controller.product.description}',
                          style: const TextStyle(
                            color: AppColors.grey,
                            fontSize: 14,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${controller.product.price}',
                              style: const TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            generalBox,
                            generalBox,
                            Expanded(
                              child: CupertinoButton(
                                color: AppColors.accentDark,
                                onPressed: () {
                                  Get.find<CartController>()
                                      .addToCart(controller.product);

                                  Get.back();
                                },
                                child: const Text(
                                  'Add to cart',
                                ),
                              ),
                            ),
                          ],
                        ),
                        generalBox,
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class SliderOfProduct extends StatelessWidget {
  const SliderOfProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (ProductDetailsController controller) {
        return Column(
          children: [
            Hero(
              tag: controller.product.name!,
              child: CarouselSlider(
                // Converting List of string to List Of Image.network widget
                items: controller.product.images!
                    .map(
                      (e) => Image.network(
                        e,
                        fit: BoxFit.cover,
                        height: kDeviceHeight,
                        width: kDeviceWidth,
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: kDeviceHeight * 0.3,
                  scrollPhysics: controller.product.images!.length == 1
                      ? const NeverScrollableScrollPhysics()
                      : null,
                  onPageChanged: (index, reason) {
                    controller.onSliderChange(index);
                  },
                ),
              ),
            ),
            // The dots below the slider (Indicatior)
            Visibility(
              // Hide if only one image
              visible: controller.product.images!.length != 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    controller.product.images!.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () =>
                        controller.sliderController.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (AppColors.accentDark).withOpacity(
                          controller.currentSliderIndex == entry.key ? 1 : 0.4,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
