import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permis/const/input.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../const/vars.dart';
import 'detailCourse.dart';

class Read extends StatefulWidget {
  const Read({Key? key}) : super(key: key);

  @override
  State<Read> createState() => _ReadState();
}
bool check(int a ){
  if(a%2==0){
    return true;
  }
  else{
    return false;
  }
}
class _ReadState extends State<Read> {
 
    var search = TextEditingController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    bool j=true;
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: input(
                  Locales.string(context, "search"), false, Boxicons.bx_search,search,false),
            ),
            24.verticalSpace,
            for(int i=0;i<9;i++)
            Padding(
              padding:   EdgeInsets.symmetric(horizontal: 16.0.w),
              child: InkWell(
                onTap: () {
                  pushNewScreen(context,
                      screen: const DetailCourse(),
                      pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      withNavBar: false);
                },
                child: Card(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                        borderSide: const BorderSide(color: Gry3, width: 1)),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15.0, right: 15, bottom: 15, left: 8),
                              child: Container(
                                child: Image.asset(
                                  'assets/images/road.png',
                                  height: 70.h, // set your height
                                  width: 70.w, // and width here
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width:  check(i)?75.w:130.w,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 19.0.h),
                                    child: LocaleText(
                                      "road",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.sp,
                                          fontFamily: 'cairo',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 80.w,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 19.0.h),
                                  child: LocaleText(
                                    check(i)?"cours2single":"none",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 14.sp,
                                        fontFamily: 'cairo',),
                                  ),
                                ),

                              ],
                            ),
                            Row(
                              children: [
                                LocaleText(
                                  "numbercourse",
                                  style: TextStyle(
                                      color: Gry3,
                                      fontSize: 14.sp,
                                      fontFamily: 'cairo'),
                                ),
                                SizedBox(
                                  width: 17.w,
                                ),
                                Icon(
                                  Boxicons.bxs_square,
                                  color: Gry3,
                                  size: 6.sp,
                                ),
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
                        ),
                      ],
                    )),
              ),
            )
          ],
        ),
        90.verticalSpace,
      ],
    );
  }
}
