import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/appcolors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 40.h,
                ),
                Image.asset('assets/icons/bird.png'),
                // Text(
                //   'Welcome Screen',
                //   style: TextStyle(fontSize: 30.sp, color: Colors.black),
                // ),
                SizedBox(
                  height: 20.h,
                ),
              ]),
        ),
      ),
    );
  }
}
