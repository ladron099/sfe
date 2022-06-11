import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/position/gf_position.dart';
import 'package:iconly/iconly.dart';
import 'package:permis/screens/autoecole/detailCourse.dart';
import 'package:permis/screens/autoecole/schoolDetailSection.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../const/vars.dart'; 

class SchoolCourses extends StatefulWidget {
  const SchoolCourses({Key? key}) : super(key: key);

  @override
  State<SchoolCourses> createState() => _SchoolCoursesState();
}

class _SchoolCoursesState extends State<SchoolCourses> {
  @override
  Widget build(BuildContext context) {
    bool isar = true;
    String curr = context.currentLocale.toString();
    if (curr == 'ar') {
      isar = true;
    } else {
      isar = false;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            !isar ? IconlyBroken.arrow_left_2 : IconlyBroken.arrow_right_2,
            size: 30.h,
          ),
        ),
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
      ),
      body:
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            15.verticalSpace,
            SizedBox(
              height: 254.h,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: [
                  15.horizontalSpace,
                  for (int i = 0; i < 3; i++)
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            pushNewScreen(context,
                                screen: const SchoolDetailSection(),
                                pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                                withNavBar: false);
                          },
                          child:SizedBox(
                            width: 320.w,
                            height: 202.w,
                            child:GFCard(
                              boxFit: BoxFit.cover,
                              titlePosition: GFPosition.start,
                              showOverlayImage: true,
                              imageOverlay: const AssetImage(
                                'assets/images/counter.jpg',
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(12.r)),
                              margin: EdgeInsets.all(5.w),
                            ),
                          )
                        ),
                      ],
                    ),

                ],
              ),
            ),

            Padding(
              padding:   EdgeInsets.symmetric(horizontal: 20.0.w),
              child: LocaleText('road',style: TextStyle(
                  fontSize: 18.sp,fontFamily: "cairo",fontWeight: FontWeight.bold,color: Dark
              ),),
            ),
            10.verticalSpace,
            Padding(
              padding:   EdgeInsets.symmetric(horizontal: 20.0.w),
              child: LocaleText('data2',style: TextStyle(
                  fontSize: 14.sp,fontFamily: "cairo",color: Colors.black
              ),),
            ),
            15.verticalSpace,
            for(int i=0;i<10;i++)
            InkWell(
              onTap: (){
                pushNewScreen(context, screen: const SchoolDetailCourse(),   pageTransitionAnimation : PageTransitionAnimation.cupertino,withNavBar:false );

              },
              child: Padding(
                padding:   EdgeInsets.symmetric(horizontal: 20.0.w,vertical: 5.h),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Gry3,width: 1.2.w),
                      borderRadius: BorderRadius.all(Radius.circular(12.r))),
                  width: 335.w,
                  height: 60  .h,
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              9.horizontalSpace,
                              Icon(
                                IconlyBroken.play,
                                size: 28.sp,
                                color: PrimaryColor,
                              ),
                              5.horizontalSpace,
                              LocaleText(
                                "road",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'cairo',
                                  fontWeight: FontWeight.w600,
                                  color: Dark,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9.w),
                        child:   Text(
                          "2:30",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'cairo',
                            fontWeight: FontWeight.w600,
                            color: Dark,
                          ),
                      ),)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
