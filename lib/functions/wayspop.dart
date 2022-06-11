import 'dart:io';
import 'package:achievement_view/achievement_view.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permis/const/vars.dart';
import 'package:permis/functions/apiFunctions.dart';
import 'package:permis/screens/login.dart'; 
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../screens/candidat/asnwers.dart';

Future<bool> showExitPopup(context, title) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                20.verticalSpace,
                Row(
                  children: [
                    Expanded(
                        child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: PrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      //RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0.r)),
                      onPressed: () {
                        exit(0);
                      },
                      child: LocaleText(
                        "oui",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontFamily: 'cairo',
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                    15.horizontalSpace,
                    //             InkWell(onTap: () {},child: Container(
                    // height: 45.h,
                    // width: 70.w,
                    // decoration: BoxDecoration(color,
                    // ),),
                    Expanded(
                        child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: PrimaryColor, width: 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0.r)),
                      ),
                      onPressed: () {
                        print('no selected');
                        Navigator.of(context).pop();
                      },
                      child: LocaleText(
                        "non",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontFamily: 'cairo',
                            fontWeight: FontWeight.bold),
                      ),
                    ))
                  ],
                )
              ],
            ),
          ),
        );
      });
}

Future<bool> showPopup(context, title, Widget way) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                const LocaleText(
                  "warn",
                  style: TextStyle(
                    fontFamily: 'cairo',
                    color: Color(0xFFFF3263),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'cairo',
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                        child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: PrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      //RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0.r)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => way));
                      },
                      child: LocaleText(
                        "oui",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontFamily: 'cairo',
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                    const SizedBox(width: 15),
                    Expanded(
                        child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: PrimaryColor, width: 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0.r)),
                      ),
                      onPressed: () {
                        print('no selected');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Answers(false)));
                      },
                      child: LocaleText(
                        "non",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontFamily: 'cairo',
                            fontWeight: FontWeight.bold),
                      ),
                    ))
                  ],
                )
              ],
            ),
          ),
        );
      });
}

Future<bool> WaysPop(context, title, text) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                const LocaleText(
                  "accountcreer",
                  style: TextStyle(
                    fontFamily: 'cairo',
                    color: PrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  text,
                  style: const TextStyle(
                    fontFamily: 'cairo',
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  children: [
                    Expanded(
                        child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: PrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      //RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0.r)),
                      onPressed: () {},
                      child: LocaleText(
                        "oui",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontFamily: 'cairo',
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                    const SizedBox(width: 15),
                    Expanded(
                        child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFFD16868), width: 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0.r)),
                      ),
                      onPressed: () {
                        print('no selected');
                        Navigator.pop(context);
                      },
                      child: LocaleText(
                        "non",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontFamily: 'cairo',
                            fontWeight: FontWeight.bold),
                      ),
                    ))
                  ],
                )
              ],
            ),
          ),
        );
      });
}

