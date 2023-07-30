import 'package:cart_express/Secreens/obout_us.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../Secreens/cart.dart';
import '../Secreens/change_password.dart';
import '../Secreens/contact_us.dart';
import '../Secreens/home.dart';
import '../Secreens/my_order.dart';
import '../Secreens/terms.dart';
import '../Secreens/faqs.dart';
import '../Secreens/privacy.dart';
import '../Secreens/offers.dart';
import '../Secreens/profile.dart';
import '../constants/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtomNavigationBar extends StatefulWidget {
  // ButtomNavigationBar({});

  @override
  State<ButtomNavigationBar> createState() => _ButtomNavigationBarState();
}

class _ButtomNavigationBarState extends State<ButtomNavigationBar> {
  int _selectedIndex = index;
  final List<Widget> _pages = [
    Home(),
    Profile(),
    Offers(),
    Cart(),
  ];

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.white, // Replace with your app bar color
    //   statusBarIconBrightness:
    //       Brightness.light, // Set the status bar icons to be light-colored
    // ));
    return Scaffold(
        drawer: Drawer(
          elevation: 0,
          width: 325.w,
          child: SafeArea(
            child: Column(
              children: [
                Transform.translate(
                  offset: Offset(-150, 0),
                  child: Image.asset(
                    'images/images/menu.png',
                    color: Color(0XFF1ABCBC),
                  ),
                ),
                Text(
                  'Menu',
                  style: TextStyle(fontSize: 20.sp, color: Color(0XFF1ABCBC)),
                ),
                ListTile(
                  leading: Icon(
                    Icons.cleaning_services_outlined,
                    color: Color(0XFF1ABCBC),
                  ),
                  title: Text(
                    'My order',
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  trailing: InkWell(
                    child: Icon(
                      Icons.arrow_back_ios,
                      textDirection: TextDirection.rtl,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => MyOrder()));
                    },
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.language,
                    color: Color(0XFF1ABCBC),
                  ),
                  title: Text(
                    'Change Languages',
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  trailing: Icon(
                    Icons.arrow_back_ios,
                    textDirection: TextDirection.rtl,
                    color: Colors.black,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.lock_clock_outlined,
                    color: Color(0XFF1ABCBC),
                  ),
                  title: Text(
                    'Change Password',
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  trailing: InkWell(
                    child: Icon(
                      Icons.arrow_back_ios,
                      textDirection: TextDirection.rtl,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangePassword()));
                    },
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.location_on_outlined,
                    color: Color(0XFF1ABCBC),
                  ),
                  title: Text(
                    'Change Country',
                    style: TextStyle(fontSize: 15),
                  ),
                  trailing: Icon(
                    Icons.arrow_back_ios,
                    textDirection: TextDirection.rtl,
                    color: Colors.black,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.info_outline_rounded,
                    color: Color(0XFF1ABCBC),
                  ),
                  title: Text(
                    'About us',
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  trailing: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => AboutUS()));
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      textDirection: TextDirection.rtl,
                      color: Colors.black,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Color(0XFF1ABCBC),
                  ),
                  title: Text(
                    'Contact us',
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  trailing: InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContactUs()));
                      });
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      textDirection: TextDirection.rtl,
                      color: Colors.black,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.app_blocking_outlined,
                    color: Color(0XFF1ABCBC),
                  ),
                  title: Text(
                    'Share App',
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  trailing: Icon(
                    Icons.arrow_back_ios,
                    textDirection: TextDirection.rtl,
                    color: Colors.black,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.help_outline,
                    color: Color(0XFF1ABCBC),
                  ),
                  title: Text(
                    'FQA',
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  trailing: InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => FAQs()));
                      });
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      textDirection: TextDirection.rtl,
                      color: Colors.black,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.edit_note,
                    color: Color(0XFF1ABCBC),
                  ),
                  title: Text(
                    'Term of use',
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  trailing: InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Terms()));
                      });
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      textDirection: TextDirection.rtl,
                      color: Colors.black,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.document_scanner_outlined,
                    color: Color(0XFF1ABCBC),
                  ),
                  title: Text(
                    'Privacy policy',
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  trailing: InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Privacy()));
                      });
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      textDirection: TextDirection.rtl,
                      color: Colors.black,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Color(0XFF1ABCBC),
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  trailing: Icon(
                    Icons.arrow_back_ios,
                    textDirection: TextDirection.rtl,
                    color: Colors.black,
                  ),
                ),
                Image(image: AssetImage('images/images/Component 8 – 1.png'))
              ],
            ),
          ),
        ),
        body: Container(
          child: _pages[_selectedIndex],
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        bottomNavigationBar: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: GNav(
              gap: 8,
              color: Colors.grey,
              activeColor: Colors.white,
              tabBackgroundColor: Color(0XFF1ABCBC),
              padding: EdgeInsets.all(16),
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'profile',
                ),
                GButton(
                  icon: Icons.local_offer_outlined,
                  text: 'offers',
                ),
                GButton(
                  icon: Icons.shopping_cart_outlined,
                  text: 'Cart',
                ),
              ],
            ),
          ),
        ));
  }
}
