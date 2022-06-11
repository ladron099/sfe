

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:permis/const/vars.dart';
import 'package:permis/screens/admin/drawerNavigator.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../../functions/wayspop.dart';
import 'adminHome.dart';
import 'adminRead.dart';
import 'adminStats.dart';

class AdminHomePage extends StatefulWidget {
  final int index;
  const AdminHomePage({required this.index,Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: WillPopScope(
      onWillPop:()=>
          showExitPopup(context, Locales.string(context, "quit",)),

      child: Scaffold(
        body: ProvidedStylesExample(menuScreenContext:context, index:widget.index,),
      ),
    ));
  }

}

class ProvidedStylesExample extends StatefulWidget {
  final BuildContext menuScreenContext;
  final int index;
  const ProvidedStylesExample({ required this.index, required this.menuScreenContext});

  @override
  _ProvidedStylesExampleState createState() => _ProvidedStylesExampleState();
}

class _ProvidedStylesExampleState extends State<ProvidedStylesExample> {


  @override
  void initState() {
    super.initState();
  }

  List<Widget> _buildScreens() {
    return [
      const AdminHome(),
      const AdminStats(),
      const AdminRead(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(IconlyBroken.home,size: 29.sp,),
        title: "Home",
        activeColorPrimary: PrimaryColor,
        inactiveColorPrimary: PrimaryColor,
        inactiveColorSecondary: PrimaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(IconlyBroken.graph,size: 29.sp,),
        title: ("book"),
        activeColorPrimary: PrimaryColor,
        inactiveColorPrimary: PrimaryColor,

      ),
      PersistentBottomNavBarItem(
        icon: Icon(IconlyBroken.play,size: 29.sp,),
        title: ("Add"),
        activeColorPrimary:  PrimaryColor,
        activeColorSecondary: PrimaryColor,
        inactiveColorPrimary: PrimaryColor,
      ),

    ];
  }
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey();
    return Scaffold(
      key: key,
      appBar: AppBar(
        title:const LocaleText("homepage"),
        titleTextStyle: TextStyle(
          fontFamily: 'cairo',
          fontSize: 16.sp,
          fontWeight: FontWeight.bold
        ),
        centerTitle: true,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(27.r),
        //   ),
        // ),
        actions: [
          Padding(
            padding:   EdgeInsets.symmetric(horizontal: 13.0.w),
            child: Transform.scale(
              scale:1.8,
              child: IconButton(
                icon: Image.asset('assets/images/splashlogo.png',),
                onPressed: () {

                },
              ),
            ),
          ),
        ],
        backgroundColor: PrimaryColor,
        toolbarHeight:80.h,
        elevation: 0,
        leading: InkWell(
          onTap: () =>  key.currentState!.openDrawer(),
          child: Icon(
            IconlyBroken.category,size: 35.h,
          ),

        ),

      ),
      drawer: const DrawerNavigator(),
      body: PersistentTabView(
        context,
        controller: PersistentTabController(initialIndex: widget.index),
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight:80.h,
        hideNavigationBarWhenKeyboardShows: true,
        margin: const EdgeInsets.all(0.0),
        popActionScreens: PopActionScreensType.all,
        bottomScreenMargin: 0.0,

        selectedTabScreenContext: (context) {

        },
        hideNavigationBar: false,
        decoration: NavBarDecoration(
        //  borderRadius:BorderRadius.only(topLeft: Radius.circular(27.0.r),topRight: Radius.circular(27.r)),
          colorBehindNavBar: Colors.indigo,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFC9C9C9).withOpacity(0.12),
              blurRadius: 20,
            ),
          ],
        ),

        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 400),

          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
        NavBarStyle.style13, // Choose the nav bar style with this property
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (_) => SettingScreen()));
      // },
      //
      // ),
    );
  }
}

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerNavigator(),
      backgroundColor: PrimaryBg,
      appBar: AppBar(
          title:const LocaleText('homepage'),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () => Locales.change(context, 'fr'),
            title: const LocaleText('language2'),
          ),

          // to change language with Extension
          ListTile(
            onTap: () => context.changeLocale('ar'),
            title: const LocaleText('language1'),
          ),
          Text('Current Locale: ${Locales.currentLocale(context)!.languageCode}'),
          // Text('Current Locale: ' + context.currentLocale.languageCode), // with Extension
        ],
      ),
    );
  }
}