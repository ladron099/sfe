import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:iconly/iconly.dart';
import 'package:permis/DAL/Candidat.dart';

import '../../DAL/Candidat.dart';
import '../../const/vars.dart';
import '../../const/loading.dart';

class CandidatProfile extends StatefulWidget {
  const CandidatProfile({Key? key}) : super(key: key);

  @override
  State<CandidatProfile> createState() => _CandidatProfileState();
}

class _CandidatProfileState extends State<CandidatProfile> {
  var name = TextEditingController();
  var school = TextEditingController();
  var date = TextEditingController();
  var gender = TextEditingController();
  var cin = TextEditingController();
  var number = TextEditingController();
  String pic=''; 
  bool loading=true;
  String holder = '';
 encapp() async {
    Candidat mn=Candidat();
    mn=Candidat.fromJson(await SessionManager().get('user'));
    setState(() {
      school.text = mn.school_name;
      name.text = mn.name;
      date.text = mn.birthdate;
      cin.text = mn.cni;
      number.text = mn.phoneNo;
      gender.text = mn.sexe==1 ? 'Homme' : 'Femme';
      pic=mn.photo;
      loading = false;
    });
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    encapp();
  } 


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
                      child: Image.asset(
                        'assets/images/profilepic.jpg',
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
                    school.text,
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
                          border: Border.all(color: Gry3, width: 1.2),
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.r))),
                      child: Column(
                        children: [
                          TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 12.w),
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
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 12.w),
                            ),
                            controller: school,
                          ),
                          Container(
                            height: 1.h,
                            color: Gry3,
                          ),
                          TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 12.w),
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
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 12.w),
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
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 12.w),
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
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 12.w),
                            ),
                            controller: number,
                          ),
                        ],
                      ),
                    ),
                  ),
                  15.verticalSpace,
                ],
              ),
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
