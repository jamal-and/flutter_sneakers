import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers_app/routes.dart';
import 'package:sneakers_app/ui/styles/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Sneaker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
        ),
        useMaterial3: true,
        fontFamily: 'Mon',
      ),
      getPages: routes,
    );
  }
}
