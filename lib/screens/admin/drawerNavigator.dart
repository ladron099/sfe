import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:iconly/iconly.dart';
import 'package:permis/DAL/admin.dart';
import 'package:permis/const/vars.dart';
import 'package:permis/screens/admin/adminHomePage.dart';
import 'package:permis/screens/admin/candidatsList.dart';
import 'package:permis/screens/admin/carsList.dart';
import 'package:permis/screens/admin/coachList.dart';
import 'package:permis/screens/admin/inscriptionList.dart';
import 'package:permis/screens/admin/profileChoice.dart';
import 'package:permis/screens/admin/schoolPage.dart';
import 'package:permis/screens/admin/usersPage.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../functions/wayspop.dart';
import 'adminSettings.dart';

class DrawerNavigator extends StatefulWidget {
  const DrawerNavigator({Key? key}) : super(key: key);

  @override
  State<DrawerNavigator> createState() => _DrawerNavigatorState();
}

class _DrawerNavigatorState extends State<DrawerNavigator> {
  String email = "";
  String name = "";
  encapp() async {
    Admin mn=Admin();
    mn=Admin.fromJson(await SessionManager().get('user'));
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              30.verticalSpace,
              Center(
                  child: Column(
                children: [
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
                            screen: const AdminHomePage(index: 0),
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
                            screen: const CandidatsList(),
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
                            screen: const InscriptionList(),
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                            withNavBar: false);
                      },
                      child: Row(
                        children: [
                          Icon(
                            IconlyBroken.send,
                            color: Colors.white,
                            size: 24.sp,
                          ),
                          11.horizontalSpace,
                          LocaleText(
                            "inscription",
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
                            screen: const ProfileChoice(),
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
                        pushNewScreen(context,
                            screen: const SchoolPage(),
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
                            "autoecole",
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
                            screen: const CoachList(),
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
                            screen: const UsersPage(),
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
                            "users",
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
                            screen: const AdminHomePage(index: 1),
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
                        pushNewScreen(context,
                            screen: const CarsList(),
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
                            screen: const AdminHomePage(index: 2),
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
                    30.verticalSpace,
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
                    20.verticalSpace,
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
