import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_crm/helpers/navigation-services.dart';
import 'package:mobile_crm/home_navigation.dart';
import 'package:provider/provider.dart';
import '../constants/custome_theme.dart';
import 'controller/appbar_name_provider.dart';
import 'helpers/all_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppbarNameProvider>(
          create: (context) => AppbarNameProvider(),
        )
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: CustomTheme.mainTheme,
              builder: (context, widget) {
                return MediaQuery(data: MediaQuery.of(context), child: widget!);
              },
              home: const NavigationScreen(),
              navigatorKey: NavigationService.navigatorKey,
              onGenerateRoute: RouteGenerator.generateRoute,
            );
          }),
    );
  }
}
