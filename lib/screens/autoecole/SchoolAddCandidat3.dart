import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permis/DAL/Candidat.dart';
import 'package:permis/DAL/moniteur.dart';
import 'package:permis/const/input.dart';
import 'package:permis/functions/wayspop.dart'; 
import 'package:permis/screens/autoecole/schoolHomePage.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/vars.dart';
import '../../functions/apiFunctions.dart';

class SchoolAddCandidat3 extends StatefulWidget {
  const SchoolAddCandidat3({Key? key}) : super(key: key);

  @override
  State<SchoolAddCandidat3> createState() => _SchoolAddCandidat3State();
}

class _SchoolAddCandidat3State extends State<SchoolAddCandidat3> {

TextEditingController tarif =TextEditingController();
TextEditingController paid =TextEditingController();
File image = File('');
File image2 = File('');

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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            17.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 30.w,
                  height: 30.w,
                  decoration: BoxDecoration(
                    color: PrimaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(90.r)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: .4.h),
                    child: Text(
                      '1',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontFamily: 'cairo'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  height: 4.h,
                  width: 119.w,
                  color: PrimaryColor,
                ),
                Container(
                  width: 30.w,
                  height: 30.w,
                  decoration: BoxDecoration(
                    color: PrimaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(90.r)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: .4.h),
                    child: Text(
                      '2',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontFamily: 'cairo'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  height: 4.h,
                  width: 119.w,
                  color: PrimaryColor,
                ),
                Container(
                  width: 30.w,
                  height: 30.w,
                  decoration: BoxDecoration(
                    color: PrimaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(90.r)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.4.h),
                    child: Text(
                      '3',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontFamily: 'cairo'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            17.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: LocaleText(
                "addcandidat",
                style: TextStyle(
                    color: Dark,
                    fontFamily: 'cairo',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            5.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: LocaleText(
                "contrat",
                style: TextStyle(
                  color: Dark,
                  fontFamily: 'cairo',
                  fontSize: 14.sp,
                ),
              ),
            ),
            10.verticalSpace,
            Center(
              child: InkWell(
                   onTap: () async {
                     
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0.r),
                    ),
                    title: LocaleText('picchange',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: PrimaryColor,
                          fontFamily: 'cairo',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        )),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: [
                          InkWell(
                            onTap: () async {
                                  Navigator.of(context).pop();
                              final pick = ImagePicker();
                              final pickedImage = await pick.getImage(
                                  source: ImageSource.camera);
                              setState(() {
                                final pickedImageFile = File(pickedImage!.path);
                                image = File(pickedImageFile.path);
                                image = pickedImageFile;
                              });
                            },
                            child: Row(
                              children: [
                                Icon(
                                  IconlyBroken.camera,
                                  color: PrimaryColor,
                                  size: 26.h,
                                ),
                                14.horizontalSpace,
                                LocaleText('takepic',
                                    style: TextStyle(
                                      color: Dark,
                                      fontFamily: 'cairo',
                                      fontSize: 14.sp,
                                    )),
                              ],
                            ),
                          ),
                          9.verticalSpace,
                          InkWell(
                            onTap: () async {
                              final pick = ImagePicker();
                              final pickedImage = await pick.getImage(
                                  source: ImageSource.gallery);
                              setState(() {
                                final pickedImageFile = File(pickedImage!.path);
                                image = File(pickedImageFile.path);
                                image = pickedImageFile;
                              });
                            },
                            child: Row(
                              children: [
                                Icon(
                                  IconlyBroken.image,
                                  color: PrimaryColor,
                                  size: 26.h,
                                ),
                                14.horizontalSpace,
                                LocaleText('choosepic',
                                    style: TextStyle(
                                      color: Dark,
                                      fontFamily: 'cairo',
                                      fontSize: 14.sp,
                                    )),
                              ],
                            ),
                          ),
                          9.verticalSpace,
                          InkWell(
                            onTap: () {
                              setState(() {
                                image = File('');
                              });
                            },
                            child: Row(
                              children: [
                                Icon(
                                  IconlyBroken.delete,
                                  color: const Color(0xffD16868),
                                  size: 26.h,
                                ),
                                14.horizontalSpace,
                                LocaleText('removepic',
                                    style: TextStyle(
                                      color: const Color(0xffD16868),
                                      fontFamily: 'cairo',
                                      fontSize: 14.sp,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );

                // });
              },
          
                child: Container(
                  width: 335,
                  height: 199.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    border: Border.all(color: Gry3),
                  ),
                  child: image.path==''?Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        IconlyBroken.camera,
                        size: 40.sp,
                        color: Gry3,
                      ),18.verticalSpace,
                      LocaleText('camera' , style: TextStyle(
                        color: Gry3,
                        fontFamily: 'cairo',
                        fontSize: 14.sp,
                      ),
                      ),
              
                    ],
                  ):ClipRRect(borderRadius: BorderRadius.all(Radius.circular(12.r)),
                  child:Image.file(image,fit: BoxFit.cover,),
                  
                  )
                ),
              ),
            ),
            10.verticalSpace,
                  Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: LocaleText(
                "doctor",
                style: TextStyle(
                  color: Dark,
                  fontFamily: 'cairo',
                  fontSize: 14.sp,
                ),
              ),
            ),
            Center(
              child: InkWell(
                   onTap: () async {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0.r),
                    ),
                    title: LocaleText('picchange',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: PrimaryColor,
                          fontFamily: 'cairo',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        )),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: [
                          InkWell(
                            onTap: () async {
                                Navigator.of(context).pop();
                              final pick = ImagePicker();
                              final pickedImage = await pick.getImage(
                                  source: ImageSource.camera);
                              setState(() {
                                final pickedImageFile = File(pickedImage!.path);
                                image2 = File(pickedImageFile.path);
                                image2 = pickedImageFile;
                              });
                            },
                            child: Row(
                              children: [
                                Icon(
                                  IconlyBroken.camera,
                                  color: PrimaryColor,
                                  size: 26.h,
                                ),
                                14.horizontalSpace,
                                LocaleText('takepic',
                                    style: TextStyle(
                                      color: Dark,
                                      fontFamily: 'cairo',
                                      fontSize: 14.sp,
                                    )),
                              ],
                            ),
                          ),
                          9.verticalSpace,
                          InkWell(
                            onTap: () async {
                              final pick = ImagePicker();
                              final pickedImage = await pick.getImage(
                                  source: ImageSource.gallery);
                              setState(() {
                                final pickedImageFile = File(pickedImage!.path);
                                image2 = File(pickedImageFile.path);
                                image2 = pickedImageFile;
                              });
                            },
                            child: Row(
                              children: [
                                Icon(
                                  IconlyBroken.image,
                                  color: PrimaryColor,
                                  size: 26.h,
                                ),
                                14.horizontalSpace,
                                LocaleText('choosepic',
                                    style: TextStyle(
                                      color: Dark,
                                      fontFamily: 'cairo',
                                      fontSize: 14.sp,
                                    )),
                              ],
                            ),
                          ),
                          9.verticalSpace,
                          InkWell(
                            onTap: () {
                                Navigator.of(context).pop();
                              setState(() {
                                image2 = File('');
                              });
                            },
                            child: Row(
                              children: [
                                Icon(
                                  IconlyBroken.delete,
                                  color: const Color(0xffD16868),
                                  size: 26.h,
                                ),
                                14.horizontalSpace,
                                LocaleText('removepic',
                                    style: TextStyle(
                                      color: const Color(0xffD16868),
                                      fontFamily: 'cairo',
                                      fontSize: 14.sp,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );

                // });
              },
          
                child: Container(
                  width: 335,
                  height: 199.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    border: Border.all(color: Gry3),
                  ),
                  child: image2.path==''?Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        IconlyBroken.camera,
                        size: 40.sp,
                        color: Gry3,
                      ),18.verticalSpace,
                      LocaleText('camera' , style: TextStyle(
                        color: Gry3,
                        fontFamily: 'cairo',
                        fontSize: 14.sp,
                      ),
                      ),
              
                    ],
                  ):ClipRRect(borderRadius: BorderRadius.all(Radius.circular(12.r)),
                  child:Image.file(image2,fit: BoxFit.cover,),
                  
                  )
                ),
              ),
            ),
            10.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: LocaleText(
                "rosom",
                style: TextStyle(
                  color: Dark,
                  fontFamily: 'cairo',
                  fontSize: 14.sp,
                ),
              ),
            ),
            10.verticalSpace,
           
            Padding(
              padding:   EdgeInsets.symmetric(horizontal: 33.0.w),
              child:  TextField(
                          keyboardType: TextInputType.number,
        style: TextStyle(color:   gray,fontFamily: 'cairo',fontSize: 14.sp),
        readOnly: false,
        controller: tarif,
        obscureText:  false,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w), 
          focusColor: PrimaryColor,
          labelText: Locales.string(context, 'rosom'),
          labelStyle: TextStyle(
              color: gray,
              fontWeight: FontWeight.bold,
              fontFamily: "cairo",
              fontSize: 14.sp),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
              borderSide: BorderSide(
                color: Colors.white,
                width: 1.9.w,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
              borderSide: const BorderSide(
                color: Gry3,
                width: 1.9,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1.9,
              )),
        )),

            ), 
              
            10.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: LocaleText(
                "paid",
                style: TextStyle(
                  color: Dark,
                  fontFamily: 'cairo',
                  fontSize: 14.sp,
                ),
              ),
            ),
            10.verticalSpace,
           
            Padding(
              padding:   EdgeInsets.symmetric(horizontal: 33.0.w),
              child:  TextField(
                          keyboardType: TextInputType.number,
        style: TextStyle(color:   gray,fontFamily: 'cairo',fontSize: 14.sp),
        readOnly: false,
        controller: paid,
        obscureText:  false,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w), 
          focusColor: PrimaryColor,
          labelText: Locales.string(context, 'paid'),
          labelStyle: TextStyle(
              color: gray,
              fontWeight: FontWeight.bold,
              fontFamily: "cairo",
              fontSize: 14.sp),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
              borderSide: BorderSide(
                color: Colors.white,
                width: 1.9.w,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
              borderSide: const BorderSide(
                color: Gry3,
                width: 1.9,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1.9,
              )),
        )),

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
              String? base64Image; 
              String? base64Image2; 
               if(image.path==''||tarif.text==''||image2.path==''||paid.text==''){
                base64Image='';
                base64Image2='';
                   showAchievementView(context,false,Locales.string(context, 'fill_all_fields'));
              }
              else{
                base64Image = base64Encode(File(image.path).readAsBytesSync());
                base64Image2 = base64Encode(File(image2.path).readAsBytesSync());
           
            print(image.path);
            Candidat mn = Candidat();
            final prefs = await SharedPreferences.getInstance();
            String candidatImage= prefs.getString('addimage')??''; 
            String candidatImageName= prefs.getString('addimageName')??''; 
            String fullname = prefs.getString('addfullname')??'';
            String date=prefs.getString('adddate')??'';
            String email=prefs.getString('addemail')??'';
            String sexe= prefs.getString('addgender')??'';
            String schoolName= prefs.getString('addschool')??'';
            String cni =prefs.getString('addcin')??'';
            String phoneNo=  prefs.getString('addphoneno')??''; 
            String cniFront= prefs.getString('cinfront')??'';
            print(cniFront);
            String cniBack=  prefs.getString('cinback')??'';
            String cniFrontName=  prefs.getString('cinfrontname')??'';
            String cniBackName=  prefs.getString('cinbackname')??'';
            String schoolId=prefs.getString('school_id')??'';
            String carteMoniteurName = image.path.split('/').last;
          String token = prefs.getString('token') ?? '';
            mn.name = fullname;
            mn.email =email;
            mn.school_name =schoolName;
            mn.photoName = candidatImageName;
            mn.photo = candidatImage;
            mn.birthdate =date;
            mn.phoneNo = phoneNo;
            mn.sexe =sexe;
            mn.cni=cni; 
            mn.cniRecto=cniFront;
            mn.cniRectoName=cniFrontName;
            mn.cniVerso=cniBack;
            mn.cniVersoName=cniBackName;
            mn.certificat=base64Image;
            mn.certificatName=carteMoniteurName;
            mn.contrat=base64Image2;
            mn.contratName=image2.path.split('/').last; 
            mn.paid=paid.text;
            mn.tarif=tarif.text;
            print(tarif.text);
            print(paid.text);
            print(mn.toJson());
            ApiFunctions a = ApiFunctions();
           var response = await a.addCandidat(mn,schoolId,token);
            print(cniBackName);
            print(cniFrontName);
            print(carteMoniteurName);
            print(candidatImageName);

           print(response.body);
           print(response.statusCode);
      if(response.statusCode==201){
              pushNewScreen(context,
              screen: const SchoolHomePage(index: 0),
              pageTransitionAnimation:
              PageTransitionAnimation.cupertino);
          showAchievementView(context,true,'candidat ajoute avec success');
      }
      else{
          showAchievementView(context,false,'erreur dans le systeme');
      }   }
          },
          label: LocaleText(
            "continue",
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
