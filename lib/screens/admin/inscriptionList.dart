import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:iconly/iconly.dart';
import 'package:permis/DAL/school.dart';
import 'package:permis/screens/admin/addAdmin.dart';
import 'package:permis/screens/admin/inscriptionProfile.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/vars.dart';
import '../../const/loading.dart';
import '../../functions/apiFunctions.dart';
import '../../functions/wayspop.dart';

class InscriptionList extends StatefulWidget {
  const InscriptionList({Key? key}) : super(key: key);

  @override
  State<InscriptionList> createState() => _InscriptionListState();
}

class _InscriptionListState extends State<InscriptionList> {
  List test =[];
  List<String> schoolName =[];
  List <String>fullname =[];
  List<String> email =[]; 
  List <int> id =[];
  List <int> status =[];
  List <String> phoneNo = [];
  List <String> city = [];
  List <String> address=[]; 
  bool loading=true;
  Map  data ={};
   getAllData() async {
    test = [];
    schoolName = [];
    city = [];
    address=[];
    phoneNo=[];
    fullname = [];
    email = []; 
    id = [];
    ApiFunctions a = ApiFunctions();
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var bod = await a.getInscription(token);
    log(bod.body);
    setState(() {
      test = json.decode(bod.body) as List;
    });
    for (var a in test) {
      var g = json.encode(a);
      var c = json.decode(g);
      
      setState(() { 
        c['schoolName'] ?? (c['schoolName'] = '');
        c['fullname'] ?? (c['fullname'] = '');
        c['city'] ?? (c['city'] = '');
        c['address'] ?? (c['address'] = '');
        c['phoneNo'] ?? (c['phoneNo'] = '');
        c['email'] ?? (c['email'] = '');
        c['id']?? (c['id'] = 0); 
        c['status']?? (c['status'] = 0); 
        schoolName.add(c['schoolName']);
        email.add(c['email']);
        address.add(c['address']);
        id.add(c['id']);
        fullname.add(c['fullname']);
        status.add(c['status']);
        city.add(c['city']);
        phoneNo.add(c['phoneNo']);
            loading = false;
      });
    }

  }

