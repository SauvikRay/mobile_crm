import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/appcolors.dart';
import '../constants/text_font_style.dart';
import '../constants/ui_helpers.dart';
import '../widgets/custome_textfild.dart';
import '../widgets/lable_text_button.dart';
import '../widgets/popup_group_widget.dart';

class Transaction extends StatefulWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  TextEditingController _groupPopupValueController = TextEditingController();
  TextEditingController _groupPopupTextController = TextEditingController();
  TextEditingController _productTextController = TextEditingController();

  String dropdownIntialVal = 'Select';
  late int selectedIndex;
  List<DropdownMenuItem<String>> dropdownMenuItem = List.generate(
    5,
    (index) => DropdownMenuItem(
      child: Text('Item $index'),
      value: index.toString(),
    ),
  );

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
                        'Transaction',
                        style: TextFontStyle.welcome,
                      ),
                    ),
                    UIHelper.verticalSpaceMedium,
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 15.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Select Customer',
                              style: TextFontStyle.cardhead,
                            ),
                            UIHelper.verticalSpaceSmall,
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5.w,
                              ),
                              height: 45.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: AppColors.secondaryColor,
                                      width: 0.5)),
                              child: GroupPopupWidget(
                                groupPopupText: _groupPopupValueController,
                                value: _groupPopupTextController.text,
                              ),
                            ),
                            UIHelper.verticalSpaceMedium,
                            Text(
                              'Select Products',
                              style: TextFontStyle.cardhead,
                            ),
                            UIHelper.verticalSpaceSmall,

                            // DropdownButton(
                            //   isExpanded: true,
                            //   value: dropdownIntialVal,
                            //   icon: const Icon(Icons.keyboard_arrow_down),
                            //   items: dropdownMenuItem,
                            //   onChanged: (String? value) {
                            //     setState(() {
                            //       dropdownIntialVal = value!;
                            //       // selectedIndex = dropdownMenuItem.indexWhere(
                            //       //   (element) => element.value == value,
                            //       // );
                            //     });
                            //   },
                            // ),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: CustomTextFormField(
                                    inputType: TextInputType.text,
                                    fieldHeight: 40.h,
                                    maxline: 2,
                                    textEditingController:
                                        _productTextController,
                                    labelText: 'Select',
                                    hintText: 'Select Product',
                                  ),
                                ),
                                UIHelper.horizontalSpaceSmall,
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.add_circle_outline,
                                      size: 20.sp,
                                      color: Colors.amber[900],
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                            UIHelper.verticalSpaceMedium,
                          ],
                        ),
                      ),
                    ),
                    UIHelper.verticalSpaceMedium,
                    LabelTextButton(
                      width: double.infinity,
                      height: 0.1.sw,
                      icon: Icon(
                        Icons.add_circle_outline,
                        size: 20.sp,
                      ),
                      onCallBack: () {},
                      text: 'Add order',
                    ),
                  ]),
            )),
      ),
    );
  }
}
