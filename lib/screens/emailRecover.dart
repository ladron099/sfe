import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permis/const/vars.dart';
import 'package:iconly/iconly.dart';
import 'package:permis/functions/wayspop.dart';
import 'package:permis/screens/admin/adminHomePage.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../const/vars.dart';
import '../const/input.dart';
import '../const/roundedButton.dart';
import 'login.dart';

class EmailRocover extends StatefulWidget {
  const EmailRocover({Key? key}) : super(key: key);

  @override
  State<EmailRocover> createState() => _EmailRocoverState();
}

class _EmailRocoverState extends State<EmailRocover> {


  @override
  Widget build(BuildContext context) {
    TextEditingController search=TextEditingController();
    TextEditingController search2=TextEditingController();
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return SafeArea(child: WillPopScope(
      onWillPop:()=>
          showExitPopup(context, Locales.string(context, "quit",)),

      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              14.verticalSpace,
              if(!isKeyboard)
                Center(
                  child:Container(

                    alignment: Alignment.center,
                    child: Image.asset("assets/images/logo.png",scale: 2,),
                  ),

                ),
              20.verticalSpace,
              LocaleText('getloginback',style: TextStyle(
                  fontSize: 18.sp,fontFamily: "cairo",color: PrimaryColor,fontWeight: FontWeight.bold
              ),),
              20.verticalSpace,
              Padding(
                padding:   EdgeInsets.symmetric(horizontal: 25.0.w),
                child: LocaleText('data2',style: TextStyle(
                    fontSize: 14.sp,fontFamily: "cairo",fontWeight: FontWeight.bold
                ),textAlign: TextAlign.center,),
              ),
              39.verticalSpace,
              Padding(
                  padding:   EdgeInsets.symmetric(horizontal: 20.w),
                  child: input(Locales.string(context,"email"),false,IconlyBold.message,search,false)
              ),


              55.verticalSpace,
              RoundedButton("getloginback",(){
                pushNewScreen(context, screen: const AdminHomePage(index: 0,),   pageTransitionAnimation : PageTransitionAnimation.cupertino,withNavBar:false );
              },PrimaryColor),
              isKeyboard?10.verticalSpace:   111.verticalSpace,
              GestureDetector(
                onTap: (){
                  pushNewScreen(context, screen: const Login(),   pageTransitionAnimation : PageTransitionAnimation.cupertino,withNavBar:false );

                },
                child: LocaleText("loginback", style: TextStyle(
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
