import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers_app/core/helpers/constants.dart';
import 'package:sneakers_app/core/helpers/sizes.dart';
import 'package:sneakers_app/core/models/product_model.dart';
import 'package:sneakers_app/routes.dart';
import 'package:sneakers_app/ui/styles/colors.dart';
import 'package:sneakers_app/ui/styles/decoration.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.item,
  });

  final Product item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(routeProductDetails, arguments: item);
      },
      child: Container(
        decoration: cardDecoration(withShadow: true),
        margin: EdgeInsets.symmetric(
          vertical: verticalSpacing / 2,
        ),
        padding: generalPadding,
        child: Row(
          children: [
            Hero(
              tag: item.name!,
              child: Image.network(
                item.images![0],
                width: kDeviceWidth * 0.2,
                height: kDeviceHeight * 0.1,
              ),
            ),
            generalSmallBox,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.name ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        '\$${item.price}',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Text(
                    item.brand ?? '',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.accent,
                      //  fontStyle: FontStyle.italic,
                    ),
                  ),
                  generalSmallBox,
                  Text(
                    item.description ?? '',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.grey,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
