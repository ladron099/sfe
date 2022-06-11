import 'package:boxicons/boxicons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:permis/const/vars.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../coach/seanceProfile.dart';
import 'courses.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    bool isar = true;
    String curr = context.currentLocale.toString();
    if (curr == 'ar') {
      isar = true;
    } else {
      isar = false;
    }
    return ListView(
      children: [
        30.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 0,
              color: PrimaryColor,
              child: Padding(
                padding: EdgeInsets.all(15.w),
                child: LocaleText(
                  "welcome1",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontFamily: 'cairo',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        20.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: LocaleText(
            'stats',
            style: TextStyle(
              color: Dark,
              fontSize: 16.sp,
              fontFamily: 'cairo',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        10.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Card(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Gry3, width: 1)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 1.h),
                  child: Row(
                    children: [
                      LocaleText(
                        "progress",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontFamily: 'cairo',
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "55%",
                        style: TextStyle(
                            color: Dark, fontSize: 16.sp, fontFamily: 'cairo'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 12.0.h),
                  child: LinearPercentIndicator(
                    width: 320.w,
                    animation: true,
                    lineHeight: 12.0.h,
                    animationDuration: 2000,
                    percent: 0.55,
                    animateFromLastPercent: true,
                    isRTL: true,
                    barRadius: Radius.elliptical(15.r, 15.r),
                    progressColor: PrimaryColor,
                    maskFilter: const MaskFilter.blur(BlurStyle.solid, 3),
                  ),
                ),
              ],
            ),
          ),
        ),
        20.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: LocaleText(
            'appointment',
            style: TextStyle(
                color: Dark,
                fontSize: 16.sp,
                fontFamily: 'cairo',
                fontWeight: FontWeight.bold),
          ),
        ),
        10.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: InkWell(
            onTap: () {
             pushNewScreen(context,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                              screen: const SeanceProfile(),
                              withNavBar: false);
            },
            child: Card(
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13.0),
                  borderSide: const BorderSide(color: Gry3, width: 1)),
              child: Padding(
                padding: EdgeInsets.all(15.0.r),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0.sp),
                          child: Container(
                            width: 15.w,
                            height: 15.h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        LocaleText(
                          "conduite",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontFamily: 'cairo'),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Text(
                            "21-12-2022",
                            style: TextStyle(
                                color: Gry3,
                                fontSize: 16.sp,
                                fontFamily: 'cairo'),
                          ),
                        ),
                        SizedBox(
                          width: 35.w,
                        ),
                        LocaleText(
                          "heure",
                          style: TextStyle(
                              color: Gry3,
                              fontSize: 16.sp,
                              fontFamily: 'cairo',
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "12:43",
                          style: TextStyle(
                              color: Gry3,
                              fontSize: 16.sp,
                              fontFamily: 'cairo',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        20.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: LocaleText(
            'cours2',
            style: TextStyle(
                color: Dark,
                fontSize: 16.sp,
                fontFamily: 'cairo',
                fontWeight: FontWeight.bold),
          ),
        ),
        10.verticalSpace,
        SizedBox(
          width: 323.w,
          height: 79.h,
          child: CarouselSlider(
            options: CarouselOptions(height: 110.0),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return InkWell(
                    onTap: () {
                      pushNewScreen(context,
                          screen: const Courses(),
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                          withNavBar: false);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Container(
                          height: 79.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Gry3, width: 1.2.w),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.r))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: !isar
                                    ? BorderRadius.only(
                                        topLeft: Radius.circular(12.r),
                                        bottomLeft: Radius.circular(12.r))
                                    : BorderRadius.only(
                                        topRight: Radius.circular(12.r),
                                        bottomRight: Radius.circular(12.r)),
                                child: Image.asset(
                                  'assets/images/road.jpg',
                                  height: 79.h, // set your height
                                  //   width: 79.w, // and width here
                                ),
                              ),
                              4.horizontalSpace,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Spacer(),
                                  LocaleText(
                                    "road",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontFamily: 'cairo',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      LocaleText(
                                        "numbercourse",
                                        style: TextStyle(
                                            color: Gry3,
                                            fontSize: 14.sp,
                                            fontFamily: 'cairo'),
                                      ),
                                      17.horizontalSpace,
                                      16.horizontalSpace,
                                      LocaleText(
                                        "heure",
                                        style: TextStyle(
                                            color: Gry3,
                                            fontSize: 14.sp,
                                            fontFamily: 'cairo'),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.w),
                                        child: Text(
                                          "10",
                                          style: TextStyle(
                                              color: Gry3,
                                              fontSize: 14.sp,
                                              fontFamily: 'cairo'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ],
                          )),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        20.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: LocaleText(
            'cours',
            style: TextStyle(
                color: Dark,
                fontSize: 16.sp,
                fontFamily: 'cairo',
                fontWeight: FontWeight.bold),
          ),
        ),
        10.verticalSpace,
        SizedBox(
          height: 254.h,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                width: 10.w,
              ),
              for (int i = 0; i < 3; i++)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          pushNewScreen(context,
                              screen: const Courses(),
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
                                  border: Border.all(color: Gry3, width: 1.2.w),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.r))),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 157.5.w,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(11.r),
                                              topRight: Radius.circular(11.r)),
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
                ),
              SizedBox(
                width: 15.w,
              ),
            ],
          ),
        ),

        // input('text', false, IconlyBroken.search),
        90.verticalSpace,
      ],
    );
  }
}
