
import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:permis/const/vars.dart';
import 'package:permis/screens/candidat/candidatDrawerNavigator.dart';
import 'package:permis/screens/candidat/read.dart';
import 'package:permis/screens/candidat/stats.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../../functions/wayspop.dart';
import 'home.dart';

class HomePage extends StatefulWidget {
  final int index;
  const HomePage({required this.index, Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
      onWillPop: () => showExitPopup(
          context,
          Locales.string(
            context,
            "quit",
          )),
      child: Scaffold(
        body: ProvidedStylesExample(
          menuScreenContext: context,
          index: widget.index,
        ),
      ),
    ));
  }
}

class ProvidedStylesExample extends StatefulWidget {
  final BuildContext menuScreenContext;
  final int index;
  const ProvidedStylesExample({required this.index, required this.menuScreenContext});

  @override
  _ProvidedStylesExampleState createState() => _ProvidedStylesExampleState();
}

class _ProvidedStylesExampleState extends State<ProvidedStylesExample> {
  @override
  void initState() {
    super.initState();
  }

  List<Widget> _buildScreens() {
    return [const Home(), const Read(), const Stats()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(IconlyBroken.home),
        title: "Home",
        activeColorPrimary: PrimaryColor,
        inactiveColorPrimary: PrimaryColor,
        inactiveColorSecondary: PrimaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Boxicons.bx_book_reader),
        title: ("book"),
        activeColorPrimary: PrimaryColor,
        inactiveColorPrimary: PrimaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Boxicons.bx_stats),
        title: ("Add"),
        activeColorPrimary: PrimaryColor,
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
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(27.r),
        //   ),
        // ),
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 13.0.r),
            child: Transform.scale(
              scale: 1.5,
              child: IconButton(
                icon: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(90.r)),
                  child: Image.asset(
                    'assets/images/profilepic.jpg',
                    width: 50.w,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
        backgroundColor: PrimaryColor,
        toolbarHeight: 80.h,
        elevation: 0,
        leading: InkWell(
          onTap: () => key.currentState!.openDrawer(),
          child: Icon(
            IconlyBroken.category,
            size: 35.h,
          ),
        ),
      ),
      drawer: const CandidatDrawerNavigator(),
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
        navBarHeight: 80.h,
        hideNavigationBarWhenKeyboardShows: true,
        margin: const EdgeInsets.all(0.0),
        popActionScreens: PopActionScreensType.all,
        bottomScreenMargin: 0.0,

        selectedTabScreenContext: (context) {},
        hideNavigationBar: false,
        decoration: const NavBarDecoration(
          //   borderRadius:BorderRadius.only(topLeft: Radius.circular(45.0.r),topRight: Radius.circular(45.r)),
          colorBehindNavBar: Colors.indigo,
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
      appBar: AppBar(title: const LocaleText('language')),
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
