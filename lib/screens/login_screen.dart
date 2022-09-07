import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import '../constants/appcolors.dart';
import '../helpers/helpers.dart';
import '../widgets/custom_button.dart';
import '/constants/app_constants.dart';
import '/constants/text_font_style.dart';
import '/constants/ui_helpers.dart';
import '/networks/api_acess.dart';

class LogeinScreen extends StatefulWidget {
  const LogeinScreen({Key? key}) : super(key: key);

  @override
  State<LogeinScreen> createState() => _LogeinScreenState();
}

class _LogeinScreenState extends State<LogeinScreen> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController acceKeyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? emailvalidation;
  bool validation = false;

  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();

    return SafeArea(
      child: Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                AssetIcons.loginbackground,
              ),
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: .15.sw),
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //     colors: [
            //       Colors.black.withOpacity(0.6),
            //       Colors.black.withOpacity(0.6),
            //     ],
            //   ),
            // ),

            child: SingleChildScrollView(
              child: Column(
                children: [
                  // SvgPicture.asset(
                  //   AssetIcons.splash,
                  //   height: 150.h,
                  //   width: 150.w,
                  // ),
                  UIHelper.verticalSpaceLarge,
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login as Agent',
                          style: TextFontStyle.headline2BoldStyle.copyWith(
                            color: Colors.black,
                            fontSize: 20.sp,
                            wordSpacing: 5,
                            letterSpacing: 3,
                          ),
                        ),
                        UIHelper.verticalSpaceLarge,
                        Text(
                          'Mobile number',
                          style: TextFontStyle.headline2BoldStyle.copyWith(
                              color: Colors.black,
                              wordSpacing: 5,
                              letterSpacing: .8),
                        ),
                        UIHelper.verticalSpaceSmall,

                        //For Email
                        Container(
                          color: Colors.transparent,
                          child: TextFormField(
                            autovalidateMode: validation
                                ? AutovalidateMode.always
                                : AutovalidateMode.disabled,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter Mobile';
                              }
                              return null;
                            },
                            controller: mobileController,
                            keyboardType: TextInputType.number,
                            style: TextFontStyle.loginType,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.r),
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 1.0, horizontal: 20),
                              hintText: 'Enter your Mobile No',
                              hintStyle: TextStyle(
                                letterSpacing: 1,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.normal,
                                color: Colors.black,
                              ),
                              //labelText: labelText,
                              labelStyle: TextStyle(
                                letterSpacing: 1,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w100,
                                fontStyle: FontStyle.normal,
                                color: Colors.black,
                              ),

                              errorStyle: TextStyle(
                                letterSpacing: 1,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w100,
                                fontStyle: FontStyle.normal,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        UIHelper.verticalSpaceLarge,
                        Text(
                          'Access PIN',
                          style: TextFontStyle.headline2BoldStyle.copyWith(
                              color: Colors.black,
                              wordSpacing: 5,
                              letterSpacing: 3),
                        ),
                        UIHelper.verticalSpaceSmall,
                        //For Password
                        Container(
                          color: Colors.white.withOpacity(0.7),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 9,
                                child: TextFormField(
                                  autovalidateMode: validation
                                      ? AutovalidateMode.always
                                      : AutovalidateMode.disabled,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter Access PIN';
                                    }
                                    return null;
                                  },
                                  controller: acceKeyController,
                                  obscureText: true,
                                  style: TextFontStyle.loginType,
                                  decoration: InputDecoration(
                                    suffixIcon:
                                        Icon(Icons.remove_red_eye_outlined),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.r),
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 1.0, horizontal: 20),
                                    hintText: 'Access PIN',
                                    hintStyle: TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      color: AppColors.secondaryColor,
                                    ),
                                    //labelText: labelText,
                                    labelStyle: TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w100,
                                      fontStyle: FontStyle.normal,
                                      color: AppColors.secondaryColor,
                                    ),

                                    errorStyle: TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        UIHelper.verticalSpaceLarge,
                        customeButton(
                          name: 'Login Now',
                          height: .065.sh,
                          minWidth: double.infinity,
                          borderRadius: 5.r,
                          color: AppColors.primaryColor,
                          textStyle: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                          context: context,
                          onCallBack: () async {
                            if (_formKey.currentState!.validate()) {
                              setId();
                              String macAddress = storage.read(kKeyDeviceID);
                              await getLoginRXobj.login(
                                mobileController.text.toString(),
                                acceKeyController.text.toString(),
                                "5800E3C562",
                              );

                              setState(() {
                                validation = true;
                              });
                            } else {
                              const snackBar = SnackBar(
                                  content:
                                      Text('Email or Password is not valid'));

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }

                            // getLoginRXobj.login(
                            //     'newrestaurant@gmail.com', '123456');
                          },
                        ),
                        UIHelper.verticalSpaceMedium,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
