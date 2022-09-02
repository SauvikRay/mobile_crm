import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/appcolors.dart';
import '../constants/text_font_style.dart';

class CustomTable extends StatelessWidget {
  const CustomTable({
    Key? key,
    // required this.items,
    // required this.numberController,
    // required int page,
  }) : super(key: key);

  // final List items;
  // final TextEditingController numberController;
  // final int _page;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: AppColors.scaffoldColor),
        child: DataTable(
            columnSpacing: .07.sw,
            headingTextStyle: TextFontStyle.cardhead.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            ),
            headingRowColor: MaterialStateProperty.all(AppColors.primaryColor),
            //columnSpacing: 32.w,
            dataRowHeight: 80.h,
            horizontalMargin: 15,
            dividerThickness: 1,
            dataTextStyle: TextFontStyle.cardhead.copyWith(color: Colors.black),
            border: TableBorder(
              horizontalInside: BorderSide.lerp(
                  const BorderSide(color: Colors.black12),
                  const BorderSide(color: Colors.black12),
                  10),
            ),
            columns: const <DataColumn>[
              DataColumn(
                label: Text('S. No.',
                    overflow: TextOverflow.ellipsis, textAlign: TextAlign.left),
              ),
              DataColumn(
                label: Text('Bill No.',
                    overflow: TextOverflow.ellipsis, textAlign: TextAlign.left),
              ),
              DataColumn(
                label: Text('Bdate',
                    overflow: TextOverflow.ellipsis, textAlign: TextAlign.left),
              ),
              DataColumn(
                label: Text('Agent',
                    overflow: TextOverflow.ellipsis, textAlign: TextAlign.left),
              ),
              DataColumn(
                label: Text('Party Name',
                    overflow: TextOverflow.ellipsis, textAlign: TextAlign.left),
              ),
              DataColumn(
                label: Text('CBill Amount',
                    overflow: TextOverflow.ellipsis, textAlign: TextAlign.left),
              ),
              DataColumn(
                label: Text('Export Val.',
                    overflow: TextOverflow.ellipsis, textAlign: TextAlign.left),
              ),
            ],
            rows: const <DataRow>[
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('B1')),
                DataCell(Text('7/21/2022')),
                DataCell(Text('AGENT 1')),
                DataCell(Text('Party 1')),
                DataCell(Text('1000')),
                DataCell(Text('0')),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('B1')),
                DataCell(Text('7/21/2022')),
                DataCell(Text('AGENT 1')),
                DataCell(Text('Party 1')),
                DataCell(Text('1000')),
                DataCell(Text('0')),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('B1')),
                DataCell(Text('7/21/2022')),
                DataCell(Text('AGENT 1')),
                DataCell(Text('Party 1')),
                DataCell(Text('1000')),
                DataCell(Text('0')),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('B1')),
                DataCell(Text('7/21/2022')),
                DataCell(Text('AGENT 1')),
                DataCell(Text('Party 1')),
                DataCell(Text('1000')),
                DataCell(Text('0')),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('B1')),
                DataCell(Text('7/21/2022')),
                DataCell(Text('AGENT 1')),
                DataCell(Text('Party 1')),
                DataCell(Text('1000')),
                DataCell(Text('0')),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('B1')),
                DataCell(Text('7/21/2022')),
                DataCell(Text('AGENT 1')),
                DataCell(Text('Party 1')),
                DataCell(Text('1000')),
                DataCell(Text('0')),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('B1')),
                DataCell(Text('7/21/2022')),
                DataCell(Text('AGENT 1')),
                DataCell(Text('Party 1')),
                DataCell(Text('1000')),
                DataCell(Text('0')),
              ]),
            ]

            // items
            //     .map((items) => DataRow(cells: [
            //           DataCell(RichText(
            //             text: TextSpan(
            //                 text: items['order_code'],
            //                 style: TextFontStyle.headline2BoldStyle
            //                     .copyWith(decoration: TextDecoration.underline),
            //                 recognizer: TapGestureRecognizer()
            //                   ..onTap = () async {
            //                     await getOrderDetailsRXobj
            //                         .fetchOrderDetailsData(items['order_code']);
            //                     String id = items['order_code'].toString();
            //                     locator<OrderId>().setOrderId = id;
            //                     NavigationService.navigateTo(
            //                         Routes.orderDetailScreen);
            //                   }),
            //           )),
            //           DataCell(Text(items['total_price'])),
            //           DataCell(Text(items['admin_income'])),
            //           //fa fa-shopping-bag
            //           DataCell(Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Row(
            //                 children: [
            //                   Icon(
            //                     FontAwesomeIcons.bagShopping,
            //                     size: 15.r,
            //                     color: AppColors.headLine1Color,
            //                   ),
            //                   UIHelper.horizontalSpace(10.h),
            //                   Text(
            //                     items['pickup_date_time'],
            //                   )
            //                 ],
            //               ),
            //               UIHelper.verticalSpaceSmall,
            //               Row(
            //                 children: [
            //                   Icon(
            //                     FontAwesomeIcons.motorcycle,
            //                     size: 15.r,
            //                     color: AppColors.penIconColor,
            //                   ),
            //                   UIHelper.horizontalSpace(10.h),
            //                   Text(items['expected_delivery_time'])
            //                 ],
            //               )
            //             ],
            //           )),
            //           DataCell(Column(
            //             crossAxisAlignment: CrossAxisAlignment.end,
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               OrderStatus(
            //                 title: "Order".tr,
            //                 status: "${items['status_text']}".tr,
            //                 statusType: StatusType.order,
            //                 statuscode: "${items['status']}",
            //               ),
            //               UIHelper.verticalSpace(5),
            //               OrderStatus(
            //                 title: "Delivery".tr,
            //                 status: "${items['delivery_status_text']}".tr,
            //                 statuscode: "${items['delivery_status']}",
            //                 statusType: StatusType.delivery,
            //               ),
            //               UIHelper.verticalSpace(2),
            //               OrderStatus(
            //                 status: "Invoiced".tr,
            //                 statusType: StatusType.order,
            //                 statuscode: OrderStatusNo.kCANCELLED,
            //               ),
            //               UIHelper.verticalSpace(2),
            //               Row(
            //                 crossAxisAlignment: CrossAxisAlignment.center,
            //                 //mainAxisAlignment: MainAxisAlignment.end,
            //                 children: [
            //                   Text(
            //                     "Status : ".tr,
            //                     style: TextFontStyle.headline2BoldStyle,
            //                   ),
            //                   const Spacer(),
            //                   if (items['status'] == 10)
            //                     IconButton(
            //                       iconSize: 20.r,
            //                       icon: FaIcon(
            //                           color: Color(0xFF21a5c2),
            //                           FontAwesomeIcons.circleNotch),
            //                       onPressed: () {
            //                         int record =
            //                             int.parse(numberController.value.text);
            //                         showDialog(
            //                           context: context,
            //                           builder: (BuildContext context) =>
            //                               productStatusButtonDialouge(
            //                             context,
            //                             orderno: items['order_code'],
            //                             stausNo: 20,
            //                             page: _page,
            //                             record: record,
            //                           ),
            //                         );
            //                       },
            //                     ),
            //                   if (items['status'] == 10 || items['status'] == 20)
            //                     IconButton(
            //                       iconSize: 25.r,
            //                       icon: FaIcon(
            //                           color: Color(0xFF5ad092),
            //                           FontAwesomeIcons.check),
            //                       onPressed: () {
            //                         int record =
            //                             int.parse(numberController.value.text);
            //                         showDialog(
            //                           context: context,
            //                           builder: (BuildContext context) =>
            //                               productStatusButtonDialouge(
            //                             context,
            //                             orderno: items['order_code'],
            //                             stausNo: 21,
            //                             page: _page,
            //                             record: record,
            //                           ),
            //                         );
            //                       },
            //                     ),
            //                   if (items['status'] != 10 && items['status'] != 20)
            //                     const Text("N/A")
            //                 ],
            //               ),
            //             ],
            //           )),
            //           DataCell(Text(items['created_at_new'])),
            //           DataCell(InkWell(
            //             onTap: () async {
            //               await getOrderDetailsRXobj
            //                   .fetchOrderDetailsData(items['order_code']);
            //               String id = items['order_code'].toString();
            //               locator<OrderId>().setOrderId = id;
            //               NavigationService.navigateTo(Routes.orderDetailScreen);
            //             },
            //             child: Icon(
            //               Icons.remove_red_eye_outlined,
            //               size: 25.sp,
            //               color: AppColors.penIconColor,
            //             ),
            //           )),
            //         ]))
            //     .toList(),
            ),
      ),
    );
  }
}

