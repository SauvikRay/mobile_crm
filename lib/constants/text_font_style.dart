import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_crm/constants/appcolors.dart';

class TextFontStyle {
//Initialising Constractor
  TextFontStyle._();

  //AppbarTextStyle
  static final welcome = GoogleFonts.roboto(
      fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.black);
  static final customerName = GoogleFonts.roboto(
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryColor);
  static final loginType = GoogleFonts.roboto(
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.secondaryColor);
  static final cardhead = GoogleFonts.roboto(
      fontSize: 12.sp,
      fontWeight: FontWeight.normal,
      color: AppColors.secondaryColor);
  static final bigAmount = GoogleFonts.roboto(
      fontSize: 24.sp, fontWeight: FontWeight.bold, color: Colors.black);

  static final popUpselectedText = GoogleFonts.roboto(
      fontSize: 16.sp,
      color: AppColors.primaryColor,
      letterSpacing: 1,
      fontWeight: FontWeight.w400);
  static final buttonBoldStyle = GoogleFonts.montserrat(
      color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w800);

  static final productDetails = GoogleFonts.montserrat(
      color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.normal);
  static final productPrice = GoogleFonts.montserrat(
      color: AppColors.greenColor,
      fontSize: 14.sp,
      fontWeight: FontWeight.w800);
}
