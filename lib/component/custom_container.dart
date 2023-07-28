import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatefulWidget {
  const CustomContainer({Key? key}) : super(key: key);

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 355.w,
      height: 70.h,
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Container(
            width: 90.w,
            height: 70.h,
            padding: EdgeInsets.only(top: 10, bottom: 18, right: 20),
            color: Color(0XFF1ABCBC),
            child: Column(
              children: [
                Text(
                  'Quantity\n     ${50}',
                  style: TextStyle(fontSize: 15.sp, color: Colors.white),
                )
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(-10, 0),
            child: Container(
              width: 100.w,
              height: 70.h,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Image(
                image: AssetImage('images/images/apple.png'),
              ),
            ),
          ),
          Text(
            'Apple',
            style: TextStyle(fontSize: 22.sp),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Text(
              '5.00\$ /K',
              style: TextStyle(fontSize: 15.sp, color: Color(0XFF959894)),
            ),
          ),
        ],
      ),
    );
  }
}
