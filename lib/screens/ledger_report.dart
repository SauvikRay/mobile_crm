import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_crm/constants/app_constants.dart';
import 'package:mobile_crm/constants/text_font_style.dart';
import 'package:mobile_crm/constants/ui_helpers.dart';
import 'package:mobile_crm/networks/api_acess.dart';
import 'package:mobile_crm/widgets/app_bar_widget.dart';
import 'package:mobile_crm/widgets/lable_text_button.dart';

import '../constants/appcolors.dart';
import '../widgets/custome_table.dart';

class LedgerReport extends StatefulWidget {
  const LedgerReport({Key? key}) : super(key: key);

  @override
  State<LedgerReport> createState() => _LedgerReportState();
}

class _LedgerReportState extends State<LedgerReport> {
  List<dynamic> items = [];
  @override
  void initState() {
    getLedgerReportRxobj.getLedgerReportData.first.then(
      (value) {
        setState(() {
          items = value['Ledger'];
        });
      },
    );
    super.initState();
  }

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
              // Row(
              //   children: [
              //     //For search
              //     Container(
              //       height: 35.h,
              //       width: 100.w,
              //       padding: EdgeInsets.symmetric(horizontal: 10.w),
              //       alignment: Alignment.centerRight,
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(5.r),
              //           border: Border.all(
              //               color: AppColors.secondaryColor, width: 0.5.h)),
              //       child: TextFormField(
              //         controller: _recordSearchController,
              //         decoration: const InputDecoration(
              //           hintText: 'Search Part Name',
              //           suffixIcon: Icon(
              //             Icons.search,
              //           ),
              //           border: InputBorder.none,
              //         ),
              //       ),
              //     ),
              //     UIHelper.horizontalSpaceMedium,
              //     Text(
              //       'From Date',
              //       style: TextFontStyle.cardhead,
              //     ),
              //     UIHelper.horizontalSpaceSmall,
              //     IconButton(
              //       icon: SvgPicture.asset(
              //         AssetIcons.calender,
              //         color: AppColors.secondaryColor,
              //       ),
              //       onPressed: () {},
              //     ),
              //     UIHelper.horizontalSpaceMedium,
              //     Text(
              //       'To Date',
              //       style: TextFontStyle.cardhead,
              //     ),
              //     UIHelper.horizontalSpaceSmall,
              //     IconButton(
              //       icon: SvgPicture.asset(
              //         AssetIcons.calender,
              //         color: AppColors.secondaryColor,
              //       ),
              //       onPressed: () {},
              //     ),
              //     const Spacer(),
              //     LabelTextButton(
              //       onCallBack: () {},
              //       text: 'Submit',
              //     ),
              //   ],
              // ),

              UIHelper.verticalSpaceMedium,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: AppColors.scaffoldColor),
                  child: DataTable(
                    columnSpacing: .09.sw,
                    headingTextStyle: TextFontStyle.cardhead.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                    headingRowColor:
                        MaterialStateProperty.all(AppColors.primaryColor),
                    //columnSpacing: 32.w,
                    dataRowHeight: 80.h,
                    horizontalMargin: 15,
                    dividerThickness: 1,
                    dataTextStyle:
                        TextFontStyle.cardhead.copyWith(color: Colors.black),
                    border: TableBorder(
                      horizontalInside: BorderSide.lerp(
                          const BorderSide(color: Colors.black12),
                          const BorderSide(color: Colors.black12),
                          10),
                    ),
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text('SNo.',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left),
                      ),
                      DataColumn(
                        label: Text('Ledger',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left),
                      ),
                      DataColumn(
                        label: Text('Amount',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left),
                      ),
                    ],
                    rows: items
                        .map((items) => DataRow(cells: [
                              DataCell(Text(items['SNo'])),
                              DataCell(Text(items['Ledger'])),
                              DataCell(Text(items['Amount'])),
                            ]))
                        .toList(),
                  ),
                ),
              ),

              UIHelper.verticalSpaceMedium,
            ],
          )),
        ),
      ),
    );
  }
}
