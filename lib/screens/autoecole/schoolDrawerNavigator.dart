
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:iconly/iconly.dart';
import 'package:permis/const/vars.dart';
import 'package:permis/screens/autoecole/schoolCarList.dart';
import 'package:permis/screens/autoecole/schoolCoachList.dart';
import 'package:permis/screens/autoecole/schoolHomePage.dart';
import 'package:permis/screens/autoecole/schoolProfileChoice.dart';
import 'package:permis/screens/autoecole/schoolcandidatsList.dart';
import 'package:permis/screens/autoecole/seeShcoolProfile.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../DAL/school.dart';
import '../../functions/wayspop.dart';

class SchoolDrawerNavigator extends StatefulWidget {
  const SchoolDrawerNavigator({Key? key}) : super(key: key);

  @override
  State<SchoolDrawerNavigator> createState() => _SchoolDrawerNavigatorState();
}

class _SchoolDrawerNavigatorState extends State<SchoolDrawerNavigator> {
 String email='';
 String name='';
 String logo='';
  encap() async { 
    School mn=School();
    mn=School.fromJson(await SessionManager().get('user'));
     setState(() {
        email = mn.email;
        name = mn.name;
        logo=mn.logo;
     });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    encap();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: PrimaryColor,
        child: Column(
          children: [
            31.verticalSpace,
            Center(
                child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(90.r)),
                    child: logo==''?null:Image.network(
                      '$pict/$logo',
                      width: 100.w,
                      height: 100.w,
                      fit: BoxFit.cover,
                    ),),
                15.verticalSpace,
                Text(
                  name,
                  style: TextStyle(
                    fontFamily: 'cairo',
                    fontSize: 14.sp,
                    color: Colors.white,
                  ),
                ),
                2.verticalSpace,
                Text(
                  email,
                  style: TextStyle(
                    fontFamily: 'cairo',
                    fontSize: 14.sp,
                    color: Colors.white,
                  ),
                ),
              ],
            )),
            20.verticalSpace,
            Container(
              color: Colors.white,
              height: 1.sp,
            ),
            21.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 34.0.w),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                       Navigator.pop(context);
                      pushNewScreen(context,
                          screen: const SchoolHomePage(index: 0),
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                          withNavBar: false);
                    },
                    child: Row(
                      children: [
                        Icon(
                          IconlyBroken.home,
                          color: Colors.white,
                          size: 24.sp,
                        ),
                        11.horizontalSpace,
                        LocaleText(
                          "mainpage",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontFamily: 'cairo',
                          ),
                        )
                      ],
                    ),
                  ),
                  20.verticalSpace,
                  InkWell(
                    onTap: () {
                       Navigator.pop(context);
                      pushNewScreen(context,
                          screen: const SchoolCandidatsList(),
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                          withNavBar: false);
                    },
                    child: Row(
                      children: [
                        Icon(
                          IconlyBroken.user_3,
                          color: Colors.white,
                          size: 24.sp,
                        ),
                        11.horizontalSpace,
                        LocaleText(
                          "candidats",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontFamily: 'cairo',
                          ),
                        )
                      ],
                    ),
                  ),
                  20.verticalSpace,
                    InkWell(
                    onTap: () {
                       Navigator.pop(context);
                      pushNewScreen(context,
                          screen: const SchoolCarsList(),
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                          withNavBar: false);
                    },
                    child: Row(
                      children: [
                        Icon(
                          IconlyBroken.ticket,
                          color: Colors.white,
                          size: 24.sp,
                        ),
                        11.horizontalSpace,
                        LocaleText(
                          "cars",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontFamily: 'cairo',
                          ),
                        )
                      ],
                    ),
                  ),
                  20.verticalSpace,
                
                  InkWell(
                    onTap: () {
                       Navigator.pop(context);
                      pushNewScreen(context,
                          screen: const SchoolCoachList(),
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                          withNavBar: false);
                    },
                    child: Row(
                      children: [
                        Icon(
                          IconlyBroken.user_3,
                          color: Colors.white,
                          size: 24.sp,
                        ),
                        11.horizontalSpace,
                        LocaleText(
                          "coach",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontFamily: 'cairo',
                          ),
                        )
                      ],
                    ),
                  ),
                  20.verticalSpace,
                  InkWell(
                    onTap: () {
                       Navigator.pop(context);
                      pushNewScreen(context,
                          screen: const SchoolProfileChoice(),
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                          withNavBar: false);
                    },
                    child: Row(
                      children: [
                        Icon(
                          IconlyBroken.profile,
                          color: Colors.white,
                          size: 24.sp,
                        ),
                        11.horizontalSpace,
                        LocaleText(
                          "personalfile",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontFamily: 'cairo',
                          ),
                        )
                      ],
                    ),
                  ),
                  20.verticalSpace,
                  InkWell(
                    onTap: () async {
                    
                      pushNewScreen(context,
                          screen:  const SeeSchoolProfile(),
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                          withNavBar: false);
                    },
                    child: Row(
                      children: [
                        Icon(
                          IconlyBroken.bookmark,
                          color: Colors.white,
                          size: 24.sp,
                        ),
                        11.horizontalSpace,
                        LocaleText(
                          "urschool",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontFamily: 'cairo',
                          ),
                        )
                      ],
                    ),
                  ),
                  20.verticalSpace,
                  InkWell(
                    onTap: () {
                       Navigator.pop(context);
                      pushNewScreen(context,
                          screen: const SchoolHomePage(index: 1),
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                          withNavBar: false);
                    },
                    child: Row(
                      children: [
                        Icon(
                          IconlyBroken.graph,
                          color: Colors.white,
                          size: 24.sp,
                        ),
                        11.horizontalSpace,
                        LocaleText(
                          "laststat",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontFamily: 'cairo',
                          ),
                        )
                      ],
                    ),
                  ),
                  20.verticalSpace,
                  InkWell(
                    onTap: () {
                       Navigator.pop(context);
                      print('nono');
                    },
                    child: Row(
                      children: [
                        Icon(
                          IconlyBroken.calendar,
                          color: Colors.white,
                          size: 24.sp,
                        ),
                        11.horizontalSpace,
                        LocaleText(
                          "takdir",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontFamily: 'cairo',
                          ),
                        )
                      ],
                    ),
                  ),
                  20.verticalSpace,
                  InkWell(
                    onTap: () {
                       Navigator.pop(context);
                      pushNewScreen(context,
                          screen: const SchoolHomePage(index: 2),
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                          withNavBar: false);
                    },
                    child: Row(
                      children: [
                        Icon(
                          IconlyBroken.folder,
                          color: Colors.white,
                          size: 24.sp,
                        ),
                        11.horizontalSpace,
                        LocaleText(
                          "ds",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontFamily: 'cairo',
                          ),
                        )
                      ],
                    ),
                  ),
                  20.verticalSpace,
                  InkWell(
                    onTap: () {
                       Navigator.pop(context);
                      print('nono');
                    },
                    child: Row(
                      children: [
                        Icon(
                          IconlyBroken.setting,
                          color: Colors.white,
                          size: 24.sp,
                        ),
                        11.horizontalSpace,
                        LocaleText(
                          "settings",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontFamily: 'cairo',
                          ),
                        )
                      ],
                    ),
                  ),
                  43.verticalSpace,
                  InkWell(
                    onTap: () {
                       Navigator.pop(context);
                      LogoutPopup(context, Locales.string(context, 'usure'));
                    },
                    child: Row(
                      children: [
                        Icon(
                          IconlyBroken.logout,
                          color: Colors.white,
                          size: 24.sp,
                        ),
                        11.horizontalSpace,
                        LocaleText(
                          "signout",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontFamily: 'cairo',
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
