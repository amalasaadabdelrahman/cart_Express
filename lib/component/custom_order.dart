import 'package:cart_express/Secreens/order_detials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOrder extends StatelessWidget {
  const CustomOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: Size(250.w, 75.h),
        ),
        child: Row(
          children: [
            Image.asset(
              'images/images/tr.png',
              height: 28.h,
              width: 42.w,
            ),
            SizedBox(width: 5.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order ID : 12892222',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  '12/2/2019 Total : 100S',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            SizedBox(width: 30.w),
            Text(
              'on Delivery',
              style: TextStyle(
                color: Colors.red,
                fontSize: 12.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => OrderDetails()));
              },
              child: Icon(
                Icons.navigate_next,
                color: Colors.black,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
