import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import '../const/vars.dart';
import '../const/slider.dart';
import '../functions/wayspop.dart';
import 'login.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _currentPage = 0;
  final PageController _controller = PageController();
  void enter() {
    _controller.nextPage(
        duration: const Duration(milliseconds: 800), curve: Curves.easeInOutQuint);
  }

  final List<Widget> _pages = [
    const SliderPage(
      title: 'مرحبا بكم!',
      description:
          "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور ",
      image: "assets/images/second.gif",
      ccoolloorr: Color(0xFFB1DAFF),
    ),
    const SliderPage(
      title: 'مرحبا بكم!',
      description:
          "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور ",
      image: "assets/images/firstg.gif",
      ccoolloorr: Color(0xFF5BB2E5),
    ),
    const SliderPage(
      title: 'مرحبا بكم!',
      description:
          "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور ",
      image: "assets/images/third.gif",
      ccoolloorr: Color(0xFF82D6BE),
    ),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(
          context,
          Locales.string(
            context,
            "quit",
          )),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            PageView.builder(
              scrollDirection: Axis.horizontal,
              onPageChanged: _onchanged,
              controller: _controller,
              itemCount: _pages.length,
              itemBuilder: (context, int index) {
                return _pages[index];
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(_pages.length, (int index) {
                      return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 10.h,
                          width: (index == _currentPage) ? 60.w : 25.w,
                          margin: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 30.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: (index == _currentPage)
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.5)));
                    })),
                InkWell(
                  onTap: () {
                    if (_currentPage == (_pages.length - 1)) {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.leftToRight,
                          child: const Login(),
                        ),
                      );
                    } else {
                      enter();
                    }
                  },
                  child: AnimatedContainer(
                    alignment: Alignment.center,
                    duration: const Duration(milliseconds: 300),
                    height: 70.w,
                    width: 70.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100.r)),
                    child: (_currentPage == (_pages.length - 1))
                        ? Icon(
                            Boxicons.bx_check,
                            size: 50.sp,
                            color: Dark,
                          )
                        : Icon(
                            Boxicons.bx_chevron_left,
                            size: 50.sp,
                            color: Dark,
                          ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
