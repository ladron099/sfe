import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permis/const/vars.dart';
import 'package:permis/screens/wrapper.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Locales.init(['ar', 'fr']); 
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(builder: (locale) {
      return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (ctx,Login) {    
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ThemeData().colorScheme.copyWith(
                      primary: PrimaryColor,
                    ),
                primaryColor: PrimaryColor,
                primaryColorDark: Gry3,
                backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
              ),
              localizationsDelegates: Locales.delegates,
              supportedLocales: Locales.supportedLocales,
              locale: locale,
              home: const Wrapper(),
           //   home: const CoachHomePage(),
            );
          });
    });
  }
}
