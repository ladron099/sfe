import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class RoundedButton extends StatefulWidget {
  String text;
  Function where;
  Color color;
   RoundedButton(this.text,this.where,this.color)  ;

  @override
  State<RoundedButton> createState() => _RoundedButtonState(text,where,color);
}

class _RoundedButtonState extends State<RoundedButton> {
  String text;
  Function where;
  Color color;
  _RoundedButtonState(this.text,this.where,this.color);

  @override
  Widget build(BuildContext context) {
    return     FlatButton(
      color:color,
      onPressed: (){
      where();

      }
      ,
      minWidth: 220.w,
      height: 55.h,
      shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0.r)),

      child: LocaleText(text,style: TextStyle(
          fontSize: 14.sp,fontFamily: "cairo",fontWeight: FontWeight.bold,color: Colors.white
      ),),
    );
  }
}
