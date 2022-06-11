
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:permis/const/vars.dart';

import '../../const/roundedButton.dart';

class SchoolChangeProfilePicture extends StatefulWidget {
  const SchoolChangeProfilePicture({Key? key}) : super(key: key);

  @override
  State<SchoolChangeProfilePicture> createState() => _SchoolChangeProfilePictureState();
}

class _SchoolChangeProfilePictureState extends State<SchoolChangeProfilePicture> {
  var name = TextEditingController();
  var school = TextEditingController();
  var adresse = TextEditingController();
  var date2 = TextEditingController();
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
                      borderRadius: BorderRadius.all(Radius.circular(100.r)),
                      child: Image.asset(
                        'assets/images/profilepic.jpg',
                        width: 190.w,
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
                        FlatButton(
                          onPressed: () {},
                          color: Colors.white,
                          minWidth: 220.w,
                          height: 55.h,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0.r),
                              side: BorderSide(color: PrimaryColor, width: 1.4.w)),
                          child: LocaleText(
                            "picchange",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: "cairo",
                                fontWeight: FontWeight.bold,
                                color: PrimaryColor),
                          ),
                        ),
                        41.verticalSpace,
                        RoundedButton('continue', (){
    //  pushNewScreen(context, screen: DoneCourse(),   pageTransitionAnimation : PageTransitionAnimation.cupertino,withNavBar:false );
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
