import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../constants/app_constants.dart';
import '../constants/appcolors.dart';
import '../constants/text_font_style.dart';
import '../constants/ui_helpers.dart';
import '../controller/change_appbar_name.dart';
import '../helpers/all_routes.dart';
import '../helpers/navigation-services.dart';
import '../networks/api_acess.dart';
import 'category_popup.dart';
import 'custom_button.dart';

class LedgerDialoge extends StatefulWidget {
  const LedgerDialoge({Key? key}) : super(key: key);

  @override
  State<LedgerDialoge> createState() => _LedgerDialogeState();
}

class _LedgerDialogeState extends State<LedgerDialoge> {
  final TextEditingController _groupPopupValueController =
      TextEditingController();

  final storage = GetStorage();
  final DateTime _currentDate = DateTime.now();
  final TextEditingController selectDateControler = TextEditingController();
  DateTime? selectedDate;
  String dateTo = '';

  Future<void> to(BuildContext dobContext) async {
    final DateTime? picked = await showDatePicker(
      useRootNavigator: true,
      context: dobContext,
      initialDate: _currentDate,
      firstDate: DateTime(2015),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _currentDate) {
      setState(() {
        selectedDate = picked;
        dateTo = DateFormat('yyyyMMdd').format(selectedDate!);
        selectDateControler.text = dateTo;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: .85.sw,
        height: .85.sw,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: .27.sh, maxWidth: .38.sw),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // SvgPicture.asset(AssetIcons.i),
              Text(
                'Show Your Ledger Report',
                style: TextFontStyle.headline1BoldStyle
                    .copyWith(color: Colors.black),
              ),
              UIHelper.verticalSpaceMedium,

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.greenColor),
                    borderRadius: BorderRadius.circular(5)),
                child: InkWell(
                  onTap: () {
                    to(context);
                  },
                  child: Row(
                    children: [
                      Text(
                        dateTo.isEmpty ? 'From Date' : dateTo,
                        style: TextStyle(color: AppColors.greenColor),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          to(context);
                        },
                        child: Icon(Icons.calendar_today),
                      ),
                    ],
                  ),
                ),
              ),
              UIHelper.verticalSpaceMedium,

              // CategoryGroupPopupWidget(
              //   categorygroupPopupText: _groupPopupValueController,
              //   value: _groupPopupValueController.text,
              // ),
              UIHelper.verticalSpaceMedium,

              //Gravar Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customeButton(
                      name: 'Ledger Report',
                      onCallBack: () async {
                        if (selectDateControler.text.isNotEmpty) {
                          await getLedgerReportRxobj.fetchLedgerReportData(
                              selectDateControler.text, 0);

                          NavigationService.goBack;
                          NavigationService.navigateTo(Routes.ledgerReport);

                          appbarName(
                            'Ledger Report',
                            AssetIcons.ledger.toString(),
                            context,
                          );

                          SystemChrome.setPreferredOrientations(
                              [DeviceOrientation.landscapeLeft]);
                        } else {
                          ScaffoldMessenger.of(NavigationService.context)
                              .showSnackBar(const SnackBar(
                            backgroundColor: Colors.redAccent,
                            content: Text(
                              'Select your Date',
                              style: TextStyle(color: Colors.white),
                            ),
                          ));
                        }
                      },
                      height: 30.h,
                      minWidth: 130.w,
                      borderRadius: 8.r,
                      color: AppColors.primaryColor,
                      textStyle: TextFontStyle.headline2BoldStyle
                          .copyWith(color: Colors.white),
                      context: context),
                  UIHelper.horizontalSpaceSmall,
                  //Cancele
                  customeButton(
                      onCallBack: () {
                        setState(() {
                          dateTo = '';
                        });
                      },
                      name: 'Clear',
                      height: 30.h,
                      minWidth: 100.w,
                      borderRadius: 8.r,
                      color: Colors.redAccent,
                      textStyle: TextFontStyle.headline2BoldStyle
                          .copyWith(color: Colors.white),
                      context: context),
                  //Cancelar
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
