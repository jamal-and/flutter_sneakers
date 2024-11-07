import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:sneakers_app/ui/screens/splash/splash_controller.dart';
import 'package:sneakers_app/ui/styles/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return const Scaffold(
      body: Center(
        child: Text(
          'Sneakers Store!',
          style: TextStyle(
              color: AppColors.primaryDark,
              fontSize: 32,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
