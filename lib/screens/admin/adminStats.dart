import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../const/chart.dart';
import '../../const/vars.dart';

class AdminStats extends StatefulWidget {
  const AdminStats({Key? key}) : super(key: key);

  @override
  State<AdminStats> createState() => _AdminStatsState();
}

class _AdminStatsState extends State<AdminStats> {
  @override
  Widget build(BuildContext context) {
    bool isar = true;
    String curr = context.currentLocale.toString();
    if (curr == 'ar') {
      isar = true;
    } else {
      isar = false;
    }
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            25.verticalSpace,
            LocaleText(
              'stats',
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'cairo',
                fontWeight: FontWeight.bold,
                color: Dark,
              ),
            ),
            15.verticalSpace,
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
                            "facture",
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
            20.verticalSpace,
            LocaleText(
              'facture',
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'cairo',
                fontWeight: FontWeight.bold,
                color: Dark,
              ),
            ),
            10.verticalSpace,
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
                            IconlyBroken.paper,
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
                  ),
                ],
              ),
            ),
            20.verticalSpace,
            LocaleText(
              'derniersixmois',
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'cairo',
                fontWeight: FontWeight.bold,
                color: Dark,
              ),
            ),
            10.verticalSpace,
            const BarChartSample2(),
            91.verticalSpace,
          ],
        ),
      ),
    );
  }
}
