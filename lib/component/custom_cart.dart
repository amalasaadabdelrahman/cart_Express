import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/const.dart';

class CustomCart extends StatefulWidget {
  const CustomCart({Key? key}) : super(key: key);

  @override
  State<CustomCart> createState() => _CustomCartState();
}

class _CustomCartState extends State<CustomCart> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
          width: double.infinity.w,
          height: 100.h,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24))),
          child: Row(
            children: [
              Image(
                image: AssetImage('images/images/apple.png'),
              ),
              SizedBox(
                width: 30.w,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Text(
                      'Apple',
                    ),
                  ),
                  Text(
                    '${5.00} \$/K',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFF1ABCBC)),
                  ),
                ],
              ),
              SizedBox(
                width: 75.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                          width: 30.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                              color: Color(0XFF1ABCBC),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(3),
                                  topRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(3),
                                  bottomRight: Radius.circular(3))),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                count != 0 ? count-- : count;
                              });
                            },
                            icon: Icon(
                              Icons.minimize,
                              color: Colors.white,
                            ),
                          )),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        '${count}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                          width: 30.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                              color: Color(0XFF1ABCBC),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(3),
                                  topRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(3),
                                  bottomRight: Radius.circular(3))),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                count++;
                              });
                            },
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }
}
