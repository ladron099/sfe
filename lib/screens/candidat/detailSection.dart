
import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../const/vars.dart'; 
import '../../functions/wayspop.dart';
import 'asnwers.dart';

class DetailSection extends StatefulWidget {
  const DetailSection({Key? key}) : super(key: key);

  @override
  State<DetailSection> createState() => _DetailSectionState();
}

class _DetailSectionState extends State<DetailSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LocaleText("road"),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: "cairo",
          fontSize: 16.sp,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 13.0.r, right: 13.0.r),
            child: Transform.scale(
              scale: 1.5,
              child: IconButton(
                icon: Image.asset(
                  'assets/images/profile.png',
                ),
                onPressed: () {

                },
              ),
            ),
          ),
        ],
        backgroundColor: PrimaryColor,
        toolbarHeight: 80.h,
        elevation: 0,
        leading: InkWell(
          onTap: () {Navigator.pop(context);},
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
              32.verticalSpace,
              Center(
                child: Image.asset(
                  'assets/images/flat.png',
                  scale: 0.85.sp,
                ),
              ),
              11.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    LocaleText(
                      "road",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: "cairo",
                          fontWeight: FontWeight.bold,
                          color: PrimaryColor),
                    ),
                  ],
                ),
              ),
              7.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: LocaleText(
                  "data2",
                  style: TextStyle(fontSize: 14.sp, fontFamily: "cairo"),
                ),
              ),
              20.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: LocaleText(
                  "lescours",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: "cairo",
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF6B6868)),
                ),
              ),
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
                      Row(
                        children: [
                          Container(
                            child: Card(
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(13.0),
                                    borderSide: const BorderSide(color: Gry3, width: 1)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(

                                      child: Padding(
                                        padding: EdgeInsets.only(top: 9.0.sp),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15.0.w, vertical: 9.h),
                                          child: SizedBox(
                                            width: 149.w,
                                            child: Image.asset(
                                              "assets/images/car.png",
                                              scale: 0.1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:   EdgeInsets.symmetric(horizontal: 15.w),
                                      child: LocaleText(
                                        "coursetitle",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: "cairo",
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xFF6B6868)),
                                      ),
                                    ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:   EdgeInsets.symmetric(horizontal: 15.w),
                                        child: LocaleText(
                                          "numbercourse",
                                          style: TextStyle(
                                              color: Gry3,
                                              fontSize: 14.sp,
                                              fontFamily: 'cairo'),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 13.w,
                                      ),
                                      Icon(Boxicons.bxs_square,color: Gry3,size: 6.sp,),
                                      SizedBox(
                                        width: 16.w,
                                      ),
                                      LocaleText(
                                        "heure",
                                        style: TextStyle(
                                            color: Gry3,
                                            fontSize: 14.sp,
                                            fontFamily: 'cairo'),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 8.w),
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

                                  ],
                                )),
                          ),
                        ],
                      ),
                    SizedBox(
                      width: 15.w,
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 220.w,
        height: 55.h,
        child: FloatingActionButton.extended(
          backgroundColor: PrimaryColor,
          onPressed: () async{await
          showPopup(context,Locales.string(context, "question"),Answers(true));
          },
          label:  LocaleText("test",style: TextStyle(
              fontSize: 16.sp,fontFamily: "cairo"
          ),),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(23.0.r))),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

}
