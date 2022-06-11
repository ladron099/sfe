import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;
 final ccoolloorr;
  const SliderPage({required this.title, required this.description, required this.image,required this.ccoolloorr});

  @override
  Widget build(BuildContext context) {

    return Container(
      color: ccoolloorr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Image.asset(
            image,
            width: 375.w,
          ),
          SizedBox(
            height: 60.h,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold,color: Colors.white,fontFamily: 'cairo'),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding:   EdgeInsets.symmetric(horizontal: 26.h),
            child: Text(
              description,
              style: TextStyle(
                color: Colors.white,
                height: 1.5.h,
                fontWeight: FontWeight.normal,
                fontSize: 14.sp,
                letterSpacing: 0.7,
                fontFamily: 'cairo'
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
