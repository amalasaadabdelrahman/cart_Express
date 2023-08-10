import 'package:cart_express/Secreens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool result = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.only(top: 68),
        child: Column(
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                  color: Color(0XFF1ABCBC),
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: Text(
                'Thank You For Registering With The Express Application',
                style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
            Transform.translate(
              offset: Offset(0, 290),
              child: Image(
                image: AssetImage(
                  'images/images/welcome.png',
                ),
              ),
            ),
            SizedBox(
              height: 170.h,
            ),
            Container(
              width: 150.w,
              height: 40.h,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                backgroundColor: Color(0XFF1ABCBC),
                child: Text(
                  'Home',
                  style: TextStyle(fontSize: 20.sp),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(23),
                    bottomLeft: Radius.circular(23),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