  @override
  initState() {
    super.initState();
    getAllData();
  }
  TextEditingController search=TextEditingController();
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
     // resizeToAvoidBottomInset: false,
      appBar: AppBar(
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
      body: Padding(
        padding:   EdgeInsets.symmetric(horizontal: 20.0.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start  ,
          children: [
            25.verticalSpace,
            LocaleText(
              'inscription',
              style: TextStyle(
                color: Dark,
                fontFamily: 'cairo',
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            15.verticalSpace,
TextField(
     key: const GlobalObjectKey('inscription'),
                onChanged: (value) {
                  if (value.isEmpty) { 
                    email = [];
                    schoolName = [];
                    city = []; 
                    phoneNo=[];
                    fullname = [];  
                    address.clear();
                    status.clear();
                    id.clear();
                    for (var a in test) {
                      var g = json.encode(a);
                      var c = json.decode(g);
                      setState(() { 
        schoolName.add(c['schoolName']);
        email.add(c['email']);
        id.add(c['id']); 
        status.add(c['status']);
        address.add(c['address']);
        phoneNo.add(c['phoneNo']);
        city.add(c['city']);
        fullname.add(c['fullname']);

                      });
                    }
                  } else { 
                     email = [];
                    schoolName = [];
                    city = []; 
                    phoneNo=[];
                    fullname = [];  
                    address.clear();
                    status.clear();
                    id.clear();
                    for (var a in test) {
                      var g = json.encode(a);
                      var c = json.decode(g);
                      if (c['fullname']
                          .toUpperCase()
                          .contains(value.toUpperCase())) {
                        setState(() { 
        schoolName.add(c['schoolName']);
        email.add(c['email']);
        id.add(c['id']); 
        status.add(c['status']);
        address.add(c['address']);
        phoneNo.add(c['phoneNo']);
        city.add(c['city']);
        fullname.add(c['fullname']);
                        });
                      }
                    }
                    if (schoolName.isEmpty) {
                      setState(() { 
                        schoolName.clear();
                        id.clear();
                        status.clear();
                        address.clear();
                        phoneNo.clear();
                        email.clear(); 
                        city.clear();
                        fullname.clear();
                        schoolName.add('No Results');
                        id.add(0);
                        status.add(5);
                        address.add('No Results');
                        phoneNo.add('No Results');
                        email.add('No Results');
                        city.add('No Results');
                        fullname.add('No Results');

                        email.add('No Results');
                         status.add(0);
                          address.add('No Results');
                        id.add(0);
                      });
                    }
                  }
                },
        style: const TextStyle(color:  gray),
        controller: search,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
          suffixIcon: const Icon(
          IconlyBroken.search,
            color: gray,
          ),
          focusColor: PrimaryColor,
          labelText: Locales.string(context, "search2"),
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

            15.verticalSpace,
            Expanded(
              child:ListView(
                children: [
                  14.verticalSpace,
                  for(int i=0;i<schoolName.length;i++)
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFC9C9C9).withOpacity(0.12),
                            blurRadius: 20,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(12.r))),
                    width: 335.w,
                    height: 93.h,
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            13.verticalSpace,
                            Row(
                              children: [
                                23.horizontalSpace,
                             Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(
                                   fullname[i],
                                   style: TextStyle(
                                     fontSize: 14.sp,
                                     fontWeight: FontWeight.bold,
                                     fontFamily: 'cairo',
                                     color: Dark,
                                   ),
                                 ),
                                 Text(
                                   email[i],
                                   style: TextStyle(
                                     fontSize: 14.sp,
                                     fontFamily: 'cairo',
                                     color: gray,
                                   ),
                                 ),
                               ],
                             ),
                             25.horizontalSpace,
                               status[i]!=5?  Container(
                                   width: 60.w,
                                   decoration:BoxDecoration(
                                      color:    status[i]==0?Colors.red:status[i]==1?Colors.green:Colors.orange,
                                      borderRadius: BorderRadius.all(Radius.circular(7.r)),
                                     border: Border.all(color:gray)
                                   ),
                                   child: Center(
                                     child: LocaleText(
                                        status[i]==0?'declined':status[i]==1?'accepted':'pending',
                                       style: TextStyle(
                                         fontSize: 14.sp,
                                         fontFamily: 'cairo',
                                         color: Colors.white,
                                       ),
                                     ),
                                   ),
                                 ):Container(
                                 
                                 ),
                              
                              ],
                            ),

                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 17.w),
                          child: FocusedMenuHolder(
                            menuWidth: MediaQuery.of(context).size.width*0.50,
                            blurSize: 5.0,
                            menuItemExtent: 45,
                            menuBoxDecoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.all(Radius.circular(25.0.r))),
                            duration: const Duration(milliseconds: 100),
                            animateMenuItems: false,
                            blurBackgroundColor: Colors.black54,
                            bottomOffsetHeight: 100,
                            openWithTap: true,
                            menuItems: <FocusedMenuItem>[ 
                              FocusedMenuItem(title: LocaleText(status[i]==1?'ighla9':'tashghil',style: TextStyle(
                                
                                color:status[i]==1?const Color(0XFFFF0000):Dark,
                                fontFamily: 'cairo',
                                fontSize: 14.sp,
                              ),),trailingIcon: const Icon( IconlyBroken.edit,
                               
                              ) ,onPressed: () async {
                               ApiFunctions a = ApiFunctions();
                               final prefs = await SharedPreferences.getInstance();
                               String token = prefs.getString('token') ?? '';
                               int newstatus=status[i]==1?0:1;
                               var b=await a.updateInscription(token, id[i], newstatus);
                               print(b.body);
                               print(b.statusCode);
                               setState(() {
                                    status[i] =status[i]==1?0:1;
                               });

                              }), 
                              FocusedMenuItem(title: LocaleText("add",style: TextStyle(
                                 
                                fontFamily: 'cairo',
                                fontSize: 14.sp,
                              ),),trailingIcon: const Icon(IconlyBroken.profile, ) ,onPressed: (){
                              School sc = School();
                              sc.name = schoolName[i];
                              sc.email = email[i];
                              sc.address=address[i];
                              sc.school_name=fullname[i];
                              sc.id=id[i];
                              sc.phoneNo=phoneNo[i];
                              sc.city=city[i];
                              sc.status=status[i];
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>InscriptionProfile( sc)));
                            
                              }),
                            ],
                            onPressed: (){},
                            child: Icon(
                            id[i]!=0?     IconlyBroken.more_square:null,
                              color: Gry3,
                              size: 23.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ), 
                    60.verticalSpace,
                ],
              )
            ),
          
          ],
        ),
      ),

    );
  }
}
