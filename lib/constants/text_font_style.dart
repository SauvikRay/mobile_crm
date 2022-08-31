import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_crm/constants/appcolors.dart';

class TextFontStyle {
//Initialising Constractor
  TextFontStyle._();

  //AppbarTextStyle
  static final welcome = GoogleFonts.poppins(
      fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.black);
  static final customerName = GoogleFonts.poppins(
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryColor);
  static final loginType = GoogleFonts.poppins(
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.secondaryColor);
  static final cardhead = GoogleFonts.poppins(
      fontSize: 12.sp,
      fontWeight: FontWeight.normal,
      color: AppColors.secondaryColor);
  static final bigAmount = GoogleFonts.poppins(
      fontSize: 24.sp, fontWeight: FontWeight.bold, color: Colors.black);

  static final popUpselectedText = GoogleFonts.poppins(
      fontSize: 16.sp,
      color: AppColors.primaryColor,
      letterSpacing: 1,
      fontWeight: FontWeight.w400);
  static final buttonBoldStyle = GoogleFonts.poppins(
      color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w800);

  static final productDetails = GoogleFonts.poppins(
      color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.normal);
  static final productPrice = GoogleFonts.poppins(
      color: AppColors.greenColor,
      fontSize: 14.sp,
      fontWeight: FontWeight.w800);

  static final headline2BoldStyle = GoogleFonts.poppins(
      color: AppColors.secondaryColor,
      fontSize: 14.sp,
      fontWeight: FontWeight.w800);

  static final headline1BoldStyle = GoogleFonts.poppins(
      color: AppColors.secondaryColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.w800);
}
