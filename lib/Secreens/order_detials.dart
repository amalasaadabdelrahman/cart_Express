import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../component/custom_container.dart';
import 'my_order.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50.h,
        backgroundColor: Color(0XFF1ABCBC),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Order Details ',
          style: TextStyle(fontSize: 20.sp),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MyOrder()));
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/images/background.png'),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              padding: EdgeInsets.only(top: 18, left: 15, right: 15),
              width: 335.w,
              height: 92.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Color(0XFFF0F5E0),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Order ID : ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17.sp,
                          color: Color(0XFF1ABCBC),
                        ),
                      ),
                      Text(
                        '12892222',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17.sp,
                          color: Color(0XFF1ABCBC),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'on Delivery',
                        style: TextStyle(color: Colors.red, fontSize: 12.sp),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '12/2/2019',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text('Total : ${100}\$',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 28.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, bottom: 7),
              child: Row(
                children: [
                  Text(
                    'Phone Number : ',
                    style:
                        TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '+972 595935907',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, bottom: 7),
              child: Row(
                children: [
                  Text(
                    'City : ',
                    style:
                        TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Gaza',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 7),
              child: Text(
                'Address : ',
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 18),
              child: Text(
                'Al Thalathini Street - Al Noor Building - 2nd Floor',
                style: TextStyle(color: Colors.grey),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Product :',
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 19.h,
            ),
            CustomContainer(),
            CustomContainer(),
            CustomContainer(),
          ],
        ),
      ),
    );
  }
}
