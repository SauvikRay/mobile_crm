import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/appcolors.dart';
import '../constants/text_font_style.dart';
import '../constants/ui_helpers.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
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
                      'Products',
                      style: TextFontStyle.welcome,
                    ),
                  ),
                  UIHelper.verticalSpaceMedium,
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 15.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 10.w),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.secondaryColor,
                                          width: .5)),
                                  child: Image.network(
                                    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
                                    height: 120,
                                    width: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Cosmos Lac Chalk Matte Spray',
                                  overflow: TextOverflow.visible,
                                  style: TextFontStyle.welcome,
                                ),
                                Text(
                                  'Impressive extreme matte finish / retro finish in the most easiest and creative way...',
                                  overflow: TextOverflow.visible,
                                  style: TextFontStyle.productDetails,
                                ),
                                Text(
                                  '₹449.00',
                                  overflow: TextOverflow.visible,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
