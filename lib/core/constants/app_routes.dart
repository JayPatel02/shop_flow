import 'package:flutter/cupertino.dart';
import 'package:shop_flow/features/auth_module/intro_screen/view/intro_screen_view.dart';
import 'package:shop_flow/features/auth_module/login/view/login_screen.dart';
import 'package:shop_flow/features/auth_module/splash_screen/view/splash_screen_view.dart';
import 'package:shop_flow/features/dashboard_module/seller_dashboard/view/seller_dashboard_view.dart';
import 'package:shop_flow/features/product_module/add_product/view/add_product_screen.dart';
import 'package:shop_flow/features/product_module/product_detail/view/product_detail_screen.dart';
import 'package:shop_flow/features/tab_bar_module/view/tab_bar_screen.dart';

class AppRoutes {
  static final splashScreen = "/splashScreen";
  static final introScreen = "/introScreen";
  static final loginRoute = "/login";

  static final homeRoute = "/home";

  static final userCart = "/userCart";

  static final viewProduct = "/productDetail";

  static final getAllActiveProducts = "/allProducts";
  static final getAllDraftProducts = "/allProducts";

  static final addProduct = "/addProduct";

  static final viewSellerDashboard = "/viewSellerDashboard";


  static Map<String , WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreenView(),
    introScreen : (context) => const IntroCarousel(),
    loginRoute : (context) => LoginScreen(),
    homeRoute : (context) => TabBarScreen(),
    viewProduct : (context) => ProductDetailScreen(),
    addProduct : (context) => AddProductScreen(),
    viewSellerDashboard : (context) => SellerDashboardView()
  };
}
