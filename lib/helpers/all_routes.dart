import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:mobile_crm/home_navigation.dart';
import 'package:mobile_crm/screens/dashboard_screen.dart';
import 'package:mobile_crm/screens/report_screen.dart';
import 'package:mobile_crm/screens/transaction_screen.dart';

import '../screens/report_table_screen.dart';
import '../widgets/category_popup.dart';

class Routes {
  //static const String loader='/loader';
  static const String dashboard = '/dashboard';
  static const String report = '/report';
  static const String transaction = '/transaction';
  static const String homeNavigation = '/homeNavigation';

  static const String reportsTable = '/reportsTable';
  static const String reportsPreSelect = '/preselect';
}

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeNavigation:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const NavigationScreen(), settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const NavigationScreen());
      case Routes.dashboard:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const DashBoard(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const DashBoard());
      case Routes.report:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: const Reports(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const Reports());
      case Routes.transaction:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const Transaction(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const Transaction());
      case Routes.reportsTable:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ReportsTable(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const ReportsTable());
      case Routes.reportsPreSelect:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: CategoryGroupPopupWidget(), settings: settings)
            : CupertinoPageRoute(
                builder: (context) => CategoryGroupPopupWidget());
      // case Routes.contactoEnderco:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const ContactoEnderco(), settings: settings)
      //       : CupertinoPageRoute(builder: (context) => const ContactoEnderco());
      // case Routes.produtosPenIcon:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const ProdutosPenIcon(), settings: settings)
      //       : CupertinoPageRoute(builder: (context) => const ProdutosPenIcon());
      // case Routes.todasAsCategories:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const TodasAsCategories(), settings: settings)
      //       : CupertinoPageRoute(
      //           builder: (context) => const TodasAsCategories());
      // case Routes.loadingScreen:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const Loading(),
      //           settings:
      //               settings) //_FadedTransitionRoute(builder: (context)=> const SobrenosScreen())
      //       : CupertinoPageRoute(builder: (context) => const Loading());
      // case Routes.orderDetailScreen:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const OrderDetail(), settings: settings)
      //       : CupertinoPageRoute(builder: (context) => const OrderDetail());
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
          reverseTransitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: const Duration(microseconds: 100),
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
