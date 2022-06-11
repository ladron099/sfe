import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:permis/const/input.dart';

import '../../const/vars.dart';

class EditCandidat extends StatefulWidget {
  const EditCandidat({Key? key}) : super(key: key);

  @override
  State<EditCandidat> createState() => _EditCandidatState();
}

class _EditCandidatState extends State<EditCandidat> {
  var name = TextEditingController();
  var school = TextEditingController();
  var adresse = TextEditingController();
  var date2 = TextEditingController();
  var gender = TextEditingController();
  var cin = TextEditingController();
  var number = TextEditingController();
  String dropdownvalue = 'Homme';
  late String newValue = "Homme";
  String holder = '';
  @override
  void initState() {
    super.initState();
    encapp();
  }

  encapp() {
    setState(() {
      name.text = 'Ayoub hachimi';
      school.text = 'Auto-ecole Elghazi';
      adresse.text = 'Rue Saada Appt 3 avenue des far';
      date2.text = '1996-03-05';
      gender.text = 'Homme';
      cin.text = 'D91255';
      number.text = '065844558855';
    });
  }

  void getDropDownItem() {
    setState(() {
      holder = newValue;
    });
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
            21.verticalSpace,
            Center(
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(90.r)),
                      child: Image.asset(
                        'assets/images/profilepic.jpg',
                        width: 100.w,
                      )),
                  10.verticalSpace,
                  Text(
                    "Ayoub Hachimi",
                    style: TextStyle(
                      color: Dark,
                      fontFamily: 'cairo',
                      fontSize: 14.sp,
                    ),
                  ),
                  Text(
                    "Auto-école Elghazi",
                    style: TextStyle(
                      color: gray,
                      fontFamily: 'cairo',
                      fontSize: 14.sp,
                    ),
                  ),
                  20.verticalSpace,
                  FlatButton(
                    onPressed: () {},
                    color: Colors.white,
                    minWidth: 220.w,
                    height: 55.h,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0.r),
                        side: BorderSide(color: PrimaryColor, width: 1.4.w)),
                    child: LocaleText(
                      "picchange",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: "cairo",
                          fontWeight: FontWeight.bold,
                          color: PrimaryColor),
                    ),
                  ),
                  20.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Column(
                      children: [
                     input(Locales.string(context, 'fullname'), false, IconlyBroken.notification, name,false),
                     10.verticalSpace,input(Locales.string(context, 'school'), false, IconlyBroken.lock, school,true),
                     10.verticalSpace,input(Locales.string(context, 'adresse'), false, IconlyBroken.notification, adresse,false),
                     10.verticalSpace,TextFormField(
                    controller: date2,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: Locales.string(context, 'date'),
                      contentPadding: EdgeInsets.symmetric(horizontal: 13.w,vertical:20 ),
                      hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'cairo',
                          color:Dark
                      ),
                      suffixIcon: const Icon(IconlyBroken.calendar, color: Dark),
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0.r),
                        borderSide: const BorderSide(
                          color: Gry3,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0.r),
                        borderSide: const BorderSide(
                          color: Gry3,
                          width: 1.9,
                        ),
                      ),
                    ),
                    onTap: () async {
                      DateTime? date = DateTime(1900);
                      FocusScope.of(context).requestFocus(FocusNode());

                      date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));
                      var formate2 =
                          "${date?.day}-${date?.month}-${date?.year}";
                     setState(() {
                       date2.text=formate2;
                     });

                    },
                  ),
10.verticalSpace,
                        SizedBox(
                          width: 339.w,
                          height: 55.h,
                          child: DecoratedBox(
                              decoration: BoxDecoration(

                                  color: Colors.white,
                                borderRadius: BorderRadius.all( Radius.circular(12.r)),
                                border: Border.all(color: Gry3,width: 1.9.w)

                              ),
                              child: DropdownButtonHideUnderline(

                                child: DropdownButton(

                                  icon: Padding(
                                    padding:   EdgeInsets.symmetric(horizontal:13.w),
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
                                      value: "Homme",
                                      child: Padding(
                                        padding:   EdgeInsets.symmetric(horizontal:13.w),
                                        child: Text(
                                          "Homme",
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontFamily: 'cairo',
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                        value: "Femme",
                                        child: Padding(
                                          padding:   EdgeInsets.symmetric(horizontal:13.w),
                                          child: Text(
                                            "Femme",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontFamily: 'cairo',
                                                color: Colors.black),
                                          ),
                                        )),
                                  ],
                                  onChanged: (value) => setState(() {
                                    dropdownvalue = "$value";
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
                    input(Locales.string(context, 'cin'), false, IconlyBroken.notification, cin,false),
                        10.verticalSpace,
                   input(Locales.string(context, 'telephone'), false, IconlyBroken.notification,number ,false)


                      ],
                    ),
                  ),
                ],
              ),
            ),
            120.verticalSpace,
          ],
        ),
      ),
    floatingActionButton: SizedBox(
    width: 60.w,
    height: 60.w,
    child:   FloatingActionButton(
    onPressed: (){
    },
    backgroundColor: PrimaryColor,
    child: Icon(
    IconlyBroken.edit,
    color: Colors.white,
    size: 27.sp,
    ),
    ),),
    );
  }
}
