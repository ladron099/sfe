
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import '../../const/vars.dart';
import '../../functions/wayspop.dart'; 

class SchoolDetailCourse extends StatefulWidget {
  const SchoolDetailCourse({Key? key}) : super(key: key);

  @override
  State<SchoolDetailCourse> createState() => _SchoolDetailCourseState();
}

class _SchoolDetailCourseState extends State<SchoolDetailCourse> {
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

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:   EdgeInsets.only(right: 20.0.sp,top: 23.sp,bottom: 12.sp,left: 20.sp),
              child: LocaleText("road",style: TextStyle(
                fontSize: 16.sp,fontFamily: "cairo",fontWeight: FontWeight.bold
              ),),
            ),

        SizedBox(
          height: 236.h,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                child: Image.asset(
                 'assets/images/stap.jpg',fit: BoxFit.fill,scale: 1,
                ),
              ),
              Positioned(child: Icon(
                  IconlyBroken.play,
                size: 109.sp,
                color: Colors.white,

              ))
            ],

             ),
        ),
            Padding(
              padding:   EdgeInsets.only(right: 20.0.sp,top: 18.sp,bottom: 7.sp,left: 20.sp),
              child: Row(
                children: [
                  LocaleText("road",style: TextStyle(
                      fontSize: 18.sp,fontFamily: "cairo",fontWeight: FontWeight.bold,color: PrimaryColor
                  ),),
                ],
              ),
            ), Padding(
              padding:   EdgeInsets.only(right: 20.0.sp,bottom: 10.sp,left: 20.sp),
              child: LocaleText("data",style: TextStyle(
                  fontSize: 14.sp,fontFamily: "cairo"
              ),),
            ),
          ],
        ),
      ),
     
    );
  }



}
