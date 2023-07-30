import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class thank extends StatefulWidget {
  const thank({super.key});

  @override
  State<thank> createState() => _thankState();
}

class _thankState extends State<thank> {
  bool result = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'images/backgroung.png',
              height: double.infinity.h,
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 200.h),
                    Image.asset(
                      'images/th1.png',
                      height: 1800.h,
                      width: 240.w,
                        fit: BoxFit.cover,
                    ),
                    SizedBox(height:60.h),
                    Text(
                      'Thank you',
                      style: TextStyle(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF1ABCBC),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      'I will Reply To You The Fastest \n    '
                          '           Available Time.',
                      style: TextStyle(
                        fontSize: 20.sp,

                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade600,

                      ),

                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 130),
                      child: Column(
                        children: [


                          SizedBox(height: 55.h),
                          ElevatedButton(
                            onPressed: () {
                              if (result ?? true) {
                                Navigator.pushReplacementNamed(
                                    context, '/splash');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0XFF1ABCBC),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(300.h),
                                    topRight: Radius.elliptical(40.w, 35.h)

                                ),
                              ),
                              minimumSize: Size(165.w, 45.h),
                            ),
                            child: Text(
                              'OK',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
