import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:iconly/iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permis/screens/admin/editPassword.dart';

import '../../DAL/admin.dart';
import '../../const/vars.dart';
import '../../const/loading.dart';
import '../../functions/wayspop.dart';
import 'changeProfilPicture.dart';
import 'editProfile.dart';

class ProfileChoice extends StatefulWidget {
  const ProfileChoice({Key? key}) : super(key: key);

  @override
  State<ProfileChoice> createState() => _ProfileChoiceState();
}

class _ProfileChoiceState extends State<ProfileChoice> {
String email = "";
String name = "";
bool loading = true;
 encapp() async {
    Admin mn=Admin();
    mn=Admin.fromJson(await SessionManager().get('user'));
    setState(() {
      email = mn.email;
      name = mn.name;
      loading = false;
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

    bool isar = true;
    String curr = context.currentLocale.toString();
    if (curr == 'ar') {
      isar = true;
    } else {
      isar = false;
    }

    return loading ?const Loading():Scaffold(
      resizeToAvoidBottomInset:true,
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
          children: [
            21.verticalSpace,
            Center(
              child: Column(
                children: [
                  40.verticalSpace,
                  Text(
                    name,
                    style: TextStyle(
                      color: Dark,
                      fontFamily: 'cairo',
                      fontSize: 14.sp,
                    ),
                  ),
                  Text(
                    email,
                    style: TextStyle(
                      color: gray,
                      fontFamily: 'cairo',
                      fontSize: 14.sp,
                    ),
                  ),
                  20.verticalSpace,

                  20.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight,duration: const Duration(milliseconds: 450), child:const EditProfile()));

                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Gry3,width: 1.2.w),
                                borderRadius: BorderRadius.all(Radius.circular(12.r))),
                            width: 335.w,
                            height: 65.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                19.horizontalSpace,
                                Padding(
                                  padding:   EdgeInsets.symmetric( vertical: 19.h),
                                  child: Icon(
                                    IconlyBroken.profile,
                                    color: Dark,
                                      size: 27.sp,
                                  ),
                                ),
                           40.horizontalSpace,
                                Padding(
                                  padding:   EdgeInsets.symmetric( vertical: 19.h),
                                  child: LocaleText( 'proedit',style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'cairo',
                                    color: Dark,
                                  ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),15.verticalSpace,
                        InkWell(
                          onTap: (){
                            Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight,duration: const Duration(milliseconds: 450), child:const EditPassword()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Gry3,width: 1.2.w),
                                borderRadius: BorderRadius.all(Radius.circular(12.r))),
                            width: 335.w,
                            height: 65.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                19.horizontalSpace,
                                Padding(
                                  padding:   EdgeInsets.symmetric( vertical: 19.h),
                                  child: Icon(
                                    IconlyBroken.unlock,
                                    color: Dark,
                                    size: 27.sp,
                                  ),
                                ),
                                40.horizontalSpace,
                                Padding(
                                  padding:   EdgeInsets.symmetric( vertical: 19.h),
                                  child: LocaleText( 'passchange',style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'cairo',
                                    color: Dark,
                                  ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),15.verticalSpace,
                        InkWell(   onTap: (){
                          Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight,duration: const Duration(milliseconds: 450), child:const ChangeProfilePicture()));
                        },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Gry3,width: 1.2.w),
                                borderRadius: BorderRadius.all(Radius.circular(12.r))),
                            width: 335.w,
                            height: 65.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                19.horizontalSpace,
                                Padding(
                                  padding:   EdgeInsets.symmetric( vertical: 19.h),
                                  child: Icon(
                                    IconlyBroken.image,
                                    color: Dark,
                                    size: 27.sp,
                                  ),
                                ),
                                40.horizontalSpace,
                                Padding(
                                  padding:   EdgeInsets.symmetric( vertical: 19.h),
                                  child: LocaleText( 'prochange',style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'cairo',
                                    color: Dark,
                                  ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                       41.verticalSpace,
                        InkWell(onTap: (){
                          LogoutPopup(context,Locales.string(context, 'usure'));

                        },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(IconlyBroken.logout,color: const Color(0xFFFF0000),size: 26.sp,),
                              12.horizontalSpace,
                              LocaleText('signout', style: TextStyle(
                                color:  const Color(0xFFFF0000),
                                fontFamily: 'cairo',
                                fontSize: 14.sp,
                              ),
      ),

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            90.verticalSpace,
          ],
        ),
      ),

    );
  }
}
