import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:iconly/iconly.dart';
import 'package:permis/DAL/moniteur.dart';
import 'package:permis/const/vars.dart';
import 'package:permis/screens/coach/coachCandidat.dart';
import 'package:permis/screens/coach/coachProfile.dart';
import 'package:permis/screens/coach/seanceList.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../functions/wayspop.dart';
import '../admin/adminSettings.dart';
import 'coachHomepage.dart';

class CoachDrawerNavigator extends StatefulWidget {
  const CoachDrawerNavigator({Key? key}) : super(key: key);

  @override
  State<CoachDrawerNavigator> createState() => _CoachDrawerNavigatorState();
}

class _CoachDrawerNavigatorState extends State<CoachDrawerNavigator> {
  String email = "";
  String name = "";
  encapp() async {
    Moniteur mn=Moniteur();
    mn=Moniteur.fromJson(await SessionManager().get('user'));
    setState(() {
      email = mn.email;
      name = mn.name;
    });
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    encapp();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: PrimaryColor,
        child: Column(
          children: [
            71.verticalSpace,
            Center(
                child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(90.r)),
                    child: Image.asset(
                      'assets/images/profilepic.jpg',
                      width: 100.w,
                    )),
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
                          screen: const CoachHomePage(),
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
                          screen: const CoachCandidat(),
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
                          screen: const CoachProfile(),
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
                    onTap: () {
                       Navigator.pop(context);
                      // pushNewScreen(context,
                      //     screen: const AdminHomePage(index: 1),
                      //     pageTransitionAnimation:
                      //         PageTransitionAnimation.cupertino,
                      //     withNavBar: false);
                    },
                    child: Row(
                      children: [
                        Icon(
                          IconlyBroken.message,
                          color: Colors.white,
                          size: 24.sp,
                        ),
                        11.horizontalSpace,
                        LocaleText(
                          "message2",
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
                          screen: const SeanceList(),
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                          withNavBar: false);
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
                          "seance",
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
                          screen: const AdminSettings(),
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                          withNavBar: false);
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
                  83.verticalSpace,
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
