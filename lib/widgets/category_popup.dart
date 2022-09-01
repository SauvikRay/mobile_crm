import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/multiple_marked_dates.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mobile_crm/networks/api_acess.dart';
import 'package:mobile_crm/widgets/loading_indicators.dart';

import '../constants/app_constants.dart';
import '../constants/appcolors.dart';
import '../constants/text_font_style.dart';
import '../controller/change_appbar_name.dart';
import '../helpers/all_routes.dart';
import '../helpers/navigation-services.dart';
import 'lable_text_button.dart';

// ignore: must_be_immutable
class CategoryGroupPopupWidget extends StatefulWidget {
  CategoryGroupPopupWidget({Key? key, this.categorygroupPopupText, this.value})
      : super(key: key);

  TextEditingController? categorygroupPopupText;
  String? value;

  @override
  State<CategoryGroupPopupWidget> createState() =>
      _CategoryGroupPopupWidgetState();
}

class _CategoryGroupPopupWidgetState extends State<CategoryGroupPopupWidget> {
  final DateTime _currentDate = DateTime.now();
  final TextEditingController selectDateControler = TextEditingController();
  DateTime? selectedDate;
  String dateTo = '';
  final EventList<Event> _markedDateMap = EventList<Event>(
    events: {},
  );
  final _popUpGlobalkey = GlobalKey<PopupMenuButtonState<dynamic>>();
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
        selectDateControler.text = dateTo!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 500,
        width: 500,
        child: ListView(
          shrinkWrap: true,
          children: [
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
                    SizedBox(
                      width: 10,
                    ),
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.greenColor),
                  borderRadius: BorderRadius.circular(5)),
              child: GestureDetector(
                onTap: () {
                  _popUpGlobalkey.currentState!.showButtonMenu();
                },
                child: StreamBuilder(
                  stream: getIgRXobj.getIgData,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      List<dynamic> data = snapshot.data["IGName"];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            widget.value ?? "Select Group",
                            style: TextFontStyle.popUpselectedText
                                .copyWith(color: Colors.black),
                          ),
                          PopupMenuButton<Map>(
                            key: _popUpGlobalkey,
                            icon: const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Colors.black,
                            ),
                            iconSize: 25.r,
                            onSelected: (Map val) {
                              setState(() {
                                //     int categoriesID = val["id"];
                                widget.value = val["name"];
                                //     getShopSubCategoryPopUpListRXobj
                                //         .fetchSubCategoryData(categoriesID.toString());
                                //     widget.categorygroupPopupText.text =
                                //         categoriesID.toString();
                                //     log("The id is ${val["id"]}");
                                //
                              });
                            },
                            color: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                            // position: PopupMenuPosition.over,
                            offset: const Offset(-220, 0),
                            itemBuilder: (context) => List.generate(
                              growable: true,
                              data.length,
                              (index) => PopupMenuItem(
                                value: {
                                  "id": data[index]["IGName"],
                                  "name": data[index]["IGName"]
                                },
                                child: Text(
                                  data[index]["IGName"],
                                  style: TextFontStyle.popUpselectedText
                                      .copyWith(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: loadingIndicatorCircle(context: context),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            ),
            LabelTextButton(
                onCallBack: () {
                  NavigationService.goBack;
                  NavigationService.navigateTo(Routes.reportsPreSelect);

                  appbarName(
                    'Balance Due',
                    AssetIcons.balanceDue.toString(),
                    context,
                  );

                  SystemChrome.setPreferredOrientations(
                      [DeviceOrientation.landscapeLeft]);
                },
                text: 'Show Report'),
          ],
        ),
      ),
    );
  }
}
