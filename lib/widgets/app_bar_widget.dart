import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_crm/constants/app_constants.dart';
import 'package:mobile_crm/constants/ui_helpers.dart';
import 'package:mobile_crm/controller/change_appbar_name.dart';
import 'package:mobile_crm/helpers/navigation-services.dart';
import 'package:provider/provider.dart';

import '../constants/appcolors.dart';
import '../constants/text_font_style.dart';
import '../controller/appbar_name_provider.dart';

class MainAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBarWidget({
    Key? key,
    // this.text,
  }) : super(key: key);
  //final String? text;

  @override
  Widget build(BuildContext context) {
    //final appBarTheme = Theme.of(context).appBarTheme;
    final storage = GetStorage();
    return AppBar(
      automaticallyImplyLeading: false,
      title: Consumer<AppbarNameProvider>(
          builder: (context, value, child) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (value.appBarname != '')
                      ? Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                SystemChrome.setPreferredOrientations(
                                    [DeviceOrientation.portraitUp]);
                                NavigationService.goBack;
                                appbarName('', '', context);
                              },
                            ),
                            SvgPicture.asset(
                              value.iconName.toString(),
                              color: Colors.black,
                            ),
                            UIHelper.horizontalSpaceMedium,
                            Text(
                              value.appBarname,
                              style: TextFontStyle.welcome
                                  .copyWith(color: Colors.black),
                            ),
                            UIHelper.horizontalSpaceMedium,
                            Text(
                              'Log in Type: ${storage.read(kKeyLoggedId)}',
                              style: TextFontStyle.loginType,
                            )
                          ],
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Welcome,',
                                    style: TextFontStyle.welcome),
                                TextSpan(
                                    text: storage.read(kKeyDisplayName),
                                    style: TextFontStyle.customerName),
                              ],
                            ),
                          ),
                        ),
                ],
              )),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: IconButton(
            onPressed: () {
              // Navigator.pushNamed(context, Routes.navigation,
              //     arguments: const ServiceScreen());
            },
            icon: SvgPicture.asset(AssetIcons.logout),
          ),
        ),
      ],
      // flexibleSpace: ClipPath(
      //     clipper: MyAppBarClipper(),
      //     child: Container(
      //       decoration: const BoxDecoration(
      //         gradient: LinearGradient(
      //             begin: Alignment.topLeft,
      //             end: Alignment.bottomRight,
      //             stops: [
      //               0.55,
      //               0.62,
      //             ],
      //             colors: [
      //               AppColors.beginGradient,
      //               AppColors.endGradient,
      //             ]),
      //       ),
      //     )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
