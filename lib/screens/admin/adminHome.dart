import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:permis/functions/apiFunctions.dart';
import 'package:permis/screens/admin/candidatsList.dart';
import 'package:permis/screens/admin/schoolPage.dart';
import 'package:permis/screens/candidat/detailCourse.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/vars.dart';
import '../../const/loading.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  bool loading=true;
  int leng = 0;
  int con = 0;
  getSChoolLength() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    ApiFunctions a = ApiFunctions();
    var data = await a.getSchool(token);
    var ll = jsonDecode(data.body) as List;
    setState(() {
      leng = ll.length;
      loading = false;
    });
  }
  getCandidatLength() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    ApiFunctions a = ApiFunctions();
    var data = await a.getCandidat(token);
    var ll = jsonDecode(data.body) as List;
    setState(() {
      con = ll.length;
      loading = false;
    }); 
  }

  @override
  initState() {
    super.initState();
    getSChoolLength();
    getCandidatLength(); 
  }

  @override
  Widget build(BuildContext context) {
    bool isar = true;
    String curr = context.currentLocale.toString();
    if (curr == 'ar') {
      isar = true;
    } else {
      isar = false;
    }

    return loading?const Loading():SingleChildScrollView(
        child: Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.verticalSpace,
              LocaleText(
                'welcome3',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'cairo',
                  fontWeight: FontWeight.bold,
                  color: Dark,
                ),
              ),
              20.verticalSpace,
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Gry3, width: 1.2.w),
                        borderRadius: BorderRadius.all(Radius.circular(12.r))),
                    width: 160.w,
                    height: 160.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Icon(
                          IconlyBroken.notification,
                          size: 50.sp,
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(0.toString(),
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'cairo',
                                    color: Dark)),
                            LocaleText(
                              "perm",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'cairo',
                                color: Dark,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  14.horizontalSpace,
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Gry3, width: 1.2.w),
                        borderRadius: BorderRadius.all(Radius.circular(12.r))),
                    width: 160.w,
                    height: 160.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Icon(
                          IconlyBroken.message,
                          size: 50.sp,
                        ),
                        const Spacer(),
                        LocaleText(
                          "message",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'cairo',
                            color: Dark,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
              InkWell(
                 onTap: () {
                  pushNewScreen(context,
                      screen: const CandidatsList(),
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                      withNavBar: false);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Gry3, width: 1.2.w),
                      borderRadius: BorderRadius.all(Radius.circular(12.r))),
                  width: 335.w,
                  height: 93.h,
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          13.verticalSpace,
                          Row(
                            children: [
                              23.horizontalSpace,
                              Icon(
                                IconlyBroken.user_3,
                                size: 28.sp,
                              ),
                              5.horizontalSpace,
                              LocaleText(
                                "candidats",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'cairo',
                                  color: Dark,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 29.0.w),
                            child: Row(
                              children: [
                                Text(con.toString(),
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'cairo',
                                        color: Dark)),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                                  child: LocaleText(
                                    "onecandidat",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'cairo',
                                      color: Dark,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17.w),
                        child: Icon(
                          isar
                              ? IconlyBroken.arrow_left_2
                              : IconlyBroken.arrow_right_2,
                          color: PrimaryColor,
                          size: 29.sp,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              14.verticalSpace,
              InkWell(
                onTap: () {
                  pushNewScreen(context,
                      screen: const SchoolPage(),
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                      withNavBar: false);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Gry3, width: 1.2.w),
                      borderRadius: BorderRadius.all(Radius.circular(12.r))),
                  width: 335.w,
                  height: 93.h,
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          13.verticalSpace,
                          Row(
                            children: [
                              23.horizontalSpace,
                              Icon(
                                IconlyBroken.bookmark,
                                size: 28.sp,
                              ),
                              5.horizontalSpace,
                              LocaleText(
                                "schools",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'cairo',
                                  color: Dark,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: Row(
                              children: [
                                Text(leng.toString(),
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'cairo',
                                        color: Dark)),
                                5.horizontalSpace,
                                LocaleText(
                                  "oneschool",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'cairo',
                                    color: Dark,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17.w),
                        child: Icon(
                          isar
                              ? IconlyBroken.arrow_left_2
                              : IconlyBroken.arrow_right_2,
                          color: PrimaryColor,
                          size: 29.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              14.verticalSpace,
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Gry3, width: 1.2.w),
                    borderRadius: BorderRadius.all(Radius.circular(12.r))),
                width: 335.w,
                height: 93.h,
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        13.verticalSpace,
                        Row(
                          children: [
                            23.horizontalSpace,
                            Icon(
                              IconlyBroken.graph,
                              size: 28.sp,
                            ),
                            5.horizontalSpace,
                            LocaleText(
                              "stats2",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'cairo',
                                color: Dark,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          child: LocaleText(
                            "perm",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'cairo',
                              color: Dark,
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17.w),
                      child: Icon(
                        isar
                            ? IconlyBroken.arrow_left_2
                            : IconlyBroken.arrow_right_2,
                        color: PrimaryColor,
                        size: 29.sp,
                      ),
                    )
                  ],
                ),
              ),
              18.verticalSpace,
            
            ],
          ),
        ),
          ],
    ));
  }
}
