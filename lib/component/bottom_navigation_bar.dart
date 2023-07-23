import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../Secreens/cart.dart';
import '../Secreens/home.dart';
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
    return Scaffold(
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
