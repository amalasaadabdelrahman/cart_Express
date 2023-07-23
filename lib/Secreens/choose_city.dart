import 'package:flutter/material.dart';

import '../component/custom_button.dart';
import 'citities.dart';
import 'on_boarding.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseCity extends StatefulWidget {
  const ChooseCity({Key? key}) : super(key: key);

  @override
  State<ChooseCity> createState() => _ChooseCityState();
}

class _ChooseCityState extends State<ChooseCity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity.w,
            height: 380.h,
            child: Transform.translate(
              offset: const Offset(0, -110),
              child: Image.asset(
                'images/images/group_7809.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Image.asset(
            'images/images/background.png',
            color: Color(0XFF1ABCBC),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 300.h,
              ),
              Center(
                child: Image.asset(
                  'images/images/logo.png',
                  color: Color(0XFF1ABCBC),
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                'Choose the city',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontFamily: "Roboto",
                  color: Color(0XFF707070),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'it is long established that a reader will',
                style: TextStyle(
                  fontSize: 11.sp,
                  fontFamily: "Roboto",
                  color: Color(0XFF707070),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                width: 300.w,
                height: 50.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0XFF1ABCBC)),
                  borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(15),
                    bottomStart: Radius.circular(15),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_city,
                      size: 35,
                      color: Color(0XFF1ABCBC),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Text(
                      'City',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: "Roboto",
                      ),
                    ),
                    SizedBox(
                      width: 140.w,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Cities(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        textDirection: TextDirection.rtl,
                      ),
                      color: Color(0XFF1ABCBC),
                    ),
                  ],
                ),
              ),
              Custom_Button(
                text: 'OK',
                onpressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => OnBoarding()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
