import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers_app/core/helpers/constants.dart';
import 'package:sneakers_app/core/models/product_model.dart';
import 'package:sneakers_app/ui/screens/home/home_controller.dart';
import 'package:sneakers_app/ui/styles/decoration.dart';
import 'package:sneakers_app/ui/widgets/cart_button.dart';
import 'package:sneakers_app/ui/widgets/loading.dart';
import 'package:sneakers_app/ui/widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (HomeController controller) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: verticalSpacing,
                    horizontal: horizontalSpacing,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: Text(
                          'Welcome! what are you looking for?',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      generalBox, // Used this to use the vertical space that mentioned on constants.dart
                      const CartButton(),
                    ],
                  ),
                ),
                generalBox, // Used this to use the vertical space that mentioned on constants.dart
                controller.isLoading
                    ? const Expanded(
                        child: Center(
                          child: LoadingWidget(),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          padding: generalPadding,
                          itemBuilder: (context, index) {
                            // Our Product Item
                            Product item = controller.products![index];
                            return ProductCard(item: item);
                          },
                          itemCount: controller.products?.length ?? 0,
                        ),
                      )
              ],
            ),
          ),
        );
      },
    );
  }
}
