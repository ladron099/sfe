
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:permis/const/vars.dart';
import 'package:permis/screens/autoecole/schoolHomePage.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../const/input.dart';
import '../../const/roundedButton.dart';
class SchoolEditPassword extends StatefulWidget {
  const SchoolEditPassword({Key? key}) : super(key: key);

  @override
  State<SchoolEditPassword> createState() => _SchoolEditPasswordState();
}

class _SchoolEditPasswordState extends State<SchoolEditPassword> {
  var name = TextEditingController();
  var school = TextEditingController();
  var adresse = TextEditingController();
  var date = TextEditingController();
  var gender = TextEditingController();
  var cin = TextEditingController();
  var number = TextEditingController();
  String dropdownvalue = 'Homme';
  late String newValue = "Homme";
  String holder = '';

  void getDropDownItem() {
    setState(() {
      holder = newValue;
    });
  }

  // List of items in our dropdown menu
  var items = ['Homme', 'Femme'];

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
                  ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(90.r)),
                      child: Image.asset(
                        'assets/images/profilepic.jpg',
                        width: 100.w,
                      )),
                  10.verticalSpace,
                  Text(
                    "Ayoub Hachimi",
                    style: TextStyle(
                      color: Dark,
                      fontFamily: 'cairo',
                      fontSize: 14.sp,
                    ),
                  ),
                  Text(
                    "Auto-école Elghazi",
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
                        input(Locales.string(context, 'oldpass'), false, IconlyLight.show, name,false),
                        10.verticalSpace,input(Locales.string(context, 'confirmoldpass'), false, IconlyLight.show, school,false),
                        10.verticalSpace,input(Locales.string(context, 'newpass',), false, IconlyLight.show, adresse,false),

      41.verticalSpace,
                        RoundedButton('continue', (){
                          pushNewScreen(context, screen: const SchoolHomePage(index: 0,),   pageTransitionAnimation : PageTransitionAnimation.cupertino,withNavBar:false );
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
