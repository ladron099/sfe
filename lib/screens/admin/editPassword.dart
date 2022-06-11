import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:permis/const/input.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/vars.dart';
import '../../const/roundedButton.dart';
import '../../functions/apiFunctions.dart';
import 'adminHomePage.dart';

class EditPassword extends StatefulWidget {
  const EditPassword({Key? key}) : super(key: key);

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
 String token ='';
  int id=0;
  String email='';
  String name='';
 getId() async {
       SharedPreferences prefs = await SharedPreferences.getInstance();
   setState(() {    id = prefs.getInt('id')??0;
        token = prefs.getString('token')??'';
        email = prefs.getString('email')??'';
        name = prefs.getString('name')??'';});
 
    }
   @override
  void initState() {
    super.initState();
    getId();
  }

    TextEditingController previousPassword=TextEditingController();
    TextEditingController newPassword=TextEditingController();
    TextEditingController newPassword2=TextEditingController();
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
                 
                  10.verticalSpace,
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
                        input(Locales.string(context, 'oldpass'), false, IconlyLight.show, previousPassword,false),
                        10.verticalSpace,input(Locales.string(context, 'confirmoldpass'), false, IconlyLight.show, newPassword,false),
                        10.verticalSpace,input(Locales.string(context, 'newpass',), false, IconlyLight.show, newPassword2,false),

      41.verticalSpace,
                        RoundedButton('continue', () async {
                            ApiFunctions a = ApiFunctions();
                            print(id);
                            print(token);
                          //  await a.modifyPassword(token,id, previousPassword.text, newPassword.text);
                     

                          pushNewScreen(context, screen: const AdminHomePage(index: 0,),   pageTransitionAnimation : PageTransitionAnimation.cupertino,withNavBar:false );
                        },PrimaryColor)

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
