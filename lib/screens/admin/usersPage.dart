import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:iconly/iconly.dart';
import 'package:permis/screens/admin/addAdmin.dart';
import 'package:permis/screens/admin/adminHomePage.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/vars.dart';
import '../../const/loading.dart';
import '../../functions/apiFunctions.dart';
import '../../functions/wayspop.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List test =[];
  List<String> candidatNames =[];
  List<String> email =[]; 
  List <int> id =[];
  List <int> status =[];
  List <String> role=[]; 
  bool loading=true;
  Map  data ={};
   getAllData() async {
    test = [];
    candidatNames = [];
    role=[];
    email = []; 
    id = [];
    ApiFunctions a = ApiFunctions();
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var bod = await a.getAll(token);
    
    setState(() {
      test = json.decode(bod.body) as List;
    });
    for (var a in test) {
      var g = json.encode(a);
      var c = json.decode(g);
      
      setState(() { 
        c['name'] ?? (c['name'] = '');
        c['email'] ?? (c['email'] = '');
        c['id']?? (c['id'] = 0); 
        c['status']?? (c['status'] = 0); 
        candidatNames.add(c['name']);
        email.add(c['email']);
        role.add(c['role']);
        id.add(c['id']);
        status.add(c['status']);
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
              'users',
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
                    email = [];
                    candidatNames = [];
                    role.clear();
                    status.clear();
                    id.clear();
                    for (var a in test) {
                      var g = json.encode(a);
                      var c = json.decode(g);
                      setState(() { 
        candidatNames.add(c['name']);
        email.add(c['email']);
        id.add(c['id']); 
        status.add(c['status']);
        role.add(c['role']);
                      });
                    }
                  } else { 
                    email.clear();
                    candidatNames.clear();
                    role.clear();
                    status.clear();
                    id.clear();
                    for (var a in test) {
                      var g = json.encode(a);
                      var c = json.decode(g);
                      if (c['name']
                          .toUpperCase()
                          .contains(value.toUpperCase())) {
                        setState(() { 
        candidatNames.add(c['name']);
        email.add(c['email']);
        id.add(c['id']); 
        status.add(c['status']);
        role.add(c['role']);
                        });
                      }
                    }
                    if (candidatNames.isEmpty) {
                      setState(() { 
                        candidatNames.clear();
                        id.clear();
                        email.clear(); 
                        candidatNames.add('No Results');
                        email.add('No Results');
                         status.add(0);
                          role.add('No Results');
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
                  for(int i=0;i<candidatNames.length;i++)
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
                                   candidatNames[i],
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
                             11.horizontalSpace,
                                 Column(
                                   children: [
                                     LocaleText(
                                       role[i],
                                       style: TextStyle(
                                         fontSize: 14.sp,
                                         fontFamily: 'cairo',
                                         color: gray,
                                       ),
                                     ),
                                     LocaleText(
                                       status[i]==0?'inactif':'actif',
                                       style: TextStyle(
                                         fontSize: 14.sp,
                                         fontFamily: 'cairo',
                                         color: gray,
                                       ),
                                     ),
                                   ],
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
                              FocusedMenuItem(title: LocaleText(status[i]==0?'tashghil':'ighla9',style: TextStyle(
                                
                                color:status[i]!=0?const Color(0XFFFF0000):Dark,
                                fontFamily: 'cairo',
                                fontSize: 14.sp,
                              ),),trailingIcon: const Icon( IconlyBroken.edit,
                               
                              ) ,onPressed: () async {
                               ApiFunctions a = ApiFunctions();
                               final prefs = await SharedPreferences.getInstance();
                               String token = prefs.getString('token') ?? '';
                               int newstatus=status[i]==0?1:0;
                               var b=await a.updateStatus(token, id[i], newstatus);
                               print(b.body);
                               setState(() {
                                    status[i] =status[i]==0?1:0;
                               });

                              }), 
                              FocusedMenuItem(title: LocaleText("Delete",style: TextStyle(
                                color:const Color(0XFFFF0000),
                                fontFamily: 'cairo',
                                fontSize: 14.sp,
                              ),),trailingIcon: const Icon(Icons.delete,color: Color(0XFFFF0000),) ,onPressed: (){
                               DeletePopup(context, Locales.string(context, 'accountdelete'),id[i],'user',AdminHomePage(index: 0));

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
floatingActionButton: SizedBox(
  width: 60.w,
  height: 60.w,
  child:   FloatingActionButton(
    onPressed: (){
      pushNewScreen(context,
          screen: const AddAdmin(),
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
