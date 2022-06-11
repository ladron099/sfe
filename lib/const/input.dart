import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import 'vars.dart';

class input extends StatefulWidget {
  String text;
  TextEditingController cntrl;
  IconData icon;
  bool idk;
  bool isHidden;
  input(this.text, this.isHidden, this.icon, this.cntrl, this.idk);

  @override
  State<input> createState() => _inputState(text, isHidden, icon, cntrl, idk);
}

class _inputState extends State<input> {
  String text;
  bool idk;
  bool isHidden;
  TextEditingController cntrl;
  IconData icon;
  _inputState(this.text, this.isHidden, this.icon, this.cntrl, this.idk);
  bool nop = true;

  @override
  Widget build(BuildContext context) {
    if (icon == IconlyBroken.notification) {
      nop = false;
    } else {
      nop = true;
    }
    return TextField(
        style: TextStyle(color: !idk ? Colors.black : gray,fontFamily: 'cairo',fontSize: 14.sp),
        readOnly: idk,
        controller: cntrl,
        obscureText: isHidden ? true : false,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
          suffixIcon: Icon(
            nop ? icon : null,
            color: gray,
          ),
          focusColor: PrimaryColor,
          labelText: text,
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
        ));
  }
}
