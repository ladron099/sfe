import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:iconly/iconly.dart';
import 'package:permis/DAL/Candidat.dart';
import 'package:permis/const/vars.dart'; 
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../functions/wayspop.dart';
import 'candidatProfile.dart';
import 'homePage.dart';

class CandidatDrawerNavigator extends StatefulWidget {
  const CandidatDrawerNavigator({Key? key}) : super(key: key);

  @override
  State<CandidatDrawerNavigator> createState() =>
      _CandidatDrawerNavigatorState();
}

class _CandidatDrawerNavigatorState extends State<CandidatDrawerNavigator> {
  String email = "";
  String name = "";

  encap() async {
    Candidat cd= Candidat();
    cd=Candidat.fromJson(await SessionManager().get('user'));
    print(cd.email);
    setState(() {
      email = cd.email;
      name = cd.name;
    }); 
  }
  @override
  initState() {
    super.initState();
    encap();
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
                          screen: const HomePage(index: 0),
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
                          screen: const CandidatProfile(),
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
                      //     screen: const HomePage(index: 1),
                      //     pageTransitionAnimation:
                      //         PageTransitionAnimation.cupertino,
                      //     withNavBar: false);
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
                           pushNewScreen(context,
                              screen: const HomePage(index: 2),
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                              withNavBar: false);
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
                          screen: const HomePage(index: 1),
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
                  110.verticalSpace,
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
