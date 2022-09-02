import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_crm/helpers/helpers.dart';
import 'package:mobile_crm/helpers/navigation-services.dart';
import 'package:mobile_crm/home_navigation.dart';
import 'package:provider/provider.dart';
import '../constants/custome_theme.dart';
import 'controller/appbar_name_provider.dart';
import 'helpers/all_routes.dart';
import 'helpers/di.dart';
import 'helpers/dio/dio.dart';
import 'screens/loading.dart';
import 'screens/login_screen.dart';

void main() async {
  diSetup();

  await GetStorage.init();
  DioSingleton.instance.create();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setId();
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
              home: Loading(), //const NavigationScreen(),
              navigatorKey: NavigationService.navigatorKey,
              onGenerateRoute: RouteGenerator.generateRoute,
            );
          }),
    );
  }
}
