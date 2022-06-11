import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permis/const/loading.dart';
import 'package:permis/functions/apiFunctions.dart';
import 'package:permis/screens/autoecole/schoolCoachAdd1.dart';
import 'package:permis/screens/autoecole/schoolCoachProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/vars.dart'; 

class SchoolCoachList extends StatefulWidget {
  const SchoolCoachList({Key? key}) : super(key: key);

  @override
  State<SchoolCoachList> createState() => _CoachListState();
}

class _CoachListState extends State<SchoolCoachList> {
  List<String> pic = [];
  List<String> coachName = [];
  List test = [];
  List <int>id= [];
  bool loading=true;

  getCars() async {
    test = [];
    pic = [];
    coachName = [];
    id = [];
    ApiFunctions a = ApiFunctions();
    final prefs = await SharedPreferences.getInstance();
   
    String token = prefs.getString('token') ?? '';
     var response =await a.getUser(token);
     Map testt=json.decode(response.body);
     int idm=testt['id'];
    var coach = await a.getCoachSchool(token,idm);
    setState(() {
      test = json.decode(coach.body) as List;
    });
    for (var a in test) {
      var g = json.encode(a);
      var c = json.decode(g);
      setState(() {
        c['photo'] ?? (c['photo'] = '');
        c['name'] ?? (c['name'] = '');
        c['id'] ?? (c['id'] = '');
        pic.add(c['photo']);
        coachName.add(c['name']);
        id.add(c['id']);
        loading= false;
      });
    }
  }

 

  @override
  void initState() {
    getCars();
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
           backgroundColor: PrimaryBg,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            25.verticalSpace,
            LocaleText(
              'coach',
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
                key: const GlobalObjectKey('schools'),
                onChanged: (value) {
                  if (value.isEmpty) {
                  setState(() {
                      pic = [];
                    coachName = [];
                    id = [];
                  });
                    for (var a in test) {
                      var g = json.encode(a);
                      var c = json.decode(g);
                      setState(() {
                        pic.add(c['photo']);
                        coachName.add(c['name']);
                        id.add(c['id']);
                      });
                    }
                  } else {
                    setState(() {
                      
                    pic.clear();
                    coachName.clear();
                    id.clear();
                    });
                    for (var a in test) {
                      var g = json.encode(a);
                      var c = json.decode(g);
                      if (c['name']
                          .toUpperCase()
                          .contains(value.toUpperCase())) {
                        setState(() {
                          pic.add(c['photo']);
                          coachName.add(c['name']);
                          id.add(c['id']);
                        });
                      }
                    }
                    // if (coachName.isEmpty) {
                    //   setState(() {
                    //     pic.clear();
                    //     id.clear();
                    //     coachName.clear();
                    //     pic.add('photo.png');
                    //     coachName.add('No Results');
                    //     id.add(0);
                    //   });
                    // }
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
            Expanded(
              child: GridView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                itemCount: coachName.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SchoolCoachProfile(
                              id: id[index],
                            ),
                          ),
                        );
                      },
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
                                        '$mopict/${pic[index]}',
                                        fit: BoxFit.cover,
                                        width: 75.w,
                                        height: 75.w,
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  coachName[index],
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
                    child: const SChoolCoachAdd1())
                    
                    
                    );
          },
        ),
      ),
    );
  }
}
