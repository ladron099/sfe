import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:permis/const/loading.dart';
import 'package:permis/const/vars.dart';
import 'package:permis/functions/apiFunctions.dart';
import 'package:permis/screens/autoecole/schoolCarList.dart';
import 'package:permis/screens/autoecole/schoolcandidatsList.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../candidat/detailCourse.dart';

class SchoolHome extends StatefulWidget {
  const SchoolHome({Key? key}) : super(key: key);

  @override
  State<SchoolHome> createState() => _SchoolHomeState();
}

class _SchoolHomeState extends State<SchoolHome> {
  int candlenght =0;
  int carlenght =0;
bool loading = true;
getAllData()async{
ApiFunctions a = ApiFunctions();
final prefs = await SharedPreferences.getInstance();
final String token = prefs.getString('token') ?? '';
var dn=await a.getUser(token);
Map result= json.decode(dn.body);
int id=result["id"].toInt();
var can=await a.getCandidatSchool(token, id);
var car=await a.getCarsSchool(token, id);

if(can.statusCode == 200){
  List getCandidatLength= json.decode(can.body) as List; 
  setState(() {
    
candlenght=getCandidatLength.length;
  });
}
else if(can.statusCode==404){
 setState(() { candlenght=0;});
}
if(car.statusCode == 200){
  List getCarLength= json.decode(car.body) as List; 
  
setState(() {
  carlenght=getCarLength.length;
});

}
else if(car.statusCode==404){
  setState(() { carlenght=0;});
}
setState(() {
loading=false;
});

}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllData();
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

    return loading ?const Loading():SingleChildScrollView(
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
                        LocaleText(
                          "perm",
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
                onTap: (){
  pushNewScreen(context,
                      screen: const SchoolCandidatsList(),
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
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: Row(
                              children: [
                                Text(
                                     candlenght.toString(),
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'cairo',
                                    color: Dark,
                                  ),
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
                onTap: (){
                    pushNewScreen(context,
                      screen: const SchoolCarsList(),
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
                                IconlyBroken.ticket,
                                size: 28.sp,
                              ),
                              5.horizontalSpace,
                              LocaleText(
                                "cars",
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
                                Text(
                                  carlenght.toString(),
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'cairo',
                                    color: Dark,
                                  ),
                                ),
                                5.horizontalSpace,
                                LocaleText(
                                  "cars",
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
