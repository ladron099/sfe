import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permis/functions/apiFunctions.dart';
import 'package:permis/screens/admin/schoolProfile.dart';
import 'package:permis/screens/login.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../DAL/school.dart';
import '../../const/vars.dart';
import '../../const/loading.dart';
import 'addSchool.dart';
import 'drawerNavigator.dart';

class SchoolPage extends StatefulWidget {
  const SchoolPage({Key? key}) : super(key: key);

  @override
  State<SchoolPage> createState() => _SchoolPageState();
}

class _SchoolPageState extends State<SchoolPage> {
  bool loading = true;
  List<String> pic = [];
  List<String> schoolName = [];
  List<int> id = [];
  List<String> address = [];
  List<String> city = [];
  List<String> description = [];
  List<String> logo = [];
  List<String> phoneNo = [];
  List<String> experience = [];
  List<String> founded = [];
  List<String> workingTime = [];
  List<int> status = [];
  List<String> createdAt = [];
  List<String> updatedAt = [];
  List test = [];

  getSchools() async {
    test = [];
    pic = [];
    schoolName = [];
    id = [];
    address = [];
    city = [];
    description = [];
    phoneNo = [];
    experience = [];
    founded = [];
    workingTime = [];
    status = [];
    createdAt = [];
    updatedAt = [];

    ApiFunctions a = ApiFunctions();
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var bod = await a.getSchool(token);
    setState(() {
      test = json.decode(bod.body) as List;
    });
    for (var a in test) {
      var g = json.encode(a);
      var c = json.decode(g);
      setState(() {
        c['logo'] ?? (c['logo'] = '');
        c['status'] ?? (c['status'] = '');
        c['createdAt'] ?? (c['createdAt'] = '');
        c['updatedAt'] ?? (c['updatedAt'] = '');
        c['experience'] ?? (c['experience'] = '');
        c['founded'] ?? (c['founded'] = '');
        c['workingTime'] ?? (c['workingTime'] = '');
        c['phoneNo'] ?? (c['phoneNo'] = '');
        c['description'] ?? (c['description'] = '');
        c['city'] ?? (c['city'] = '');
        c['address'] ?? (c['address'] = '');
        c['name'] ?? (c['name'] = '');
        c['id'] ?? (c['id'] = '');
        pic.add(c['logo']);
        schoolName.add(c['name']);
        id.add(c['id']);
        address.add(c['address']);
        city.add(c['city']);
        description.add(c['description']);
        phoneNo.add(c['phoneNo']);
        experience.add(c['experience']);
        founded.add(c['founded']);
        workingTime.add(c['workingTime']);
        status.add(c['status']);
        createdAt.add(c['createdAt']);
        updatedAt.add(c['updatedAt']);
        loading=false;
      });
    }
  }



  @override
  void initState() {
    getSchools();
    super.initState();
    final formKey = GlobalKey<FormState>();
  }

  var search = TextEditingController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
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
      key: _key,
      resizeToAvoidBottomInset: false,
      drawer: const DrawerNavigator(),
      appBar:AppBar(
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
         backgroundColor: PrimaryBg,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            25.verticalSpace,
            LocaleText(
              'autoecole',
              style: TextStyle(
                color: Dark,
                fontFamily: 'cairo',
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            5.verticalSpace,
            // input(Locales.string(context, 'search2'), false,
            //     IconlyBroken.search, search, false),
            TextField(
                key: const GlobalObjectKey('school'),
                onChanged: (value) {
                  if (value.isEmpty) {
                   setState(() {
                      pic = [];
                    schoolName = [];
                   });
                    for (var a in test) {
                      var g = json.encode(a);
                      var c = json.decode(g);
                      setState(() {
                        pic.add(c['logo']);
                        schoolName.add(c['name']);
                      });
                    }
                  } else {
                   setState(() {
                      pic = [];
                    schoolName = [];
                   });
                    for (var a in test) {
                      var g = json.encode(a);
                      var c = json.decode(g);
                      if (c['name']
                          .toUpperCase()
                          .contains(value.toUpperCase())) {
                        setState(() {
                          pic.add(c['logo']);
                          schoolName.add(c['name']);
                        });
                      }
                    }
                  }
                },
                style: const TextStyle(color: gray),
                controller: search,
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    IconlyBroken.search,
                    color: Gry3,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                  focusColor: PrimaryColor,
                  labelText: Locales.string(context, 'search2'),
                  labelStyle: TextStyle(
                      color: gray,
                      fontWeight: FontWeight.bold,
                      fontFamily: "cairo",
                      fontSize: 14.sp),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.r)),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.9,
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
            SizedBox(
              child: SingleChildScrollView(
                child: GridView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                  ),
                  itemCount: pic.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        School sc = School();
                        setState(() {
                          sc.id = id[index];
                          sc.name = schoolName[index];
                          sc.address = address[index];
                          sc.city = city[index];
                          sc.description = description[index];
                          sc.phoneNo = phoneNo[index];
                          sc.experience = experience[index];
                          sc.founded = founded[index];
                          sc.workingTime = workingTime[index];
                          sc.status = status[index];
                          sc.created_at = createdAt[index];
                          sc.updated_at = updatedAt[index];
                          sc.logo = pic[index];
                        });
                        pushNewScreen(context,
                            screen: SchoolProfile(sc),
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                            withNavBar: false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 160.w,
                          height: 145.h,
                          child: Container(
                              height: 79.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Gry3, width: 1.2.w),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.r))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Spacer(),
                                  SizedBox(
                                    width: 60,
                                    child: AspectRatio(
                                      aspectRatio: 60 / 60,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(70.r)),
                                        child: Image.network(
                                          '$pict/${pic[index]}',
                                          fit: BoxFit.cover,
                                          width: 75.w,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    schoolName[index],
                                    style: TextStyle(
                                      color: Dark,
                                      fontSize: 14.sp,
                                      fontFamily: 'cairo',
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              )),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 60.w,
        height: 60.w,
        child: FloatingActionButton(
          backgroundColor: PrimaryColor,
          child: Icon(
            IconlyBroken.plus,
            size: 25.sp,
          ),
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.leftToRight,
                    duration: const Duration(milliseconds: 450),
                    child: const AddSchool()));
          },
        ),
      ),
    );
  }
}
