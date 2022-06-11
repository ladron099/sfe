import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/vars.dart';
import '../../const/loading.dart';
import '../../functions/apiFunctions.dart';

class DetailCandidat extends StatefulWidget {
  int id;
    DetailCandidat({required this.id, Key? key}) : super(key: key);

  @override
  State<DetailCandidat> createState() => _DetailCandidatState(id);
}

class _DetailCandidatState extends State<DetailCandidat> {
  var name = TextEditingController();
  var school = TextEditingController();
  var date = TextEditingController();
  var gender = TextEditingController();
  var cin = TextEditingController();
  var number = TextEditingController();
  String email='';
  bool loading=true;
  String photo=''; 
  String tarifs = '';
  int id ;
  _DetailCandidatState(this.id);
getData() async {
  ApiFunctions a = ApiFunctions();
  final prefs = await SharedPreferences.getInstance();
  String token=prefs.getString('token') ?? '';
  var data = await a.searchCandidatId(token, id);
  Map all= json.decode(data.body);
  setState(() {
    name.text=all['name'];
    date.text=all['birthdate'].toString();
    number.text=all['phoneNo'].toString();
    photo=all['photo'];
    cin.text=all['cni'].toString();
    tarifs=all['tarifs'].toString();
    email=all['email'];
    gender.text =all['sexe']=="1"?'Homme':'Femme';
    school.text=all['school_name'].toString();
    loading = false;
    });

}
  @override 
  void initState() {
    super.initState();
    getData();
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
                      borderRadius: BorderRadius.all(Radius.circular(90.r)),
                      child: Image.network(
                        '$canpict/$photo',
                        width: 100.w,
                        height: 100.w,
                        fit: BoxFit.cover,
                      )),
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
                    email,
                    style: TextStyle(
                      color: gray,
                      fontFamily: 'cairo',
                      fontSize: 14.sp,
                    ),
                  ),
                  20.verticalSpace,
             Padding(
               padding:   EdgeInsets.symmetric(horizontal: 20.0.h),
               child: Row(
                 children: [
                   Container(
                     height: 100.h,
                     width: 160.w,
                     decoration: BoxDecoration(
                         color: Colors.white,
                         border: Border.all(color: Gry3,width: 1.2),
                         borderRadius:
                         BorderRadius.all(Radius.circular(12.r))),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         const Spacer(),
                         LocaleText('scoremax',   style: TextStyle(
                           fontSize: 14.sp,
                           fontFamily: 'cairo',
                           color: Dark,

                         ),),
                         const Spacer(),
                         Text('40',   style: TextStyle(
                           fontSize: 22.sp,
                           fontWeight: FontWeight.bold,
                           fontFamily: 'cairo',
                           color: Dark,

                         ),),     const Spacer(),
                       ],
                     ),
                   ),
                   15.horizontalSpace,
                   Container(
                     height: 100.h,
                     width: 160.w,
                     decoration: BoxDecoration(
                         color: Colors.white,
                         border: Border.all(color: Gry3,width: 1.2),
                         borderRadius:
                         BorderRadius.all(Radius.circular(12.r))),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         const Spacer(),
                         LocaleText('scoremin',   style: TextStyle(
                           fontSize: 14.sp,
                           fontFamily: 'cairo',
                           color: Dark,

                         ),),
                         const Spacer(),
                         Text('22',   style: TextStyle(
                           fontSize: 22.sp,
                           fontWeight: FontWeight.bold,
                           fontFamily: 'cairo',
                           color: Dark,

                         ),),     const Spacer(),
                       ],
                     ),
                   ),

                 ],
               ),
             ),
                  20.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                        border: Border.all(color: Gry3,width: 1.2),
                          borderRadius:
                          BorderRadius.all(Radius.circular(12.r))),
                      child: Column(
                        children: [
                          TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 20.h,horizontal: 12.w),

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
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 20.h,horizontal: 12.w),

                            ),
                            controller: school,
                          ),    Container(
                            height: 1.h,
                            color: Gry3,
                          ),
                       
                          TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 20.h,horizontal: 12.w),

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
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 20.h,horizontal: 12.w),

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
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 20.h,horizontal: 12.w),

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
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 20.h,horizontal: 12.w),

                            ),
                            controller: number,
                          ),


                        ],
                      ),
                    ),
                  ),
                  15.verticalSpace,
                  Container(
                    width: 335.w,
                    height: 93.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Gry3,width: 1.2),
                        borderRadius:
                        BorderRadius.all(Radius.circular(12.r))),
                    child: Padding(
                      padding:   EdgeInsets.symmetric(horizontal: 21.w),
                      child: Column(

                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [       14.verticalSpace,
                              LocaleText('money',   style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'cairo',
                        color: Dark,
                      ),),9.verticalSpace,
                          Row(
                            children: [
                              Text(tarifs,   style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'cairo',
                        color: Dark,
                      ),),
                              LocaleText('somme',   style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'cairo',
                        color: Dark,
                      ),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            20.verticalSpace,
          ],
        ),
      ),

    );
  }
}