
import 'package:flutter/cupertino.dart';
import 'package:permis/screens/autoecole/schoolHomePage.dart';
import 'package:permis/screens/candidat/homePage.dart';
import 'package:permis/screens/login.dart';
import 'package:permis/screens/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../const/loading.dart';
import 'admin/adminHomePage.dart';
import 'coach/coachHomepage.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  Widget way = const Loading();
  _getPath() async {
    final prefs = await SharedPreferences.getInstance(); 
 //   String token = prefs.getString('token') ?? '';
    bool seen2 = prefs.getBool('seen') ?? false;
    String role=prefs.getString('role') ?? ''; 

    
     
      if (role == 'admin') {
        setState(() {
          way = const AdminHomePage(index: 0);
        });
      } else if (role == 'candidat') {
        setState(() {
          way = const HomePage(index: 0);
        });
      } else if(role=='autoecole'){
        setState(() {
          way = const SchoolHomePage(index: 0);
        });
      }
      
       else if(role=='coach'){
        setState(() {
          way = const CoachHomePage();
        });
      }
      
      else {
      setState(() {
        way = seen2 ? const Login() : const SplashScreen();
      });
    }
    
  }

  @override
  void initState() {
    super.initState();
    _getPath();
  }

  @override
  Widget build(BuildContext context) {
    return way;
  }
}
