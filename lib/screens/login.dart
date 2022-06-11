import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permis/DAL/admin.dart';
import 'package:permis/DAL/school.dart';
import 'package:permis/const/vars.dart';
import 'package:iconly/iconly.dart';
import 'package:permis/const/loading.dart';
import 'package:permis/functions/apiFunctions.dart';
import 'package:permis/functions/wayspop.dart';
import 'package:permis/screens/admin/adminHomePage.dart';
import 'package:permis/screens/emailRecover.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../DAL/Candidat.dart';
import '../DAL/moniteur.dart';
import '../const/vars.dart';
import '../const/input.dart';
import '../const/roundedButton.dart';
import 'autoecole/schoolHomePage.dart';
import 'candidat/homePage.dart';
import 'coach/coachHomepage.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

bool loading = false;

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    TextEditingController inputs = TextEditingController();
    TextEditingController inputs2 = TextEditingController();
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return loading
        ? const Loading()
        : SafeArea(
            child: WillPopScope(
              onWillPop: () => showExitPopup(
                  context,
                  Locales.string(
                    context,
                    "quit",
                  )),
              child: Scaffold(
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      14.verticalSpace,
                      if (!isKeyboard)
                        Center(
                          child: Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/images/logo.png",
                              scale: 2,
                            ),
                          ),
                        ),
                      20.verticalSpace,
                      LocaleText(
                        'welcome',
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: "cairo",
                            color: PrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      20.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                        child: LocaleText(
                          'data2',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: "cairo",
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      39.verticalSpace,
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: input(Locales.string(context, "email"), false,
                              IconlyBold.message, inputs, false)),
                      20.verticalSpace,
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: input(Locales.string(context, "password"),
                              true, IconlyBold.lock, inputs2, false)),
                      20.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                pushNewScreen(context,
                                    screen: const EmailRocover(),
                                    pageTransitionAnimation:
                                        PageTransitionAnimation.cupertino,
                                    withNavBar: false);
                              },
                              child: LocaleText(
                                "forgor",
                                style: TextStyle(
                                    color: PrimaryColor,
                                    fontSize: 14.sp,
                                    fontFamily: 'cairo',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      20.verticalSpace,
                      RoundedButton("login", () async {
                        setState(() {
                          loading = true;
                        });
                          final ConnectivityResult result = await Connectivity().checkConnectivity();

                        if(result!=ConnectivityResult.none){
                        ApiFunctions log = ApiFunctions();
                        final prefs = await SharedPreferences.getInstance();
                        var token = await log.login(inputs.text.trim(), inputs2.text);
                         
                            print(token.statusCode);
                        final Map<String, dynamic> role =
                            json.decode(token.body);
                      

                        if (token.statusCode == 200) {
                             var idn=await log.getUser(role['token']);
                               final Map<String, dynamic> id =
                            json.decode(idn.body);
                          prefs.setString('token', role['token']);
                          prefs.setBool('seen', true);
                          prefs.setString('email', inputs.text.trim());
                          prefs.setString('password', inputs2.text);
                          prefs.setInt('id', id['id']);
                          prefs.setString('name', id['name']);
                          var sessionManager = SessionManager();
                          if (role['role'] == 'ROLE_ADMIN') {
                            setState(() {
                              loading = false;
                            });
                              Admin data = Admin();
                                data=Admin.fromJson(jsonDecode(idn.body));
                            await sessionManager.set('user',data);
                            prefs.setString('role', 'admin');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const AdminHomePage(index: 0),
                                ));
                          } else if (role['role'] == 'ROLE_CANDIDAT') {
                            prefs.setString('role', 'candidat');
                            setState(() {
                              loading = false;
                            });
                               Candidat data = Candidat();
                                data=Candidat.fromJson(jsonDecode(idn.body));
                            await sessionManager.set('user',data);
                            prefs.setString('role', 'candidat');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(index: 0),
                              ),
                            );
                            setState(() {
                              loading = false;
                            });
                          } else if (role['role'] == 'ROLE_COACH') {
                            setState(() {
                              loading = false;
                            });
                               Moniteur data = Moniteur();
                                data=Moniteur.fromJson(jsonDecode(idn.body));
                            await sessionManager.set('user',data);
                            prefs.setString('role', 'coach');
                            print('adfadfadfaf''${await sessionManager.get('user')}');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CoachHomePage(),
                              ),
                            );
                            setState(() {
                              loading = false;
                            });
                          } else {
                            setState(() {
                              loading = false;
                            });
                            School data = School();
                                data=School.fromJson(jsonDecode(idn.body));
                            await sessionManager.set('user',data);
                            prefs.setString('role', 'autoecole');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const SchoolHomePage(index: 0),
                              ),
                            );
                            setState(() {
                              loading = false;
                            });
                          }
                        } else {
                          if (inputs.text.isEmpty) {
                            showAchievementView(context, false, Locales.string(
                                context, "fill_all_fields"));
                            setState(() {
                              loading = false;
                            });
                          } else {
                            if (inputs2.text.isEmpty) {
                              showAchievementView(
                                  context, false, 'empty password');
                            } else {
                              showAchievementView(
                                  context, false, Locales.string(context, 'les_donnees_sont_invalides'));
                            }
                            setState(() {
                              loading = false;
                            });
                          } 
                        }}  else{
                          setState(() {
                            loading=false;
                             Fluttertoast.showToast(
          msg: Locales.string(context, 'wifi'),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 15);
                          });
                        }
                      }, PrimaryColor),
                      isKeyboard ? 10.verticalSpace : 50.verticalSpace,
                      GestureDetector(
                        onTap: () {
                          AddPopup(context, Locales.string(context, 'adduser'));
                        },
                        child: LocaleText(
                          "haveaccount",
                          style: TextStyle(
                              color: PrimaryColor,
                              fontSize: 14.sp,
                              fontFamily: 'cairo',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      20.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
