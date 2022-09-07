import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_crm/constants/app_constants.dart';
import 'package:mobile_crm/constants/appcolors.dart';
import 'package:mobile_crm/constants/text_font_style.dart';
import 'package:mobile_crm/constants/ui_helpers.dart';
import 'package:mobile_crm/networks/api_acess.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  final Color leftBarColor = const Color(0xff53fdd7);
  final Color rightBarColor = const Color(0xffff5182);
  final double width = 7;
  @override
  void initState() {
    getBarChartData();

    final barGroup1 = makeGroupData(0, 5);
    final barGroup2 = makeGroupData(1, 16);
    final barGroup3 = makeGroupData(2, 18);
    final barGroup4 = makeGroupData(3, 20);
    final barGroup5 = makeGroupData(4, 17);
    final barGroup6 = makeGroupData(5, 19);
    final barGroup7 = makeGroupData(6, 11);
    final barGroup8 = makeGroupData(7, 15);
    final barGroup9 = makeGroupData(8, 16);
    final barGroup10 = makeGroupData(9, 20);
    final barGroup11 = makeGroupData(10, 15);
    final barGroup12 = makeGroupData(11, 10);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
      barGroup8,
      barGroup9,
      barGroup10,
      barGroup11,
      barGroup12,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
    super.initState();
  }

  List dashboard = [];
  List<String> monthNo = [];
  String mNoToMonth = '';
  getBarChartData() {
    getDashBoardRXobj.getDashBoardData.first.then(
      (value) {
        dashboard = value['Dashboard'];
        log(dashboard.toString());
        for (var month in dashboard) {
          monthNo.add(month['MonthNo'].toString());
        }
        log(monthNo.toString());
      },
    );
  }

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
                  height: 350,
                  width: double.infinity,
                  child: StreamBuilder(
                      stream: getDashBoardRXobj.getDashBoardData,
                      builder: (context, snapshot) {
                        return BarChart(
                          BarChartData(
                            maxY: 20,
                            titlesData: FlTitlesData(
                              show: true,
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: bottomTitles,
                                  reservedSize: 42,
                                ),
                              ),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 28,
                                  interval: 1,
                                  getTitlesWidget: leftTitles,
                                ),
                              ),
                            ),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            barGroups: showingBarGroups,
                            gridData: FlGridData(show: false),
                          ),
                        );
                      }),
                ),
                UIHelper.verticalSpaceMedium,

                // const DashBoardCard(),
                SizedBox(
                  height: 150.h,
                  child: StreamBuilder(
                      stream: getDashBoardRXobj.getDashBoardData,
                      builder: (context, snapshot) {
                        return ListView.separated(
                          // physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: dashboard.length,
                          separatorBuilder: (BuildContext context, index) =>
                              UIHelper.horizontalSpaceMedium,
                          itemBuilder: (BuildContext context, index) {
                            return DashBoardCard(
                              map: dashboard[index],
                            );
                          },
                        );
                      }),
                ),

                UIHelper.verticalSpaceExtraLarge,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = '10K';
    } else if (value == 10) {
      text = '20K';
    } else if (value == 19) {
      text = '30K';
    } else if (value == 20) {
      text = '40K';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    List<String> titles = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];

    Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y1,
  ) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        toY: y1,
        color: leftBarColor,
        width: width,
      ),
    ]);
  }
}

// ignore: must_be_immutable
class DashBoardCard extends StatelessWidget {
  DashBoardCard({
    required this.map,
    Key? key,
  }) : super(key: key);
  Map<String, dynamic> map;
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
              // ignore: prefer_interpolation_to_compose_strings
              "₹ " + map["SaleValue"],
              style: TextFontStyle.bigAmount,
            ),
            UIHelper.verticalSpaceMedium,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SvgPicture.asset(
                //   AssetIcons.graphline,
                //   height: 15.sp,
                //   width: 15.sp,
                // ),
                UIHelper.horizontalSpaceSmall,
                Text(months[map["MonthNo"]]),
                UIHelper.horizontalSpaceSmall,
                Text(map["YearNo"].toString()),
                // RichText(
                //   text: TextSpan(children: [
                //     TextSpan(
                //         text: '+12.9% ',
                //         style: TextFontStyle.cardhead
                //             .copyWith(color: AppColors.greenColor)),
                //     TextSpan(
                //         text: 'than last 6 month',
                //         style: TextFontStyle.cardhead
                //             .copyWith(color: Colors.black)),
                //   ]),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
