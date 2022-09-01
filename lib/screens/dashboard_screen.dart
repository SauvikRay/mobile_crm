import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_crm/constants/app_constants.dart';
import 'package:mobile_crm/constants/appcolors.dart';
import 'package:mobile_crm/constants/text_font_style.dart';
import 'package:mobile_crm/constants/ui_helpers.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              // shrinkWrap: true,
              // scrollDirection: Axis.vertical,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Dashboard',
                    style: TextFontStyle.welcome,
                  ),
                ),
                UIHelper.verticalSpaceLarge,
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: BarChart(
                    BarChartData(
                        borderData: FlBorderData(
                          border: const Border(
                            top: BorderSide.none,
                            right: BorderSide.none,
                            left: BorderSide(width: 1),
                            bottom: BorderSide(width: 1),
                          ),
                        ),
                        groupsSpace: 10,
                        // titlesData:FlTitlesData(bottomTitles:' month' ) ,
                        barGroups: [
                          BarChartGroupData(x: 1, barsSpace: 10, barRods: [
                            BarChartRodData(
                                toY: 10, width: 15, color: Colors.amber),
                            BarChartRodData(
                                toY: 5, width: 15, color: Colors.red),
                            BarChartRodData(
                                toY: 6, width: 15, color: Colors.green),
                            BarChartRodData(
                                toY: 7, width: 15, color: Colors.yellowAccent),
                            BarChartRodData(
                                toY: 8, width: 15, color: Colors.redAccent),
                            BarChartRodData(
                                toY: 9, width: 15, color: Colors.black12),
                            BarChartRodData(
                                toY: 2, width: 15, color: Colors.blue),
                          ])
                        ]),
                  ),
                ),
                UIHelper.verticalSpaceMedium,

                // const DashBoardCard(),
                SizedBox(
                  height: 150.h,
                  child: ListView.separated(
                    // physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 4,
                    separatorBuilder: (BuildContext context, index) =>
                        UIHelper.horizontalSpaceMedium,
                    itemBuilder: (BuildContext context, index) {
                      return const DashBoardCard();
                    },
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

class DashBoardCard extends StatelessWidget {
  const DashBoardCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        width: .60.sw,
        height: .35.sw,
        child: Column(
          children: [
            Text(
              'Total Sales',
              style: TextFontStyle.cardhead,
            ),
            UIHelper.verticalSpaceMedium,
            Text(
              '₹ 400,980',
              style: TextFontStyle.bigAmount,
            ),
            UIHelper.verticalSpaceMedium,
            Row(
              children: [
                SvgPicture.asset(
                  AssetIcons.graphline,
                  height: 15.sp,
                  width: 15.sp,
                ),
                UIHelper.horizontalSpaceSmall,
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: '+12.9% ',
                        style: TextFontStyle.cardhead
                            .copyWith(color: AppColors.greenColor)),
                    TextSpan(
                        text: 'than last 6 month',
                        style: TextFontStyle.cardhead
                            .copyWith(color: Colors.black)),
                  ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
