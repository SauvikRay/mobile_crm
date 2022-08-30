import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_crm/constants/app_constants.dart';
import 'package:mobile_crm/screens/dashboard_screen.dart';
import 'package:mobile_crm/screens/report_screen.dart';
import 'package:mobile_crm/screens/transaction_screen.dart';
import 'package:mobile_crm/widgets/app_bar_widget.dart';

import 'constants/appcolors.dart';
import 'screens/products_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  //Variable for navigation Index
  int _currentIndex = 0;
  //Variable for navigation Color Index
  int _colorIndex = 0;

  bool _isFisrtBuild = true;
  bool navigationOn = true;
  final List<StatefulWidget> _screens = [
    const DashBoard(),
    const Transaction(),
    const Reports(),
    const Products(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Object? args;
    StatefulWidget? screenPage;
    if (_isFisrtBuild) {
      args = ModalRoute.of(context)!.settings.arguments;
    }
    if (args != null) {
      _colorIndex = 5;
      screenPage = args as StatefulWidget;
      var newColorindex = -1;
      for (var element in _screens) {
        newColorindex++;
        if (element.toString() == screenPage.toString()) {
          _colorIndex = newColorindex;
          break;
        }
      }
    }
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: const MainAppBarWidget(),
        body: Center(
          child: (screenPage != null)
              ? screenPage
              : _screens.elementAt(_currentIndex),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: navigationOn
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: CustomNavigationBar(
                    //scaleCurve: Curves.linear,
                    //bubbleCurve: Curves.bounceIn,
                    strokeColor: AppColors.primaryColor,
                    backgroundColor: AppColors.primaryColor,
                    borderRadius: Radius.circular(20.r),
                    currentIndex: _currentIndex,
                    onTap: (index) {
                      setState(() {
                        args = null;
                        screenPage = null;
                        _isFisrtBuild = false;
                        _currentIndex = index;
                        _colorIndex = index;
                      });
                    },
                    items: [
                      CustomNavigationBarItem(
                        icon: SvgPicture.asset(
                          AssetIcons.home,
                          color: (_colorIndex == 0)
                              ? Colors.white
                              : Colors.white.withOpacity(.4),
                          width: 20.w,
                          height: 20.h,
                        ),
                        // title: Text(
                        //   'Home',
                        //   style: (_colorIndex == 0)
                        //       ? TextFontStyle.sub2
                        //       : TextFontStyle.sub1,
                        // ),
                      ),
                      CustomNavigationBarItem(
                        icon: SvgPicture.asset(
                          AssetIcons.transaction,
                          color: (_colorIndex == 1)
                              ? Colors.white
                              : Colors.white.withOpacity(.4),
                          width: 20.w,
                          height: 20.h,
                        ),
                        // title: Text(
                        //   'Contestar',
                        //   style: (_colorIndex == 1)
                        //       ? TextFontStyle.sub2
                        //       : TextFontStyle.sub1,
                        // ),
                      ),
                      CustomNavigationBarItem(
                        icon: SvgPicture.asset(
                          AssetIcons.reports,
                          color: (_colorIndex == 2)
                              ? Colors.white
                              : Colors.white.withOpacity(.4),
                          width: 20.w,
                          height: 20.h,
                        ),
                        // title: Text('Publicações',
                        //     style: (_colorIndex == 2)
                        //         ? TextFontStyle.sub2
                        //         : TextFontStyle.sub1),
                      ),
                      CustomNavigationBarItem(
                        icon: SvgPicture.asset(
                          AssetIcons.products,
                          color: (_colorIndex == 3)
                              ? Colors.white
                              : Colors.white.withOpacity(.4),
                          width: 20.w,
                          height: 20.h,
                        ),
                        // title: Text('Faqs',
                        //     style: (_colorIndex == 3)
                        //         ? TextFontStyle.sub2
                        //         : TextFontStyle.sub1),
                      ),
                    ]),
              )
            : Container(),
      ),
    );
  }
}
