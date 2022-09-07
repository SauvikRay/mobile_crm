// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_crm/screens/dashboard_screen.dart';

import '../constants/appcolors.dart';
import '../constants/text_font_style.dart';
import '../constants/ui_helpers.dart';
import '../networks/api_acess.dart';
import '../widgets/loading_indicators.dart';

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
                  StreamBuilder(
                      stream: getProductRXobj.getProductyData,
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          Map data = snapshot.data as Map;
                          List<dynamic> products = data["Products"];
                          return ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: products.length,
                            separatorBuilder: (BuildContext context, index) =>
                                UIHelper.horizontalSpaceMedium,
                            itemBuilder: (BuildContext context, index) {
                              return productWidget(
                                product: products[index],
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return const SizedBox.shrink();
                        }
                        return SizedBox(
                          height: MediaQuery.of(context).size.height - 100,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: loadingIndicatorCircle(context: context),
                          ),
                        );
                      }),
                ],
              ),
            )),
      ),
    );
  }
}

class productWidget extends StatelessWidget {
  productWidget({
    required this.product,
    Key? key,
  }) : super(key: key);
  Map product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Expanded(
            //   child: Column(
            //     children: [
            //       Container(
            //         padding:
            //             EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
            //         decoration: BoxDecoration(
            //             border: Border.all(
            //                 color: AppColors.secondaryColor, width: .5)),
            //         child: Image.network(
            //           'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
            //           height: 120,
            //           width: 120,
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product["ItName"] == null
                        ? ""
                        : "Name :" + product["ItName"] ?? "",
                    overflow: TextOverflow.visible,
                    style: TextFontStyle.welcome,
                  ),
                  Text(
                    product["ItemCaption"] == null
                        ? ""
                        : "Caption :" + product["ItemCaption"] ?? "",
                    overflow: TextOverflow.visible,
                    style: TextFontStyle.productDetails,
                  ),
                  Text(
                    product["GS"] == null ? "" : "GS :" + product["GS"] ?? "",
                    overflow: TextOverflow.visible,
                    style: TextFontStyle.productDetails,
                  ),
                  Text(
                    product["Price"] == null
                        ? ""
                        : '₹' + product["Price"] ?? "",
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
