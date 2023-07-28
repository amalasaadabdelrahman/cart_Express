import 'package:cart_express/constants/const.dart';
import 'package:flutter/material.dart';

import '../component/custom_cart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'check_out.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
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
          'My cart',
          style: TextStyle(fontSize: 20.sp),
        ),
        leading: IconButton(
          onPressed: () {
            setState(() {
              Scaffold.of(context).openDrawer();
            });
          },
          icon: Icon(Icons.menu),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  'Total: ',
                  style: TextStyle(fontSize: 10.sp),
                ),
                Text(
                  '${380}\$',
                  style: TextStyle(fontSize: 15.sp),
                )
              ],
            ),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return CustomCart();
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 12.h,
                );
              },
              itemCount: 5,
            ),
            Container(
              width: 174.w,
              height: 38.h,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => CheckOut()));
                },
                backgroundColor: Color(0XFF1ABCBC),
                child: Text(
                  'CheckOut (${5})',
                  style: TextStyle(fontSize: 15.sp),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
