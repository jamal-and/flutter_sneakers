import 'package:get/get.dart';
import 'package:sneakers_app/ui/screens/cart/cart_screen.dart';
import 'package:sneakers_app/ui/screens/home/home_screen.dart';
import 'package:sneakers_app/ui/screens/product_details/product_details_screen.dart';
import 'package:sneakers_app/ui/screens/splash/splash_screen.dart';

const String routeSplash = '/';
const String routeHome = '/home';
const String routeProductDetails = '/productDetails';
const String routeCart = '/cart';

List<GetPage> routes = [
  GetPage(
    name: routeSplash,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: routeHome,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: routeProductDetails,
    page: () => const ProductDetailsScreen(),
  ),
  GetPage(
    name: routeCart,
    page: () => const CartScreen(),
  ),
];
