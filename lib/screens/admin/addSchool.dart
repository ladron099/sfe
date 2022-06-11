import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:permis/DAL/school.dart';
import 'package:permis/const/input.dart';
import 'package:permis/functions/apiFunctions.dart';
import 'package:permis/screens/admin/adminHomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/vars.dart';
import '../../functions/wayspop.dart';

class AddSchool extends StatefulWidget {
  const AddSchool({Key? key}) : super(key: key);

  @override
  State<AddSchool> createState() => _AddSchoolState();
}

class _AddSchoolState extends State<AddSchool> {
  var fullname = TextEditingController();
  var schoolname = TextEditingController();
  var adresse = TextEditingController();
  var city = TextEditingController();
  var gender = TextEditingController();
  var schooladress = TextEditingController();
  var telephone = TextEditingController();
  var email = TextEditingController();

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
            25.verticalSpace,
            LocaleText(
              "Addschool",
              style: TextStyle(
                  color: Dark,
                  fontFamily: 'cairo',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
            17.verticalSpace,
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Column(
                children: [
                  input(Locales.string(context, 'fullname'), false,
                      IconlyBroken.notification, fullname, false),
                  10.verticalSpace,
                  input(Locales.string(context, 'schoolname'), false,
                      IconlyBroken.notification, schoolname, false),
                  10.verticalSpace,
                  input(Locales.string(context, 'email'), false,
                      IconlyBroken.notification, email, false),
                  10.verticalSpace,
                  input(Locales.string(context, 'city'), false,
                      IconlyBroken.notification, city, false),
                  10.verticalSpace,
                  input(Locales.string(context, 'schooladress'), false,
                      IconlyBroken.notification, schooladress, false),
                  10.verticalSpace,
                  input(Locales.string(context, 'telephone'), false,
                      IconlyBroken.notification, telephone, false)
                ],
              ),
            ),
            90.verticalSpace,
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 220.w,
        height: 55.h,
        child: FloatingActionButton.extended(
          backgroundColor: PrimaryColor,
          onPressed: () async {
            School sc=School();
            sc.name=fullname.text;
            sc.school_name=schoolname.text;
            sc.address=schooladress.text;
            sc.city=city.text;
            sc.description='';
            sc.email=email.text;
            sc.phoneNo=telephone.text;

            print('telephone ${telephone.text}');
            print('city ${city.text}');
            print(' email ${email.text}');
            print('scchool adress  ${schooladress.text}');
            print('fullname ${fullname.text}');
            print('school name ${schoolname.text}');
            final prefs = await SharedPreferences.getInstance();
            String token = prefs.getString('token') ?? '';
            ApiFunctions a = ApiFunctions();
            var man = await a.addSchool(
            sc, token
              );
              print(email.text);
            print('111111111111111 $man');
            print('2222222222222222${man.statusCode}');
            if (man.statusCode == 201) {
              showAchievementView(context, true, 'ajoute avec success');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AdminHomePage(index: 0)));
            } else {
              showAchievementView(context, false, Locales.string(context, 'fill_all_fields'));
            }
          },
          label: LocaleText(
            "addacc",
            style: TextStyle(fontSize: 16.sp, fontFamily: "cairo"),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0.r))),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
