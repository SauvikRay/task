import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:softic_task/features/login/presentation/login_screen.dart';
import 'package:softic_task/features/product/presentation/product_details_screen.dart';
import 'package:softic_task/features/product/presentation/product_list_screen.dart';
import 'package:softic_task/features/user/presentation/profile_screen.dart';

class Routes {

  static const String loginScreen = '/loginScreen';
  static const String productList = '/productList';
  static const String producDetails = '/producDetails';
  static const String profile = '/profile';
}

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.loginScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const LoginScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const LoginScreen());
      case Routes.productList:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const AllProductsScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const AllProductsScreen());
      case Routes.producDetails:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ProductsDetails(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const ProductsDetails());
        case Routes.profile:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ProfileScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const ProfileScreen());
      
      // case Routes.navigation:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const NavigationScreen(),
      //           settings:
      //               settings) //_FadedTransitionRoute(builder: (context)=> const SobrenosScreen())
      //       : CupertinoPageRoute(
      //           builder: (context) => const NavigationScreen());

      default:
        return null;
    }
  }
}

class _FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  @override
  final RouteSettings settings;

  _FadedTransitionRoute({required this.widget, required this.settings})
      : super(
          settings: settings,
          reverseTransitionDuration: const Duration(milliseconds: 400),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.easeOut,
              ),
              child: child,
            );
          },
        );
}
