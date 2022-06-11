import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permis/DAL/cars.dart';
import 'package:permis/functions/apiFunctions.dart';
import 'package:permis/screens/admin/carsProfile.dart';
import 'package:permis/screens/admin/schoolProfile.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../DAL/school.dart';
import '../../const/vars.dart';
import '../../const/loading.dart';
import 'addCar.dart';
import 'addSchool.dart';
import 'drawerNavigator.dart';

class CarsList extends StatefulWidget {
  const CarsList({Key? key}) : super(key: key);

  @override
  State<CarsList> createState() => _CarsListState();
}

class _CarsListState extends State<CarsList> {
  bool loading = true;
  List<String> pic = [];
  List<String> brand = [];
  List<int> id = [];
  List<String> version = [];
  List<String> engine = [];
  List<String> color = [];
  List<String> photo = [];
  List<String> matricule = [];
  List<String> experience = [];
  List<String> kilometrage = [];
  List<String> workingTime = [];
  List<String> status = [];
  List<String> created_at = [];
  List<String> updated_at = [];
  List<int> school_id = [];
  List test = [];

  getCars() async {
    test = [];
    pic = [];
    brand = [];
    id = [];
    version = [];
    engine = [];
    color = [];
    matricule = [];
    experience = [];
    kilometrage = [];
    workingTime = [];
    status = [];
    created_at = [];
    updated_at = [];
    school_id = [];
    ApiFunctions a = ApiFunctions();
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var data= await a.getUser(token);
    Map all = json.decode(data.body);
    int idm=all['id'];
    var bod = await a.getCars(token);

    if(bod.statusCode == 200){
      
    setState(() {
      test = json.decode(bod.body) as List;
    });
    for (var a in test) {
      var g = json.encode(a);
      var c = json.decode(g);
      setState(() {
        c['photo'] ?? (c['photo'] = '');
        c['status'] ?? (c['status'] = '');
        c['created_at'] ?? (c['created_at'] = '');
        c['updated_at'] ?? (c['updated_at'] = ''); 
        c['kilometrage'] ?? (c['kilometrage'] = ''); 
        c['matricule'] ?? (c['matricule'] = '');
        c['color'] ?? (c['color'] = '');
        c['engine'] ?? (c['engine'] = '');
        c['version'] ?? (c['version'] = ''); 
        c['id'] ?? (c['id'] = '');
        c['brand'] ?? (c['brand'] = '');
        c['school_id'] ?? (c['school_id'] = '');
        pic.add(c['photo']);
        brand.add(c['brand']);
        id.add(c['id']);
        version.add(c['version']);
        engine.add(c['engine']);
        color.add(c['color']);
        matricule.add(c['matricule']); 
        kilometrage.add(c['kilometrage']); 
        status.add(c['status']);
        created_at.add(c['created_at']);
        updated_at.add(c['updated_at']);
        school_id.add(c['school_id']);
        loading=false;
      });
    }
    }else{
      setState(() {
        loading=false;
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
              'cars',
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
                key: const GlobalObjectKey('car'),
                onChanged: (value) {
                  if (value.isEmpty) {
                 
                 setState(() {
                      pic = [];
                    brand = [];
                 });
                    for (var a in test) {
                      var g = json.encode(a);
                      var c = json.decode(g);
                      setState(() {
                        pic.add(c['photo']);
                        brand.add(c['brand']);
                      });
                    }
                  } else {
                   setState(() {
                      pic = [];
                    brand = [];
                   });
                    for (var a in test) {
                      var g = json.encode(a);
                      var c = json.decode(g);
                      if (c['brand']
                          .toUpperCase()
                          .contains(value.toUpperCase())) {
                        setState(() {
                          pic.add(c['photo']);
                          brand.add(c['brand']);
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
            GridView.builder(
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
                    Cars sc = Cars();
                    setState(() {
                      sc.id = id[index];
                      sc.brand = brand[index];
                      sc.version = version[index];
                      sc.engine = engine[index];
                      sc.color = color[index];
                      sc.matricule = matricule[index]; 
                      sc.kilometrage = kilometrage[index]; 
                      sc.status = status[index];
                      sc.created_at = created_at[index];
                      sc.updated_at = updated_at[index];
                      sc.photo = pic[index];
                      sc.school_id = school_id[index];
                    });
                    pushNewScreen(context,
                        screen: CarsProfile(sc),
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
                                      '$car/${pic[index]}',
                                      fit: BoxFit.cover,
                                      width: 75.w,
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                brand[index],
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
                    child: const AddCar()));
          },
        ),
      ),
    );
  }
}
