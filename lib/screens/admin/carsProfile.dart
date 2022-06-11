import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permis/const/input.dart';
import 'package:permis/screens/admin/adminHomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../DAL/cars.dart';
import '../../DAL/school.dart';
import '../../const/vars.dart';
import '../../const/loading.dart';
import '../../const/roundedButton.dart';
import '../../functions/apiFunctions.dart';
import '../../functions/wayspop.dart';

class CarsProfile extends StatefulWidget {
  Cars data;
  CarsProfile(this.data);

  @override
  State<CarsProfile> createState() => _CarsProfileState(data);
}

class _CarsProfileState extends State<CarsProfile> {
  bool loading = true;
  final ImagePicker _picker = ImagePicker();
  File image = File('');
  Cars data;
  _CarsProfileState(this.data);
  var school_name = TextEditingController();
  var brand = TextEditingController();
  var engine = TextEditingController();
  var created_at = TextEditingController();
  var color = TextEditingController();
  var matricule = TextEditingController();
  var status = TextEditingController(); 
  String holder = '';
  @override
  void initState() {
    super.initState();
    encapp();
  }

  String dropdownValue = '';
  encapp() async {
    String gmail = '';
    ApiFunctions a = ApiFunctions();
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    print(data.id);
    var mail = await a.searchSchoolid(token,data.school_id);
    print(mail.statusCode);
    Map h = json.decode(mail.body);
    print(h);
    setState(() {
      gmail = h['name'];
      print(gmail);
      school_name.text = gmail;
      brand.text = data.brand;
      engine.text = data.engine;
      created_at.text = data.created_at; 
      status.text = data.status == '1'
          ? Locales.string(context, 'actif')
          : Locales.string(context, 'inactif');

      dropdownValue = data.status == '1'
          ? Locales.string(context, 'actif')
          : Locales.string(context, 'inactif');
          color.text = data.color;
          matricule.text = data.matricule;
          loading=false;
    });
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
    String dropdown;

    return loading ?const Loading():Scaffold(
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
                    borderRadius: BorderRadius.all(Radius.circular(3456789.r)),
                    child: Image.network(
                            '$car/${data.photo}',
                            width: 100.w,
                            height: 100.w,
                            fit: BoxFit.cover,
                          )
                         
                  ),
                  10.verticalSpace,
                  Text(
                    data.brand,
                    style: TextStyle(
                      color: Dark,
                      fontFamily: 'cairo',
                      fontSize: 14.sp,
                    ),
                  ),
                  Text(
                    school_name.text,
                    style: TextStyle(
                      color: gray,
                      fontFamily: 'cairo',
                      fontSize: 14.sp,
                    ),
                  ),
                  20.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Column(
                      children: [
                        input(Locales.string(context, 'school_name'), false,
                            IconlyBroken.notification, school_name, true),
                        10.verticalSpace,
                        input(Locales.string(context, 'brand'), false,
                            IconlyBroken.lock, brand, true),
                        10.verticalSpace,
                        input(Locales.string(context, 'schooladress'), false,
                            IconlyBroken.notification, engine, true),
                        10.verticalSpace,
                        input(Locales.string(context, 'color'), false,
                            IconlyBroken.notification, color, true),
                        10.verticalSpace,
                        input(Locales.string(context, 'created_at'), false,
                            IconlyBroken.calendar, created_at, true),
                        10.verticalSpace,
                        input(Locales.string(context, 'yearsmatricule'), false,
                            IconlyBroken.notification, matricule, true),
                        10.verticalSpace,
                        // Container(
                        //   width: 335.w,
                        //   height: 60.h,
                        //   //  margin: EdgeInsets.all(20),
                        //   child: DropdownButtonHideUnderline(
                        //     child: GFDropdown(
                        //       padding: EdgeInsets.all(15.w),
                        //       borderRadius: BorderRadius.circular(10.r),
                        //       border: BorderSide(color: Gry3, width: 1.9.w),
                        //       dropdownButtonColor: Colors.white,
                        //       value: dropdownValue,
                        //       onChanged: (newValue) {
                        //         setState(() {
                        //           dropdownValue = '$newValue';
                        //         });
                        //       },
                        //       items: [
                        //         Locales.string(context, 'actif'),
                        //         Locales.string(context, 'inactif')
                        //       ]
                        //           .map((value) => DropdownMenuItem(
                        //                 value: value,
                        //                 child: Text(value),
                        //               ))
                        //           .toList(),
                        //     ),
                        //   ),
                        // ),
                        // 10.verticalSpace,
                        input(
                            Locales.string(context,
                                data.status == 1 ? 'actif' : 'inactif'),
                            false,
                            IconlyBroken.arrow_down_2,
                            status,
                            true),
                        10.verticalSpace,
                         RoundedButton(
                          'delete',
                          () {
                            DeleteCarPopup(
                              context,
                              Locales.string(context, 'accountdelete'),
                              data.id,
                              AdminHomePage(index: 0),
                            );
                          },
                          Color(0xffD16868),
                        ),
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
      // floatingActionButton: Container(
      //   width: 60.w,
      //   height: 60.w,
      //   child: FloatingActionButton(
      //     onPressed: () async {
      //       final prefs = await SharedPreferences.getInstance();
      //       String token = prefs.getString('token') ?? '';
      //       ApiFunctions a = ApiFunctions();
      //       var b = await a.editSchool(
      //           school_name.text,
      //           data.name,
      //           fullname,
      //           data.city,
      //           engine.text,
      //           brand.text,
      //           description.text == ''
      //               ? 'pas de description valable'
      //               : description.text,
      //           token,
      //           data.id);
      //       if (b.statusCode == 200) {
      //         pushNewScreen(context,
      //             screen: AdminHomePage(index: 0),
      //             pageTransitionAnimation: PageTransitionAnimation.cupertino);
      //         showAchievementView(
      //             context, true, 'candidat modifie avec success');
      //       } else {
      //         showAchievementView(context, false, b.body);
      //       }
      //     },
      //     backgroundColor: PrimaryColor,
      //     child: Icon(
      //       IconlyBroken.edit,
      //       color: Colors.white,
      //       size: 27.sp,
      //     ),
      //   ),
      // ),
    );
  }
}