// Widget productStatusButtonDialouge(BuildContext context,
//     {String? orderno, int? stausNo, int? record, int? page}) {
//   OrderType order = locator<OrderType>();

//   return SizedBox(
//     child: Dialog(
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),

//         // height: 400.h,
//         child: ConstrainedBox(
//           constraints: BoxConstraints(maxHeight: .27.sh, maxWidth: .38.sw),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               SvgPicture.asset(AssetIcons.i),
//               Text(
//                 'Are you sure?',
//                 style: TextFontStyle.headline1BoldStyle
//                     .copyWith(color: Colors.black),
//               ),
//               UIHelper.verticalSpaceMedium,
//               Text(
//                 'You won\'t be able to revert this! ?',
//                 style: TextFontStyle.headline2BoldStyle,
//               ),
//               UIHelper.verticalSpaceMedium,

//               //Gravar Button
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   customeButton(
//                       name: 'No',
//                       onCallBack: () {
//                         NavigationService.goBack;
//                       },
//                       height: 30.h,
//                       minWidth: 130.w,
//                       borderRadius: 8.r,
//                       color: AppColors.primaryColor,
//                       textStyle: TextFontStyle.headline2BoldStyle
//                           .copyWith(color: AppColors.white),
//                       context: context),
//                   UIHelper.horizontalSpaceSmall,
//                   //Cancelar
//                   customeButton(
//                       name: 'Yes',
//                       onCallBack: () async {
//                         if (orderno != null) {
//                           await postOrderStatusRXobj.postOrderStatus(
//                               orderno, stausNo!);
//                           await getOrdersRXobj.fetchOrderData(
//                               order.getorderStaus,
//                               record: record!,
//                               page: page!);
//                         }
//                         NavigationService.goBack;
//                       },
//                       height: 30.h,
//                       minWidth: 130.w,
//                       borderRadius: 8.r,
//                       color: AppColors.headLine1Color,
//                       textStyle: TextFontStyle.headline2BoldStyle
//                           .copyWith(color: AppColors.white),
//                       context: context),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );


// }
