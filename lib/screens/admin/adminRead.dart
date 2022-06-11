import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../const/vars.dart';
import '../../const/input.dart';
import '../autoecole/schoolCourses.dart';
class AdminRead extends StatefulWidget {
  const AdminRead({Key? key}) : super(key: key);

  @override
  State<AdminRead> createState() => _AdminReadState();
}

class _AdminReadState extends State<AdminRead> {
  TextEditingController search = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    final formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          25.verticalSpace,
          LocaleText(
            'both',
            style: TextStyle(
              color: Dark,
              fontFamily: 'cairo',
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
          15.verticalSpace,
          input(Locales.string(context, 'search'), false, IconlyBroken.search,
              search, false),
          15.verticalSpace,
          SizedBox(
            width: 500.w,
            height: 565.h,
            child: ListView(
              children: [
                30.verticalSpace,
                for (int i = 0; i < 5; i++)
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              pushNewScreen(context,
                                  screen: const SchoolCourses(),
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                  withNavBar: false);
                            },
                            child: SizedBox(
                              width: 160.w,
                              height: 211.h,
                              child: Container(
                                  height: 79.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border:
                                          Border.all(color: Gry3, width: 1.2.w),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12.r))),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 157.5.w,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(11.r),
                                                  topRight:
                                                      Radius.circular(11.r)),
                                              child: Image.asset(
                                                'assets/images/sign.png',
                                                width: 160.w, // set your height
                                                //   width: 79.w, // and width here
                                              ),
                                            ),
                                          ),
                                          const Spacer(),
                                          8.horizontalSpace,
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 13.w),
                                            child: SizedBox(
                                              width: 78.w,
                                              child: LocaleText(
                                                'road',
                                                style: TextStyle(
                                                    color: Dark,
                                                    fontSize: 14.sp,
                                                    fontFamily: 'cairo'),
                                              ),
                                            ),
                                          ),
                                          const Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15.0),
                                            child: Row(
                                              children: [
                                                LocaleText(
                                                  'numbercourse',
                                                  style: TextStyle(
                                                      color: Gry3,
                                                      fontSize: 14.sp,
                                                      fontFamily: 'cairo'),
                                                ),
                                                7.horizontalSpace,
                                                Icon(
                                                  Boxicons.bxs_square,
                                                  size: 6.sp,
                                                  color: Gry3,
                                                ),
                                                7.horizontalSpace,
                                                LocaleText(
                                                  'time',
                                                  style: TextStyle(
                                                      color: Gry3,
                                                      fontSize: 14.sp,
                                                      fontFamily: 'cairo'),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                        ],
                                      )
                                    ],
                                  )),
                            ),
                          ),
                          15.horizontalSpace,
                          InkWell(
                            onTap: () {
                              pushNewScreen(context,
                                  screen: const SchoolCourses(),
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                  withNavBar: false);
                            },
                            child: SizedBox(
                              width: 160.w,
                              height: 211.h,
                              child: Container(
                                  height: 79.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border:
                                          Border.all(color: Gry3, width: 1.2.w),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12.r))),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 157.5.w,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(11.r),
                                                  topRight:
                                                      Radius.circular(11.r)),
                                              child: Image.asset(
                                                'assets/images/sign.png',
                                                width: 160.w, // set your height
                                                //   width: 79.w, // and width here
                                              ),
                                            ),
                                          ),
                                          const Spacer(),
                                          8.horizontalSpace,
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 13.w),
                                            child: SizedBox(
                                              width: 78.w,
                                              child: LocaleText(
                                                'road',
                                                style: TextStyle(
                                                    color: Dark,
                                                    fontSize: 14.sp,
                                                    fontFamily: 'cairo'),
                                              ),
                                            ),
                                          ),
                                          const Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15.0),
                                            child: Row(
                                              children: [
                                                LocaleText(
                                                  'numbercourse',
                                                  style: TextStyle(
                                                      color: Gry3,
                                                      fontSize: 14.sp,
                                                      fontFamily: 'cairo'),
                                                ),
                                                7.horizontalSpace,
                                                Icon(
                                                  Boxicons.bxs_square,
                                                  size: 6.sp,
                                                  color: Gry3,
                                                ),
                                                7.horizontalSpace,
                                                LocaleText(
                                                  'time',
                                                  style: TextStyle(
                                                      color: Gry3,
                                                      fontSize: 14.sp,
                                                      fontFamily: 'cairo'),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                        ],
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),
                      15.verticalSpace,
                    ],
                  ),
                100.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
