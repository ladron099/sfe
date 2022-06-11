import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permis/const/roundedButton.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../const/vars.dart';
import 'doneCourse.dart';

class Answers extends StatefulWidget {
  bool answersHidden;

  Answers(this.answersHidden);

  @override
  State<Answers> createState() => _AnswersState(answersHidden);
}

class _AnswersState extends State<Answers> {
  bool answersHidden;

  _AnswersState(this.answersHidden);

  bool istrue1 = false;
  bool istrue2 = false;
  bool istrue3 = false;
  bool istrue4 = false;
  bool valid = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const LocaleText("road"),
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: "cairo",
            fontSize: 16.sp,
          ),
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
        body: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: LocaleText(
                    "questiontest",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: "cairo",
                        color: Dark,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                8.verticalSpace,
                Center(
                  child: Image.asset(
                    'assets/images/roadbutbigger.png',
                    scale: 0.78.sp,
                  ),
                ),
                11.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 29.w),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (istrue1) {
                          istrue1 = false;
                        } else {
                          if(answersHidden){
                            valid=true;
                          }
                          istrue1 = true;
                        }
                        print(istrue1);
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(kDefaultPadding),
                      decoration: BoxDecoration(
                        border: Border.all(color: istrue1 ?PrimaryColor:Gry3,width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const LocaleText(
                            "answer1",
                            style: TextStyle(
                                color: Dark, fontSize: 16, fontFamily: "cairo"),
                          ),
                          Container(
                            height: 26.h,
                            width: 26.h,
                            decoration: BoxDecoration(
                              color: istrue1 ?PrimaryColor:Gry3,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Gry3),
                            ),

                          )
                        ],
                      ),
                    ),
                  ),
                ), Padding(
                  padding: EdgeInsets.symmetric(horizontal: 29.w),
                  child: InkWell(
                    onTap: () {
                      setState(() {

                        if (istrue2) {
                          istrue2 = false;
                        } else {
                          if(answersHidden){
                            valid=true;
                          }
                        }
                        print(istrue2);
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(kDefaultPadding),
                      decoration: BoxDecoration(
                        border: Border.all(color: istrue2 ?PrimaryColor:valid?Colors.green:Gry3,width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const LocaleText(
                            "answer2",
                            style: TextStyle(
                                color: Dark, fontSize: 16, fontFamily: "cairo"),
                          ),
                          Container(
                            height: 26.h,
                            width: 23.w,
                            decoration: BoxDecoration(
                              color: istrue2 ?PrimaryColor:valid?Colors.green:Gry3,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Gry3),
                            ),

                          )
                        ],
                      ),
                    ),
                  ),
                ),
            Padding(
                  padding: EdgeInsets.symmetric(horizontal: 29.w),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (istrue3) {
                          istrue3 = false;
                        } else {
                         if(answersHidden){
                           valid=true;
                         }
                          istrue3 = true;
                        }
                        print(istrue3);
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(kDefaultPadding),
                      decoration: BoxDecoration(
                        border: Border.all(color: istrue3 ?PrimaryColor:Gry3,width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const LocaleText(
                            "answer3",
                            style: TextStyle(
                                color: Dark, fontSize: 16, fontFamily: "cairo"),
                          ),
                          Container(
                            height: 26.h,
                            width: 26.h,
                            decoration: BoxDecoration(
                              color: istrue3 ?PrimaryColor:Gry3,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Gry3),
                            ),

                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 29.w),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (istrue4) {
                          istrue4 = false;
                        } else {
                          if(answersHidden){
                            valid=true;
                          }
                          istrue4 = true;
                        }
                        print(istrue4);
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(kDefaultPadding),
                      decoration: BoxDecoration(
                        border: Border.all(color: istrue4 ?PrimaryColor:Gry3,width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const LocaleText(
                            "answer4",
                            style: TextStyle(
                                color: Dark, fontSize: 16, fontFamily: "cairo"),
                          ),
                          Container(
                            height: 26.h,
                            width: 26.h,
                            decoration: BoxDecoration(
                              color: istrue4 ?PrimaryColor:Gry3,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Gry3),
                            ),

                          )
                        ],
                      ),
                    ),
                  ),
                ),

                20.verticalSpace,
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 78.0.w),
                  child: RoundedButton("warn", (){
                    pushNewScreen(context, screen: const DoneCourse(),   pageTransitionAnimation : PageTransitionAnimation.cupertino,withNavBar:false );
                  },PrimaryColor),
                )
                ,
                20.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