Future<Future> LogoutPopup(context, text) async {
  return showDialog(
      context: context,
      builder: (_) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0.r))),
            content: SingleChildScrollView(
              child: Builder(
                builder: (context) {
                  return SizedBox(
                    width: 335.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LocaleText(
                          "signout",
                          style: TextStyle(
                            fontFamily: 'cairo',
                            color: const Color(0xFFD16868),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          text,
                          style: TextStyle(
                            fontFamily: 'cairo',
                            fontSize: 14.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Expanded(
                                child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: const Color(0xFFD16868),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                              //RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0.r)),
                              onPressed: () async {
                                final prefs =
                                    await SharedPreferences.getInstance();
                                String token = prefs.getString('token') ?? '';
                                ApiFunctions a = ApiFunctions();
                                var jj = await a.loggout(token);
                                print(token);
                                await SessionManager().remove("user");
                                Navigator.of(context)
                                    .popUntil((route) => route.isFirst);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const Login()));
                                prefs.clear();
                                prefs.commit();
                                prefs.setBool('seen', true);
                              },
                              child: LocaleText(
                                "oui",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontFamily: 'cairo',
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                            const SizedBox(width: 15),
                            Expanded(
                                child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    color: Color(0xFFD16868), width: 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10.0.r)),
                              ),

                              // borderSide:
                              //     BorderSide(color: Color(0xFFD16868), width: 1),
                              // shape: RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.circular(10.0.r)),
                              onPressed: () {
                                print('no selected');
                                Navigator.pop(context);
                              },
                              child: LocaleText(
                                "non",
                                style: TextStyle(
                                    color: const Color(0xFFD16868),
                                    fontSize: 14.sp,
                                    fontFamily: 'cairo',
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ));
}

Future<Future> DeletePopup(context, text, int id,String type,Widget widget) async {
  return showDialog(
      context: context,
      builder: (_) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0.r))),
            content: SingleChildScrollView(
              child: Builder(
                builder: (context) {
                  return SizedBox(
                    width: 335.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      type=='candidat'?  LocaleText(
                          "deletecandidat",
                          style: TextStyle(
                            fontFamily: 'cairo',
                            color: const Color(0xFFD16868),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ):type=='user'? LocaleText(
                          "deleteuser",
                          style: TextStyle(
                            fontFamily: 'cairo',
                            color: const Color(0xFFD16868),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ): type=='school'?LocaleText(
                          "deleteschool",
                          style: TextStyle(
                            fontFamily: 'cairo',
                            color: const Color(0xFFD16868),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ):  LocaleText(
                          "deletecoach",
                          style: TextStyle(
                            fontFamily: 'cairo',
                            color: const Color(0xFFD16868),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          text,
                          style: TextStyle(
                            fontFamily: 'cairo',
                            fontSize: 14.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                                child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: const Color(0xFFD16868),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                              //RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0.r)),
                              onPressed: () async {
                                ApiFunctions a = ApiFunctions();
                                final prefs =
                                    await SharedPreferences.getInstance();
                                String token = prefs.getString('token') ?? '';
                                if(type=='candidat'){
                                var tes = await a.deleteCandidat(token, id);
                                  if (tes.statusCode == 200) {
                                  showAchievementView(
                                      context,
                                      true,
                                      Locales.string(context,
                                          'candidat_supprime_avec_success'));
                                  pushNewScreen(context,
                                      screen: widget,
                                      pageTransitionAnimation:
                                          PageTransitionAnimation.cupertino);
                                } else {
                                  showAchievementView(context, false,
                                      Locales.string(context, tes.body));
                                }
                                }
                                   else if(type=='coach'){
                                var tes = await a.deleteCoach(token, id);
                                  if (tes.statusCode == 200) {
                                  showAchievementView(
                                      context,
                                      true,
                                      Locales.string(context,
                                          'coach_supprime_avec_success'));
                                  pushNewScreen(context,
                                      screen: widget,
                                      pageTransitionAnimation:
                                          PageTransitionAnimation.cupertino);
                                } else {
                                  showAchievementView(context, false,
                                      Locales.string(context, tes.body));
                                }
                                }
                                   else if(type=='user'){
                                var tes = await a.deleteUser(token, id);
                                  if (tes.statusCode == 200) {
                                  showAchievementView(
                                      context,
                                      true,
                                      Locales.string(context,
                                          'user_supprime_avec_success'));
                                  pushNewScreen(context,
                                      screen: widget,
                                      pageTransitionAnimation:
                                          PageTransitionAnimation.cupertino);
                                } else {
                                  showAchievementView(context, false,
                                      Locales.string(context, tes.body));
                                }
                                }
                                else{
                                  var tes = await a.deleteSchool(token, id);
                                    if (tes.statusCode == 200) {
                                  showAchievementView(
                                      context,
                                      true,
                                      Locales.string(context,
                                          'auto_ecole_supprime_avec_success'));
                                  pushNewScreen(context,
                                      screen:   widget,
                                      pageTransitionAnimation:
                                          PageTransitionAnimation.cupertino);
                                } else {
                                  showAchievementView(context, false,
                                      Locales.string(context, 'erreur dans le serveur'));
                                }
                                }
                              
                                
                              },
                              child: LocaleText(
                                "oui",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontFamily: 'cairo',
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                            const SizedBox(width: 15),
                            Expanded(
                                child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor:   Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                              onPressed: () {
                                print('no selected');
                                Navigator.pop(context);
                              },
                              child: LocaleText(
                                "non",
                                style: TextStyle(
                                    color: const Color(0xFFD16868),
                                    fontSize: 14.sp,
                                    fontFamily: 'cairo',
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ));
}
Future<Future> DeleteAccountPopup(context, text, int id,Widget widget) async {
  return showDialog(
      context: context,
      builder: (_) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0.r))),
            content: SingleChildScrollView(
              child: Builder(
                builder: (context) {
                  return SizedBox(
                    width: 335.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LocaleText(
                          "deleteuser",
                          style: TextStyle(
                            fontFamily: 'cairo',
                            color: const Color(0xFFD16868),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          text,
                          style: TextStyle(
                            fontFamily: 'cairo',
                            fontSize: 14.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                                child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: const Color(0xFFD16868),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                              //RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0.r)),
                              onPressed: () async {
                                ApiFunctions a = ApiFunctions();
                                final prefs =
                                    await SharedPreferences.getInstance();
                                String token = prefs.getString('token') ?? '';
                                var tes = await a.deleteSchool(token, id);
                                if (tes.statusCode == 200) {
                                  showAchievementView(
                                      context,
                                      true,
                                      Locales.string(context,
                                          'auto-ecole supprime avec success'));
                                  pushNewScreen(context,
                                      screen:   widget,
                                      pageTransitionAnimation:
                                          PageTransitionAnimation.cupertino);
                                } else {
                                  showAchievementView(context, false,
                                      Locales.string(context, tes.body));
                                }
                                 
                                var jj = await a.loggout(token);
                                print(token);
                                Navigator.of(context)
                                    .popUntil((route) => route.isFirst);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const Login()));
                                prefs.clear();
                                prefs.commit();
                                prefs.setBool('seen', true);
                                
                              },
                              child: LocaleText(
                                "oui",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontFamily: 'cairo',
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                            const SizedBox(width: 15),
                            Expanded(
                                child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor:   Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                              onPressed: () {
                                print('no selected');
                                Navigator.pop(context);
                              },
                              child: LocaleText(
                                "non",
                                style: TextStyle(
                                    color: const Color(0xFFD16868),
                                    fontSize: 14.sp,
                                    fontFamily: 'cairo',
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ));
}
Future<Future> DeleteCarPopup(context, text, int id,Widget widget) async {
  return showDialog(
      context: context,
      builder: (_) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0.r))),
            content: SingleChildScrollView(
              child: Builder(
                builder: (context) {
                  return SizedBox(
                    width: 335.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LocaleText(
                          "deleteuser",
                          style: TextStyle(
                            fontFamily: 'cairo',
                            color: const Color(0xFFD16868),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          text,
                          style: TextStyle(
                            fontFamily: 'cairo',
                            fontSize: 14.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                                child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: const Color(0xFFD16868),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                              //RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0.r)),
                              onPressed: () async {
                                ApiFunctions a = ApiFunctions();
                                final prefs =
                                    await SharedPreferences.getInstance();
                                String token = prefs.getString('token') ?? '';
                                var tes = await a.deleteCar(token, id);
                                if (tes.statusCode == 200) {
                                  showAchievementView(
                                      context,
                                      true,
                                      Locales.string(context,
                                          'deleted'));
                                  pushNewScreen(context,
                                      screen:   widget,
                                      pageTransitionAnimation:
                                          PageTransitionAnimation.cupertino);
                                } else {
                                  showAchievementView(context, false,
                                      Locales.string(context, tes.body));
                                } 
                         
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                              widget)); 
                                
                              },
                              child: LocaleText(
                                "oui",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontFamily: 'cairo',
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                            const SizedBox(width: 15),
                            Expanded(
                                child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor:   Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                              onPressed: () {
                                print('no selected');
                                Navigator.pop(context);
                              },
                              child: LocaleText(
                                "non",
                                style: TextStyle(
                                    color: const Color(0xFFD16868),
                                    fontSize: 14.sp,
                                    fontFamily: 'cairo',
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ));
}

Future<Future> AddPopup(context, text) async {
  return showDialog(
      context: context,
      builder: (_) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0.r))),
            content: SingleChildScrollView(
              child: Builder(
                builder: (context) {
                  return SizedBox(
                    width: 335.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LocaleText(
                          "addsure",
                          style: TextStyle(
                            fontFamily: 'cairo',
                            color: PrimaryColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          text,
                          style: TextStyle(
                            fontFamily: 'cairo',
                            fontSize: 14.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                                child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: PrimaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                              //RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0.r)),
                              onPressed: () async {
                                final Uri url = Uri.parse(
                                    'https://dabapermis.medyouin.com/register');
                                await launchUrl(url);
                              },
                              child: LocaleText(
                                "oui",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontFamily: 'cairo',
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                            const SizedBox(width: 15),
                            Expanded(
                                child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: PrimaryColor, width: 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10.0.r)),
                              ),
                              onPressed: () {
                                print('no selected');
                                Navigator.pop(context);
                              },
                              child: LocaleText(
                                "non",
                                style: TextStyle(
                                    color: PrimaryColor,
                                    fontSize: 14.sp,
                                    fontFamily: 'cairo',
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ));
}

void showAchievementView(BuildContext context, status, text) {
  Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: status?Colors.green:Colors.red,
        textColor: Colors.white,
        fontSize: 16.0.sp
    );
   
}
