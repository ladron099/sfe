import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:permis/DAL/Candidat.dart';
import 'package:permis/const/input.dart';
import 'package:permis/functions/wayspop.dart';
import 'package:permis/screens/autoecole/schoolHomePage.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/vars.dart';
import '../../const/loading.dart';
import '../../functions/apiFunctions.dart';

class SchoolEditCandidat extends StatefulWidget {
  int id;
    SchoolEditCandidat({required this.id, Key? key}) : super(key: key);

  @override
  State<SchoolEditCandidat> createState() => _SchoolEditCandidatState(id);
}

class _SchoolEditCandidatState extends State<SchoolEditCandidat> {
  var name = TextEditingController();
  var school = TextEditingController();
  var date = TextEditingController();
  var email = TextEditingController();
  var gender = TextEditingController();
  var cin = TextEditingController();
  var number = TextEditingController(); 
  bool loading=true;
  String photo=''; 
  String tarifs = '';
  int id ;
  _SchoolEditCandidatState(this.id);
  Candidat mn =Candidat();
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
    email.text=all['email'];
    gender.text =all['sexe']=="1"?'Homme':'Femme';
    school.text=all['school_name'].toString();
    mn.paid=all['paid'].toString();
    mn.sexe=all['sexe'];
    mn.birthdate=all['birthdate'];
    mn.photo=all['photo'];            
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
                    email.text,
                    style: TextStyle(
                      color: gray,
                      fontFamily: 'cairo',
                      fontSize: 14.sp,
                    ),
                  ),
                  20.verticalSpace,
           Padding(
             padding:   EdgeInsets.symmetric(horizontal: 20.
             w),
             child: input('name', false, IconlyBroken.notification, name, true),
           ),
           12.verticalSpace,
           Padding(
             padding:   EdgeInsets.symmetric(horizontal: 20.
             w),
             child: input('email', false, IconlyBroken.notification, email, true),
           ),
           12.verticalSpace,
           Padding(
             padding:   EdgeInsets.symmetric(horizontal: 20.
             w),
            // child: input('number', false, IconlyBroken.notification, number, false),
             child:TextField(
                 keyboardType: TextInputType.number,
        style: TextStyle(color: Dark,fontFamily: 'cairo',fontSize: 14.sp), 
        controller: number, 
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
         
          focusColor: PrimaryColor,
          labelText: 'number',
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
           12.verticalSpace,
           Padding(
             padding:   EdgeInsets.symmetric(horizontal: 20.
             w),
             child: input('cin', false, IconlyBroken.notification, cin, false),
           ),
                 15.verticalSpace,
                 ],
              ),
            ),
            20.verticalSpace,
          ],
        ),
      ),
floatingActionButton: Container(
        width: 60.w,
        height: 60.w,
        child: FloatingActionButton(
           onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            String token = prefs.getString('token') ?? '';
            mn.name=name.text;
            mn.email=email.text;
            mn.phoneNo=number.text;
            mn.cni=cin.text;
            mn.id=id;
            ApiFunctions a = ApiFunctions();
            var b = await a.editCandidat(mn,token);
            if (b.statusCode == 200) {
              pushNewScreen(context,
                  screen: SchoolHomePage(index: 0),
                  pageTransitionAnimation: PageTransitionAnimation.cupertino);
              showAchievementView(
                  context, true, 'candidat modifie avec success');
            } else {
              showAchievementView(context, false, b.body);
              print(b.body);
            }
          },
          backgroundColor: PrimaryColor,
          child: Icon(
            IconlyBroken.edit,
            color: Colors.white,
            size: 27.sp,
          ),
        ),
      ),
    );
  }
}