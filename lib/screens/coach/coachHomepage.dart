import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:permis/const/vars.dart';
import 'package:permis/screens/coach/coachCandidat.dart';
import 'package:permis/screens/coach/seanceProfile.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../candidat/detailCourse.dart';
import 'coachDrawerNavigator.dart';

class CoachHomePage extends StatefulWidget {
  const CoachHomePage({Key? key}) : super(key: key);

  @override
  State<CoachHomePage> createState() => _CoachHomePageState();
}

class _CoachHomePageState extends State<CoachHomePage>
    with AfterLayoutMixin<CoachHomePage> {
  DateTime _timeOfDay = DateTime.now();
  String period = '';
  void Function(void Function())? setS;

  @override
  void afterFirstLayout(BuildContext context) {
    // Calling the same function "after layout" to resolve the issue.
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setS?.call(() {
        _timeOfDay = DateTime.now();
      });
      setS?.call(() {
        period = '${TimeOfDay.now().period}' ;
      });
      print('time is $_timeOfDay');
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    setS==null;
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
    final GlobalKey<ScaffoldState> key = GlobalKey();
    return Scaffold(
      backgroundColor: PrimaryBg,
      key: key,
      appBar: AppBar(
        title: const LocaleText("homepage"),
        titleTextStyle: TextStyle(
            fontFamily: 'cairo', fontSize: 16.sp, fontWeight: FontWeight.bold),
        centerTitle: true,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(27.r),
        //   ),
        // ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.0.w),
            child: Transform.scale(
              scale: 1.8,
              child: IconButton(
                icon: Image.asset(
                  'assets/images/splashlogo.png',
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
        backgroundColor: PrimaryColor,
        toolbarHeight: 80.h,
        elevation: 0,
        leading: InkWell(
          onTap: () => key.currentState!.openDrawer(),
          child: Icon(
            IconlyBroken.category,
            size: 35.h,
          ),
        ),
      ),
      drawer: const CoachDrawerNavigator(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20.0.w, 20.w, 20.h, 0),
                child: const LocaleText('welcome3'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StatefulBuilder(builder: (context, setState) {
                    setS = setState;
                    return Text(
                      "${_timeOfDay.hour}:${_timeOfDay.minute < 10 ? '0${_timeOfDay.minute}' : _timeOfDay.minute}",
                      style: TextStyle(
                          fontSize: 67.sp, fontFamily: 'cairo', color: Dark),
                    );
                  }),
                  2.horizontalSpace,
                  RotatedBox(
                    quarterTurns: 3,
                    child: LocaleText(period == 'am' ? 'morning' : 'afternoon',
                        style: TextStyle(
                            fontSize: 14.sp, fontFamily: 'cairo', color: Dark)),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Gry3, width: 1.2.w),
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.r))),
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
                          LocaleText(
                            "notification",
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
                    14.horizontalSpace,
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Gry3, width: 1.2.w),
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.r))),
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
              ),
              20.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: InkWell(
                  onTap: () {
                    pushNewScreen(context,
                        screen: const CoachCandidat(),
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
                              padding: EdgeInsets.symmetric(horizontal: 25.0.h),
                              child: Row(
                                children: [
                                  Text('0',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: 'cairo',
                                          color: Dark)),
                                  5.horizontalSpace,
                                  LocaleText(
                                    "onecandidat",
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
              ),
              14.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: LocaleText(
                  "seancetoday",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'cairo',
                      fontWeight: FontWeight.bold,
                      color: Dark),
                ),
              ),
              5.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                child: SizedBox(
                  height: 150.h,
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
                                      screen: const DetailCourse(),
                                      pageTransitionAnimation:
                                          PageTransitionAnimation.cupertino,
                                      withNavBar: false);
                                },
                                child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.w),
                                    child: InkWell(
                                      onTap: () {
                                        pushNewScreen(context,
                                            screen: const SeanceProfile(),
                                            pageTransitionAnimation:
                                                PageTransitionAnimation
                                                    .cupertino,
                                            withNavBar: false);
                                      },
                                      child: Container(
                                        width: 150.w,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Gry3, width: 1.2.w),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.r))),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Spacer(),
                                            ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50.r)),
                                              child: Image.asset(
                                                'assets/images/profilepic.jpg',
                                                fit: BoxFit.cover,
                                                height: 60.h,
                                                width: 60.h,
                                              ),
                                            ),
                                            const Spacer(),
                                            Text('hicham nador',
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontFamily: 'cairo',
                                                    color: Dark)),
                                            const Spacer(),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                LocaleText(
                                                  'de',
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontFamily: 'cairo',
                                                    color: Gry3,
                                                  ),
                                                ),
                                                5.horizontalSpace,
                                                Text('13:10',
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontFamily: 'cairo',
                                                      color: Gry3,
                                                    )),
                                                5.horizontalSpace,
                                                LocaleText(
                                                  'vers',
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontFamily: 'cairo',
                                                    color: Gry3,
                                                  ),
                                                ),
                                                5.horizontalSpace,
                                                Text('14:10',
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontFamily: 'cairo',
                                                      color: Gry3,
                                                    )),
                                              ],
                                            ),
                                            const Spacer(),
                                          ],
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      SizedBox(
                        width: 10.w,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
