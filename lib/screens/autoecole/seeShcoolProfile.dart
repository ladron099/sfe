import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permis/const/input.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../DAL/school.dart';
import '../../const/vars.dart';
import '../../const/loading.dart';
import '../../functions/apiFunctions.dart';

class SeeSchoolProfile extends StatefulWidget {
   
  const SeeSchoolProfile({Key? key}) : super(key: key);

  @override
  State<SeeSchoolProfile> createState() => _SeeSchoolProfileState( );
}

class _SeeSchoolProfileState extends State<SeeSchoolProfile> {
  final ImagePicker _picker = ImagePicker();
  File image = File(''); 
  var email = TextEditingController();
  var phoneNo = TextEditingController();
  var address = TextEditingController();
  var city = TextEditingController();
  var created_at = TextEditingController();
  var workingTime = TextEditingController();
  var experience = TextEditingController();
  var status = TextEditingController();
  var description = TextEditingController();
  var name = TextEditingController();  
  bool loading = true;

    Map tt = {};
School data = School();
  String dropdownValue = '';
  encapp() async {
    ApiFunctions a = ApiFunctions();
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var dd=await a.getUser(token);

    data = School.fromJson(json.decode(dd.body));
    setState(()   {
      name.text = data.name;
      email.text = data.email;
      phoneNo.text = data.phoneNo;
      address.text = data.address;
      created_at.text = data.created_at;
      city.text = data.city;
      workingTime.text = data.workingTime;
      experience.text = data.experience;
      status.text = data.status == 1
          ? Locales.string(context, 'actif')
          : Locales.string(context, 'inactif');
      description.text = data.description == 'pas de description valable'
          ? ''
          : data.description;
          loading = false;

    });
  }
  @override
  void initState() {
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
                            '$pict/${data.logo}',
                            width: 100.w,
                            height: 100.w,
                            fit: BoxFit.cover,
                          )
                         
                  ),
                  10.verticalSpace,
                  Text(
                    name.text,
                    style: TextStyle(
                      color: Dark,
                      fontFamily: 'cairo',
                      fontSize: 14.sp,
                    ),
                  ),
                  Text(
                  data.school_name,
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
                        input(Locales.string(context, 'email'), false,
                            IconlyBroken.notification, email, true),
                        10.verticalSpace,
                        input(Locales.string(context, 'phoneNo'), false,
                            IconlyBroken.lock, phoneNo, true),
                        10.verticalSpace,
                        input(Locales.string(context, 'schooladress'), false,
                            IconlyBroken.notification, address, true),
                        10.verticalSpace,
                        input(Locales.string(context, 'city'), false,
                            IconlyBroken.notification, city, true),
                        10.verticalSpace,
                        input(Locales.string(context, 'workingTime'), false,
                            IconlyBroken.notification, workingTime, true),
                        10.verticalSpace,
                        input(Locales.string(context, 'created_at'), false,
                            IconlyBroken.calendar, created_at, true),
                        10.verticalSpace,
                        input(Locales.string(context, 'yearsexperience'), false,
                            IconlyBroken.notification, experience, true),
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
                                data.status == '1' ? 'actif' : 'inactif'),
                            false,
                            IconlyBroken.arrow_down_2,
                            status,
                            true),
                        10.verticalSpace,
                        TextFormField(
                          readOnly: true,
                          controller: description,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20.h, horizontal: 13.w),
                            focusColor: PrimaryColor,
                            labelText: Locales.string(context, 'description'),
                            labelStyle: TextStyle(
                                color: gray,
                                fontWeight: FontWeight.bold,
                                fontFamily: "cairo",
                                fontSize: 14.sp),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.r)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.9.w,
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.r)),
                                borderSide: const BorderSide(
                                  color: Gry3,
                                  width: 1.9,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.r)),
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 1.9,
                                )),
                          ),
                          minLines:
                              6, // any number you need (It works as the rows for the textarea)
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                  
                          
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
      //       School sc = School();
      //       sc.id = data.id;
      //       sc.phoneNo=phoneNo.text;
      //       sc.name=name.text;
      //       sc.school_name=data.school_name;
      //       sc.city=city.text;
      //       sc.address=address.text;
      //       sc.description=description.text==''?'pas de description valable':description.text;
      //       print(sc);
      //       var b = await a.editSchool(token,sc,'123456789');
      //       if (b.statusCode == 200) {
      //         pushNewScreen(context,
      //             screen: SchoolHomePage(index: 0),
      //             pageTransitionAnimation: PageTransitionAnimation.cupertino);
      //         showAchievementView(
      //             context, true, 'school modifie avec success');
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
