
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:iconly/iconly.dart';
import 'package:permis/DAL/Candidat.dart';
import 'package:permis/const/vars.dart';
import 'package:permis/functions/wayspop.dart';
import 'package:permis/screens/autoecole/schoolAddCandidat.dart';
import 'package:permis/screens/autoecole/schoolDetailCandidat.dart';
import 'package:permis/screens/autoecole/schoolEditCandidat.dart';
import 'package:permis/screens/autoecole/schoolHomePage.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/loading.dart';
import '../../functions/apiFunctions.dart';

class SchoolCandidatsList extends StatefulWidget {
  const SchoolCandidatsList({Key? key}) : super(key: key);

  @override
  State<SchoolCandidatsList> createState() => _SchoolCandidatsListState();
}

class _SchoolCandidatsListState extends State<SchoolCandidatsList> {
    List test =[];
  List<String> candidatNames =[];
  List<String> schoolName =[];
  List <String> pic =[];
  List <int> id =[];
  bool loading=true;

   getSchools() async {
    test = [];
    candidatNames = [];
    schoolName = [];
    pic = [];
    id = [];
    ApiFunctions a = ApiFunctions();
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    int myId = prefs.getInt('id')??0;
    var bod = await a.getCandidatSchool(token,myId);
    print(bod.body);
    setState(() {
      test = json.decode(bod.body) as List;
    });
    for (var a in test) {
      var g = json.encode(a);
      var c = json.decode(g);
      setState(() {
        c['photo'] ?? (c['photo'] = '');
        c['name'] ?? (c['name'] = '');
        c['school_name'] ?? (c['school_name'] = '');
        c['id']?? (c['id'] = 0);
        pic.add(c['photo']);
        candidatNames.add(c['name']);
        schoolName.add(c['school_name']);
        id.add(c['id']);
            loading = false;
      });
    }

  }

  @override
  initState() {
    super.initState();
    getSchools();
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
              'candidats',
              style: TextStyle(
                color: Dark,
                fontFamily: 'cairo',
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            15.verticalSpace,
           TextField(
     key: const GlobalObjectKey('schools'),
                onChanged: (value) {
                  if (value.isEmpty) {
                    pic = [];
                    schoolName = [];
                    candidatNames = [];
                    id.clear();
                    for (var a in test) {
                      var g = json.encode(a);
                      var c = json.decode(g);
                      setState(() {
                         pic.add(c['photo']);
        candidatNames.add(c['name']);
        schoolName.add(c['school_name']);
        id.add(c['id']);
                      });
                    }
                  } else {
                    pic.clear();
                    schoolName.clear();
                    candidatNames.clear();
                    id.clear();
                    for (var a in test) {
                      var g = json.encode(a);
                      var c = json.decode(g);
                      if (c['name']
                          .toUpperCase()
                          .contains(value.toUpperCase())) {
                        setState(() {
                          pic.add(c['photo']);
                          candidatNames.add(c['name']);
                          schoolName.add(c['school_name']);
                          id.add(c['id']);
                        });
                      }
                    }
                    if (candidatNames.isEmpty) {
                      setState(() {
                        pic.clear();
                        candidatNames.clear();
                        id.clear();
                        schoolName.clear();
                        pic.add('photo.png');
                        candidatNames.add('No Results');
                        schoolName.add('No Results');
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
                                ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(90.r)),
                                    child: Image.network(
                                      '$canpict/${pic[i]}',
                                      width: 50.w,
                                      fit: BoxFit.cover,
                                      height: 50.w,
                                    )),
                                16.horizontalSpace,
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      candidatNames[i],
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'cairo',
                                        color: Dark,
                                      ),
                                    ),
                                    Text(
                                      schoolName[i],
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'cairo',
                                        color: gray,
                                      ),
                                    ),
                                  ],
                                )
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
                              FocusedMenuItem(title: LocaleText("add",style: TextStyle(
                            color:Dark,
                            fontFamily: 'cairo',
                            fontSize: 14.sp,
                          ),),trailingIcon: const Icon(IconlyBroken.profile) ,onPressed: (){
                                pushNewScreen(context,
                                    screen:   SchoolDetailCandidat(id:id[i]),
                                    pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                                    withNavBar: false);
                              }),
                              FocusedMenuItem(title: LocaleText("edit",style: TextStyle(
                                color:Dark,
                                fontFamily: 'cairo',
                                fontSize: 14.sp,
                              ),),trailingIcon: const Icon(IconlyBroken.edit) ,onPressed: () async {

              
                             
                                
                              
                                pushNewScreen(context,
                                    screen:  SchoolEditCandidat( id: id[i], ) ,
                                    pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                                    withNavBar: false);

                              }),
                              FocusedMenuItem(title: LocaleText("contact",style: TextStyle(
                                color:Dark,
                                fontFamily: 'cairo',
                                fontSize: 14.sp,
                              ),),trailingIcon: const Icon(IconlyBroken.message) ,onPressed: (){}),
                              FocusedMenuItem(title: LocaleText("Delete",style: TextStyle(
                                color:const Color(0XFFFF0000),
                                fontFamily: 'cairo',
                                fontSize: 14.sp,
                              ),),trailingIcon: const Icon(Icons.delete,color: Color(0XFFFF0000),) ,onPressed: (){
                                DeletePopup(context, Locales.string(context, 'deletesure'),id[i],'candidat',SchoolHomePage(index: 0));

                              }),
                            ],
                            onPressed: (){},
                            child: Icon(
                           id[i]!=0?   IconlyBroken.more_square:null,
                              color: Gry3,
                              size: 23.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  10.verticalSpace,
                ],
              )
            )
          ],
        ),
      ),
floatingActionButton: SizedBox(
  width: 60.w,
  height: 60.w,
  child:   FloatingActionButton(
    onPressed: (){
      pushNewScreen(context,
          screen: const SchoolAddCandidat(),
          pageTransitionAnimation:
          PageTransitionAnimation.cupertino,
          withNavBar: false);
    },
    backgroundColor: PrimaryColor,
    child: Icon(
      IconlyBold.add_user,
      color: Colors.white,
      size: 27.sp,
    ),
  ),
),
    );
  }
}
