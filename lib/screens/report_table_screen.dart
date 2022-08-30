import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_crm/constants/app_constants.dart';
import 'package:mobile_crm/constants/text_font_style.dart';
import 'package:mobile_crm/constants/ui_helpers.dart';
import 'package:mobile_crm/widgets/app_bar_widget.dart';
import 'package:mobile_crm/widgets/lable_text_button.dart';

import '../constants/appcolors.dart';
import '../widgets/custome_table.dart';

class ReportsTable extends StatefulWidget {
  const ReportsTable({Key? key}) : super(key: key);

  @override
  State<ReportsTable> createState() => _ReportsTableState();
}

class _ReportsTableState extends State<ReportsTable> {
  final TextEditingController _recordSearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const MainAppBarWidget(),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
          child: SingleChildScrollView(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  //For search
                  Container(
                    height: 35.h,
                    width: 100.w,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(
                            color: AppColors.secondaryColor, width: 0.5.h)),
                    child: TextFormField(
                      controller: _recordSearchController,
                      decoration: const InputDecoration(
                        hintText: 'Search Part Name',
                        suffixIcon: Icon(
                          Icons.search,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  UIHelper.horizontalSpaceMedium,
                  Text(
                    'From Date',
                    style: TextFontStyle.cardhead,
                  ),
                  UIHelper.horizontalSpaceSmall,
                  IconButton(
                    icon: SvgPicture.asset(
                      AssetIcons.calender,
                      color: AppColors.secondaryColor,
                    ),
                    onPressed: () {},
                  ),
                  UIHelper.horizontalSpaceMedium,
                  Text(
                    'To Date',
                    style: TextFontStyle.cardhead,
                  ),
                  UIHelper.horizontalSpaceSmall,
                  IconButton(
                    icon: SvgPicture.asset(
                      AssetIcons.calender,
                      color: AppColors.secondaryColor,
                    ),
                    onPressed: () {},
                  ),
                  const Spacer(),
                  LabelTextButton(
                    onCallBack: () {},
                    text: 'Submit',
                  ),
                ],
              ),
              UIHelper.verticalSpaceMedium,
              CustomTable(),
              Row(
                children: [
                  Spacer(),
                  Text('Total'),
                  UIHelper.horizontalSpaceMedium,
                  UIHelper.horizontalSpaceMedium,
                  Text('10000'),
                  UIHelper.horizontalSpaceMedium,
                  UIHelper.horizontalSpaceMedium,
                  UIHelper.horizontalSpaceMedium,
                  UIHelper.horizontalSpaceMedium,
                  Text('5000'),
                  UIHelper.horizontalSpaceMedium,
                  UIHelper.horizontalSpaceMedium,
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}
