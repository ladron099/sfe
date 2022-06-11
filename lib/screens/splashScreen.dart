import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permis/const/vars.dart';
import 'package:permis/screens/welcomeScreen.dart';

import '../functions/wayspop.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    go();
  }
  void go(){
    Timer(const Duration(seconds: 2), () {
      Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight,duration: const Duration(milliseconds: 450), child:const WelcomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return    WillPopScope(
        onWillPop:()=>
        showExitPopup(context, Locales.string(context, "quit",)),

    child: Scaffold(
        backgroundColor: PrimaryColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              286.verticalSpace,
              Center(
               child:Container(

                 child: Image.asset("assets/images/splashlogo.gif",scale: 1.9,),
               ),

              ),
              Padding(
                padding:   EdgeInsets.symmetric(vertical: 50.h),
                child: LocaleText("welcome",style: TextStyle(
                    fontSize: 18.sp,fontFamily: "cairo",fontWeight: FontWeight.bold,color: Colors.white
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
