import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permis/const/vars.dart';

class AdminSettings extends StatefulWidget {
  const AdminSettings({Key? key}) : super(key: key);

  @override
  State<AdminSettings> createState() => _AdminSettingsState();
}

class _AdminSettingsState extends State<AdminSettings> {
  bool val = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const LocaleText('settings'),
        ),
        body: Center(
          child: Column(
            children: [
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: PrimaryColor, width: 1.2.w),
                  borderRadius: BorderRadius.all(Radius.circular(12.r)),
                ),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      Locales.currentLocale(context) == 'ar'
                          ? val = false
                          : val = true;
                      Locales.change(context, 'ar');
                    });
                  },
                  child: const Text('تغيير اللغة'),
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: PrimaryColor, width: 1.2.w),
                  borderRadius: BorderRadius.all(Radius.circular(12.r)),
                ),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      Locales.change(context, 'fr');
                    });
                  },
                  child: const Text('Changer la langue'),
                ),
              ),
              const Spacer(),
            ],
          ),
        ));
  }
}
