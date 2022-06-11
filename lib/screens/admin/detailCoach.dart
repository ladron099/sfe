import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:permis/screens/admin/adminHomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/vars.dart';
import '../../const/loading.dart';
import '../../const/roundedButton.dart';
import '../../functions/apiFunctions.dart';
import '../../functions/wayspop.dart';

class DetailCoach extends StatefulWidget {
  int id;
    DetailCoach({required this.id, Key? key}) : super(key: key);

  @override
  State<DetailCoach> createState() => _DetailCoachState(id);
}

class _DetailCoachState extends State<DetailCoach> {
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
  _DetailCoachState(this.id);
getData() async {
  ApiFunctions a = ApiFunctions();
  final prefs = await SharedPreferences.getInstance();
  String token=prefs.getString('token') ?? '';
  var data = await a.searchCoachId(token, id);
  Map all= json.decode(data.body);
  setState(() {
    name.text=all['name'];
    date.text=all['birthdate'].toString();
    number.text=all['phoneNo'].toString();
    photo=all['photo'];
    cin.text=all['cni'].toString(); 
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
                        '$mopict/$photo',
                        width: 100.w,
                        height: 100.w,
                        fit: BoxFit.fill,
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
                   ],
              ),
            ),
             12.verticalSpace,
                        RoundedButton(
                          'delete',
                          () {
                            DeletePopup(
                              context,
                            Locales.string(context, 'accountdelete'),
                              id,
                              'coach',
                              AdminHomePage(index: 0)
                            );
                          },
                          Color(0xffD16868),
                        ),
            20.verticalSpace,
          ],
        ),
      ),

    );
  }
}