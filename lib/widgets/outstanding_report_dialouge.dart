import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:mobile_crm/widgets/party_name_list_popup.dart';

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

class OutstandingReportDialoge extends StatefulWidget {
  const OutstandingReportDialoge({Key? key}) : super(key: key);

  @override
  State<OutstandingReportDialoge> createState() =>
      _OutstandingReportDialogeState();
}

class _OutstandingReportDialogeState extends State<OutstandingReportDialoge> {
  final TextEditingController _groupPopupValueController =
      TextEditingController();

  final storage = GetStorage();
  final DateTime _currentDate = DateTime.now();
  final TextEditingController selectFromDateControler = TextEditingController();
  final TextEditingController selectToDateControler = TextEditingController();
  DateTime? selectedDate;
  String dateFrom = '';
  String dateTo = '';

  Future<void> from(BuildContext dobContext) async {
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
        dateFrom = DateFormat('yyyy-MM-dd').format(selectedDate!);
        selectToDateControler.text = dateFrom;
      });
    }
  }

  //To date
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
        dateTo = DateFormat('yyyy-MM-dd').format(selectedDate!);
        selectFromDateControler.text = dateTo;
      });
    }
  }

  @override
  void initState() {
    fetchPartyListFromApi();
    // getPartyNameListRxobj.getPartyNameListData.first.then(
    //   ((value) {
    //     items = value['Dashboard'];
    //     log(items.toString());
    //   }),
    // );
    super.initState();
  }

  fetchPartyListFromApi() async {
    await getPartyNameListRxobj.fetchPartyNameListData(0, '');
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: .85.sw, maxWidth: .85.sw),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // SvgPicture.asset(AssetIcons.i),
              Text(
                'Show Your Outstanding Report',
                style: TextFontStyle.headline1BoldStyle
                    .copyWith(color: Colors.black),
              ),
              UIHelper.verticalSpaceMedium,
              //From Date
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        from(context);
                      },
                      child: Row(
                        children: [
                          Text(
                            dateFrom.isEmpty ? 'From Date' : dateFrom,
                            style: const TextStyle(color: AppColors.greenColor),
                          ),
                          UIHelper.horizontalSpaceSmall,
                          const Icon(Icons.calendar_today),
                        ],
                      ),
                    ),
                  ),

                  //To Date
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        to(context);
                      },
                      child: Row(
                        children: [
                          Text(
                            dateTo.isEmpty ? 'To Date' : dateTo,
                            style: TextStyle(color: AppColors.greenColor),
                          ),
                          UIHelper.horizontalSpaceSmall,
                          const Icon(Icons.calendar_today),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              UIHelper.verticalSpaceMedium,

              UIHelper.verticalSpaceMedium,

              PartyNameListPopupWidget(
                partyNameListPopupText: _groupPopupValueController,
                value: _groupPopupValueController.text,
              ),
              UIHelper.verticalSpaceMedium,

              //Gravar Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customeButton(
                      name: 'Show Report',
                      onCallBack: () async {
                        // log(_groupPopupValueController.text);
                        // log(selectFromDateControler.text);
                        // log(selectToDateControler.text);
                        if (_groupPopupValueController.text.isNotEmpty &&
                            selectToDateControler.text.isNotEmpty &&
                            selectFromDateControler.text.isNotEmpty) {
                          await getOutStandingReportRXobj
                              .fetchOutStandingReportData(
                            _groupPopupValueController.text,
                            selectToDateControler.text,
                            selectFromDateControler.text,
                          );

                          NavigationService.goBack;
                          NavigationService.navigateTo(
                              Routes.outstandingReportReport);

                          appbarName(
                            'Outstanding Report',
                            AssetIcons.outstanding,
                            context,
                          );

                          SystemChrome.setPreferredOrientations(
                              [DeviceOrientation.landscapeLeft]);
                        } else {
                          ScaffoldMessenger.of(NavigationService.context)
                              .showSnackBar(const SnackBar(
                            backgroundColor: Colors.redAccent,
                            content: Text(
                              'Select your Date and Party Id.',
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
                          _groupPopupValueController.text.isEmpty;
                          selectToDateControler.text.isEmpty;
                          selectFromDateControler.text.isEmpty;
                          dateFrom = '';
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
