import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permis/functions/wayspop.dart';
import 'package:permis/screens/admin/addCandidat3.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/vars.dart';
import 'AddCoach3.dart';

class AddCandidat2 extends StatefulWidget {
  const AddCandidat2({Key? key}) : super(key: key);

  @override
  State<AddCandidat2> createState() => _AddCandidat2State();
}

class _AddCandidat2State extends State<AddCandidat2> {

File image = File(''); 
File image2 = File('');
@override
  void initState() {
    // TODO: implement initState
    super.initState();
     
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
                    color: Gry3,
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
                "front",
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
                                Navigator.of(context).pop();
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
                  ):
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12.r)),
                            child: Image.file(
                                        image,fit: BoxFit.cover,
                                          ),
                          ),
                
                
                ),
              ),
              ),
            10.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: LocaleText(
                "back",
                style: TextStyle(
                  color: Dark,
                  fontFamily: 'cairo',
                  fontSize: 14.sp,
                ),
              ),
            ),
            10.verticalSpace,
            InkWell(
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
                                Navigator.of(context).pop();
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
          
               child:Center(
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
                  ):ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    child: Image.file(image2,fit:BoxFit.cover))
                ),
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
            String? base64Image; 
            String? base64Image2; 
              final prefs = await SharedPreferences.getInstance(); 
              if(image.path==''){
                base64Image='';
                 showAchievementView(context,false,Locales.string(context, 'fill_all_fields'));
              }
              else{
                base64Image = base64Encode(File(image.path).readAsBytesSync());
              }
              if(image2.path==''){
                base64Image2='';
                      showAchievementView(context,false,Locales.string(context, 'fill_all_fields'));
              }
              else{
                base64Image2 = base64Encode(File(image2.path).readAsBytesSync());
              }
               if(base64Image2.isNotEmpty && base64Image.isNotEmpty){
                   String cinfrontname = image.path.split('/').last;
                 String cinbackname = image2.path.split('/').last;
              prefs.setString('cinfront',base64Image);
              prefs.setString('cinback',base64Image2);
              prefs.setString('cinfrontname',cinfrontname);
              prefs.setString('cinbackname',cinbackname);
              print(cinfrontname);
              print(cinbackname);
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  const AddCandidat3()));
               }  
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
