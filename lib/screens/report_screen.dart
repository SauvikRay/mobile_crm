import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_crm/constants/app_constants.dart';
import 'package:mobile_crm/constants/appcolors.dart';
import 'package:mobile_crm/controller/change_appbar_name.dart';
import 'package:mobile_crm/helpers/all_routes.dart';
import 'package:mobile_crm/helpers/navigation-services.dart';

import '../constants/text_font_style.dart';
import '../constants/ui_helpers.dart';
import '../networks/api_acess.dart';
import '../widgets/balance_due_dialouge.dart';
import '../widgets/ledger_dialouge.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  final TextEditingController _groupPopupValueController =
      TextEditingController();
  @override
  void initState() {
    getIgRXobj.fetcIgDataData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Reports',
                    style: TextFontStyle.welcome,
                  ),
                ),
                UIHelper.verticalSpaceMedium,
                Card(
                  elevation: 2,
                  child: Column(
                    children: [
                      UIHelper.verticalSpaceSmall,
                      const Divider(
                        color: AppColors.secondaryColor,
                        thickness: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 15.w),
                        child: Column(children: [
                          MaterialButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              NavigationService.navigateTo(Routes.salesReport);

                              appbarName(
                                'Sales Report',
                                AssetIcons.sales.toString(),
                                context,
                              );

                              SystemChrome.setPreferredOrientations(
                                  [DeviceOrientation.landscapeLeft]);
                            },
                            child: Row(children: [
                              SvgPicture.asset(
                                AssetIcons.sales,
                                color: Colors.black,
                              ),
                              UIHelper.horizontalSpaceSmall,
                              Text(
                                'Sales Report',
                                style: TextFontStyle.buttonBoldStyle
                                    .copyWith(color: Colors.black),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15.sp,
                              )
                            ]),
                          ),
                          const Divider(
                            color: AppColors.secondaryColor,
                            thickness: 1,
                          ),
                          MaterialButton(
                            padding: EdgeInsets.zero,
                            onPressed: () async {
                              await showDialog(
                                context: context,
                                builder: (context) => const LedgerDialoge(),
                              );

                              appbarName(
                                'Ledger Report',
                                AssetIcons.ledger.toString(),
                                context,
                              );

                              SystemChrome.setPreferredOrientations(
                                  [DeviceOrientation.landscapeLeft]);
                            },
                            child: Row(children: [
                              SvgPicture.asset(
                                AssetIcons.ledger,
                                color: Colors.black,
                              ),
                              UIHelper.horizontalSpaceSmall,
                              Text(
                                'Ledger Report',
                                style: TextFontStyle.buttonBoldStyle
                                    .copyWith(color: Colors.black),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15.sp,
                              )
                            ]),
                          ),
                          const Divider(
                            color: AppColors.secondaryColor,
                            thickness: 1,
                          ),
                          MaterialButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              NavigationService.navigateTo(Routes.reportsTable);

                              appbarName(
                                'Outstanding Report',
                                AssetIcons.outstanding.toString(),
                                context,
                              );

                              SystemChrome.setPreferredOrientations(
                                  [DeviceOrientation.landscapeLeft]);
                            },
                            child: Row(children: [
                              SvgPicture.asset(
                                AssetIcons.outstanding,
                                color: Colors.black,
                              ),
                              UIHelper.horizontalSpaceSmall,
                              Text(
                                'Outstanding Report',
                                style: TextFontStyle.buttonBoldStyle
                                    .copyWith(color: Colors.black),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15.sp,
                              )
                            ]),
                          ),
                          const Divider(
                            color: AppColors.secondaryColor,
                            thickness: 1,
                          ),
                          MaterialButton(
                            padding: EdgeInsets.zero,
                            onPressed: () async {
                              await showDialog(
                                context: context,
                                builder: (context) => const BalanceDueDialoge(),
                              );

                              //  SizedBox(
                              //       height: 500,
                              //       width: 200,
                              //       child: CategoryGroupPopupWidget(
                              //         categorygroupPopupText:
                              //             _groupPopupValueController,
                              //         value:
                              //             _groupPopupValueController.text,
                              //       ),
                              //     ));

                              // NavigationService.navigateTo(
                              //     Routes.reportsPreSelect);

                              // appbarName(
                              //   'Balance Due',
                              //   AssetIcons.balanceDue.toString(),
                              //   context,
                              // );

                              // SystemChrome.setPreferredOrientations(
                              //     [DeviceOrientation.landscapeLeft]);
                            },
                            child: Row(children: [
                              SvgPicture.asset(
                                AssetIcons.balanceDue,
                                color: Colors.black,
                              ),
                              UIHelper.horizontalSpaceSmall,
                              Text(
                                'Balance Due',
                                style: TextFontStyle.buttonBoldStyle
                                    .copyWith(color: Colors.black),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15.sp,
                              )
                            ]),
                          ),
                          const Divider(
                            color: AppColors.secondaryColor,
                            thickness: 1,
                          ),
                          MaterialButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              NavigationService.navigateTo(Routes.reportsTable);

                              appbarName(
                                'Add Receipt',
                                AssetIcons.receipt.toString(),
                                context,
                              );

                              SystemChrome.setPreferredOrientations(
                                  [DeviceOrientation.landscapeLeft]);
                            },
                            child: Row(children: [
                              SvgPicture.asset(
                                AssetIcons.receipt,
                                color: Colors.black,
                              ),
                              UIHelper.horizontalSpaceSmall,
                              Text(
                                'Add Receipt',
                                style: TextFontStyle.buttonBoldStyle
                                    .copyWith(color: Colors.black),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15.sp,
                              )
                            ]),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
