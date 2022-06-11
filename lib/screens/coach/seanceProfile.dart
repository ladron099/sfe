import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:permis/screens/admin/addCandidat.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../const/vars.dart';

class SeanceProfile extends StatefulWidget {
  const SeanceProfile({Key? key}) : super(key: key);

  @override
  State<SeanceProfile> createState() => _SeanceProfileState();
}

class _SeanceProfileState extends State<SeanceProfile> {
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
    name.text = 'Ayoub hachimi';
    school.text = '12:30 => 13:30';
    adresse.text = 'Rue Saada Appt 3 avenue des far';
    date.text = '12/10/2023';
    gender.text = 'MERCEDES 13 ';
    cin.text = 'D91255';
    number.text = '065844558855';
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Gry3, width: 1.2),
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.r))),
                      child: Column(
                        children: [
                          TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 12.w),
                            ),
                            controller: name,
                          ),
                          Container(
                            height: 1.h,
                            color: Gry3,
                          ),
                          TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 12.w),
                            ),
                            controller: school,
                          ),
                          Container(
                            height: 1.h,
                            color: Gry3,
                          ),
                          TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 12.w),
                            ),
                            controller: adresse,
                          ),
                          Container(
                            height: 1.h,
                            color: Gry3,
                          ),
                          TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 12.w),
                            ),
                            controller: date,
                          ),
                          Container(
                            height: 1.h,
                            color: Gry3,
                          ),
                          TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 12.w),
                            ),
                            controller: gender,
                          ),
                          Container(
                            height: 1.h,
                            color: Gry3,
                          ),
                          TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 12.w),
                            ),
                            controller: cin,
                          ),
                          Container(
                            height: 1.h,
                            color: Gry3,
                          ),
                          TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 12.w),
                            ),
                            controller: number,
                          ),
                        ],
                      ),
                    ),
                  ),
                  15.verticalSpace,
                ],
              ),
            ),
            20.verticalSpace,
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 60.w,
        height: 60.w,
        child: FloatingActionButton(
          onPressed: () {
            pushNewScreen(context,
                screen: const AddCandidat(),
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
                withNavBar: false);
          },
          backgroundColor: PrimaryColor,
          child: Icon(
            IconlyBold.message,
            color: Colors.white,
            size: 27.sp,
          ),
        ),
      ),
    );
  }
}
