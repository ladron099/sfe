import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:iconly/iconly.dart';
import 'package:permis/screens/admin/detailCandidat.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../const/vars.dart';
import '../../const/input.dart';

class CoachCandidat extends StatefulWidget {
  const CoachCandidat({Key? key}) : super(key: key);

  @override
  State<CoachCandidat> createState() => _CoachCandidatState();
}

class _CoachCandidatState extends State<CoachCandidat> {
  TextEditingController search = TextEditingController();
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
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            25.verticalSpace,
            LocaleText(
              'candidats',
              style: TextStyle(
                color: Dark,
                fontFamily: 'cairo',
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            15.verticalSpace,
            input(Locales.string(context, "search2"), false,
                IconlyBroken.search, search, false),
            15.verticalSpace,
            Expanded(
                child: ListView(
              children: [
                14.verticalSpace,
                for (int i = 0; i < 16; i++)
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFC9C9C9).withOpacity(0.12),
                            blurRadius: 20,
                          ),
                        ],
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
                                ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(90.r)),
                                    child: Image.asset(
                                      'assets/images/profilepic.jpg',
                                      width: 50.w,
                                    )),
                                16.horizontalSpace,
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ahmad Sadousi",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'cairo',
                                        color: Dark,
                                      ),
                                    ),
                                    Text(
                                      "Auto-école Elghazi",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'cairo',
                                        color: gray,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 17.w),
                          child: FocusedMenuHolder(
                            menuWidth: MediaQuery.of(context).size.width * 0.50,
                            blurSize: 5.0,
                            menuItemExtent: 45,
                            menuBoxDecoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0.r))),
                            duration: const Duration(milliseconds: 100),
                            animateMenuItems: false,
                            blurBackgroundColor: Colors.black54,
                            bottomOffsetHeight: 100,
                            openWithTap: true,
                            menuItems: <FocusedMenuItem>[
                              FocusedMenuItem(
                                  title: LocaleText(
                                    "add",
                                    style: TextStyle(
                                      color: Dark,
                                      fontFamily: 'cairo',
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  trailingIcon:
                                      const Icon(IconlyBroken.profile),
                                  onPressed: () {
                                    pushNewScreen(context,
                                        screen:   DetailCandidat( id: 113,),
                                        pageTransitionAnimation:
                                            PageTransitionAnimation.cupertino,
                                        withNavBar: false);
                                  }),
                              FocusedMenuItem(
                                  title: LocaleText(
                                    "contact",
                                    style: TextStyle(
                                      color: Dark,
                                      fontFamily: 'cairo',
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  trailingIcon:
                                      const Icon(IconlyBroken.message),
                                  onPressed: () {}),
                            ],
                            onPressed: () {},
                            child: Icon(
                              IconlyBroken.more_square,
                              color: Gry3,
                              size: 23.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                10.verticalSpace,
              ],
            ))
          ],
        ),
      ),
    );
  }
}
