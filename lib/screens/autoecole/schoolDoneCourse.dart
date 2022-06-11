import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permis/const/roundedButton.dart';
import 'package:permis/screens/autoecole/schoolHomePage.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../const/vars.dart';
import '../admin/adminHomePage.dart'; 

class SchoolDoneCourse extends StatefulWidget {
  const SchoolDoneCourse({Key? key}) : super(key: key);

  @override
  State<SchoolDoneCourse> createState() => _SchoolDoneCourseState();
}

class _SchoolDoneCourseState extends State<SchoolDoneCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        toolbarHeight: 80.h,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 25.h,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          75.25.verticalSpace,
          Image.asset(
            'assets/images/check.png',
            scale: 1.3,
          ),
          55.24.verticalSpace,
          LocaleText(
            "verification",
            style: TextStyle(
              color: Dark,
              fontSize: 18.sp,
              fontFamily: "cairo",
              fontWeight: FontWeight.bold,
            ),
          ),
          25.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 92.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LocaleText(
                  "eu",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: "cairo",
                    fontWeight: FontWeight.bold,
                    color: Dark,
                  ),
                ),
                LocaleText(
                  "note",
                  style: TextStyle(
                      color: Dark,
                      fontSize: 18.sp,
                      fontFamily: "cairo",
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          20.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 134.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LocaleText(
                  "progress",
                  style: TextStyle(
                      color: Dark,
                      fontSize: 18.sp,
                      fontFamily: "cairo",
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "+ 10%",
                  style: TextStyle(
                      color: Dark,
                      fontSize: 18.sp,
                      fontFamily: "cairo",
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          62.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 77.w),
            child: RoundedButton("retour", () {
              pushNewScreen(context,
                  screen: const SchoolHomePage(
                    index: 0,
                  ),
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  withNavBar: false);
            }, PrimaryColor),
          )
        ],
      ),
    );
  }
}
