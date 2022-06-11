import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:permis/DAL/cars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permis/const/input.dart';
import 'package:permis/functions/wayspop.dart';
import 'package:permis/screens/admin/adminHomePage.dart'; 
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/vars.dart';
import '../../functions/apiFunctions.dart';
import 'addCoach2.dart';

class AddCar extends StatefulWidget {
  const AddCar({Key? key}) : super(key: key);

  @override
  State<AddCar> createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  final ImagePicker _picker = ImagePicker();
  File image = File('');
  String dropval = '';
  int SelectedId=0;
  var status = TextEditingController();
  @override
  void initState() {
    super.initState();
    final formKey = GlobalKey<FormState>();
    encapp();
  }

  List<String> schoolName = [];
  List test = [];
  List id=[];
  String dropdownValue = '';
  encapp() async {
    schoolName = [];
    id = [];
    ApiFunctions a = ApiFunctions();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var sch = await a.getSchool(token);
    setState(() {
      test = json.decode(sch.body) as List;
    });
    for (var a in test) {
      var g = json.encode(a);
      var c = json.decode(g);
      setState(() {
        c['name'] ?? (c['name'] = '');
        schoolName.add(c['name']);
        id.add(c['id']);

      });
    }
    setState(() {
      dropval = schoolName[0];
    });
  }

  var brand = TextEditingController(); 
  var engine = TextEditingController();
  var color = TextEditingController();
  var matricule = TextEditingController();
  var version = TextEditingController();
  var school = TextEditingController();
  var kilometrage = TextEditingController();
  String dropdownvalue = 'Diesel';
  late String newValue = "Diesel";
  String holder = '';

  void getDropDownItem() {
    setState(() {
      holder = newValue;
    });
  }

  // List of items in our dropdown menu
  var items = ['Diesel', 'Essence','Electique'];
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
          children: [
            17.verticalSpace,
           LocaleText(
              "addcar",
              style: TextStyle(
                  color: Dark,
                  fontFamily: 'cairo',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
            17.verticalSpace,
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
                               Navigator.pop(context);
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
                height: 100.w,
                width: 100.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(90.r)),
                    border: Border.all(color: Gry3, width: 1.2.w)),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(90.r)),
                  child: image.path == ''
                      ? Image.network(
                          '$mopict/photo.png',
                          width: 98.w,
                          height: 98.w,
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          image,
                          width: 98.w,
                          height: 98.w,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
            10.verticalSpace,
            LocaleText(
              "carpic",
              style: TextStyle(
                color: Dark,
                fontFamily: 'cairo',
                fontSize: 14.sp,
              ),
            ),
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Column(
                children: [
                  input(Locales.string(context, 'brand'), false,
                      IconlyBroken.notification, brand, false),
                  10.verticalSpace,
                  10.verticalSpace,
                  input(Locales.string(context, 'version'), false,
                      IconlyBroken.notification, version, false),
                  10.verticalSpace,
                  SizedBox(
                    width: 339.w,
                    height: 55.h,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.r)),
                            border: Border.all(color: Gry3, width: 1.9.w)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            icon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 13.w),
                              child: Icon(
                                IconlyBroken.arrow_down_2,
                                color: Dark,
                                size: 26.sp,
                              ),
                            ),
                            hint: const Text('Genre'),
                            value: dropdownvalue,
                            items: [
                              DropdownMenuItem(
                                value: "Diesel",
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 13.w),
                                  child: Text(
                                    "Diesel",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'cairo',
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                  value: "Electronique",
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 13.w),
                                    child: Text(
                                      "Electronique",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: 'cairo',
                                          color: Colors.black),
                                    ),
                                  )),
                              DropdownMenuItem(
                                  value: "Essence",
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 13.w),
                                    child: Text(
                                      "Essence",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: 'cairo',
                                          color: Colors.black),
                                    ),
                                  )),
                            ],
                            onChanged: (value) => setState(() {
                              dropdownvalue = "$value";
                              engine.text = "$value";
                              getDropDownItem();
                            }),
                            style: const TextStyle(
                                color: Colors.grey,
                                fontFamily: 'cairo',
                                fontSize: 16),
                            dropdownColor: Colors.white,
                            isExpanded: true,
                          ),
                        )),
                  ),
                  10.verticalSpace,
                  SizedBox(
                    width: 335.w,
                    height: 60.h,
                    //  margin: EdgeInsets.all(20),
                    child: DropdownButtonHideUnderline(
                      child: GFDropdown(
                        icon: const Icon(
                          IconlyBroken.arrow_down_2,
                        ),
                        padding: EdgeInsets.all(15.w),
                        borderRadius: BorderRadius.circular(10.r),
                        border: BorderSide(color: Gry3, width: 1.9.w),
                        dropdownButtonColor: Colors.white,
                        value: dropval,
                        onChanged: (newValue) {
                          setState(() {
                            dropval = '$newValue';
                            school.text = '$newValue';
                        
                          });
                        },
                        items: schoolName
                            .map((value) => DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                  10.verticalSpace,
                  input(Locales.string(context, 'color'), false,
                      IconlyBroken.notification, color, false),
                  10.verticalSpace,
                      TextField(
                          keyboardType: TextInputType.number,
        style: TextStyle(color:   gray,fontFamily: 'cairo',fontSize: 14.sp),
        readOnly: false,
        controller: matricule,
        obscureText:  false,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w), 
          focusColor: PrimaryColor,
          labelText: Locales.string(context, 'matricule'),
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
                  10.verticalSpace,
                      TextField(
                          keyboardType: TextInputType.number,
        style: TextStyle(color:   gray,fontFamily: 'cairo',fontSize: 14.sp),
        readOnly: false,
        controller: kilometrage,
        obscureText:  false,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w), 
          focusColor: PrimaryColor,
          labelText: Locales.string(context, 'kilometrage'),
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

                ],
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
            String  imageName='';

                 String? base64Image; 
              final prefs = await SharedPreferences.getInstance(); 
              if(image.path==''){
                base64Image='';
              }
              else{
                base64Image = base64Encode(File(image.path).readAsBytesSync());
                 imageName=image.path.split('/').last;
              }

              
  for(int i=0; i<schoolName.length; i++){
              if(schoolName[i]==dropval){
                setState(() {SelectedId=id[i];});
              }
            }
            Cars car=Cars();
            car.color=color.text;
            car.engine=dropdownvalue;
            car.kilometrage=kilometrage.text;
            car.school_id=SelectedId;
            car.matricule=matricule.text;
            car.brand=brand.text;
            car.photo=base64Image;
            car.photoName=imageName;
            car.version=version.text;
            String token = prefs.getString('token') ?? '';
            print(dropdownvalue); 
            ApiFunctions a = ApiFunctions();
            if(color.text.isNotEmpty||version.text.isNotEmpty||brand.text.isNotEmpty||kilometrage.text.isNotEmpty||matricule.text.isNotEmpty){
              var response = await a.addCar(car,token);
              if(response.statusCode==201){
                Navigator.pop(context);
                    Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const AdminHomePage(index:0)));
              }
              else{
                print(response.statusCode);
                print(response.body);
                showAchievementView(context,false,Locales.string(context, 'erreur dans le serveur'));

              }

            }
            else{
              showAchievementView(context,false,Locales.string(context, 'fill_all_fields'));
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
