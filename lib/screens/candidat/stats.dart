import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:permis/const/vars.dart';
import 'package:permis/screens/candidat/candidatDrawerNavigator.dart';
import 'package:permis/screens/coach/seanceProfile.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Stats extends StatefulWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
    @override
  void initState() {
    super.initState();
    final formKey = GlobalKey<FormState>();
  }
  var search = TextEditingController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return 
        SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              25.verticalSpace,
              LocaleText(
                'seance',
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
                  onChanged: (value) {},
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
                itemCount: 14,
                itemBuilder: (context, index) {
                  return GestureDetector(
                 
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          
                          pushNewScreen(context,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                              screen: const SeanceProfile(),
                              withNavBar: false
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(70.r)),
                                        child: Image.asset(
                                          'assets/images/profilepic.jpg',
                                          fit: BoxFit.cover,
                                          width: 75.w,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'ayoub hachimi',
                                    style: TextStyle(
                                      color: Dark,
                                      fontSize: 14.sp,
                                      fontFamily: 'cairo',
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      LocaleText(
                                        'de',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: 'cairo',
                                          color: Gry3,
                                        ),
                                      ),
                                      5.horizontalSpace,
                                      Text('13:10',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: 'cairo',
                                            color: Gry3,
                                          )),
                                      5.horizontalSpace,
                                      LocaleText(
                                        'vers',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: 'cairo',
                                          color: Gry3,
                                        ),
                                      ),
                                      5.horizontalSpace,
                                      Text('14:10',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: 'cairo',
                                            color: Gry3,
                                          )),
                                    ],
                                  ),
                                  const Spacer(),
                                ],
                              )),
                        ),
                      ),
                    ),
                  );
                },
              ),
              90.verticalSpace,
            ],
          ),
        ),
      
    );
  }
}
