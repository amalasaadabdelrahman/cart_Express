import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../component/bottom_navigation_bar.dart';
import '../component/custom_cart_button.dart';
import '../component/custom_container.dart';
import 'citities.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  var controller = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  validator() {
    if (_key.currentState != null && _key.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              child: Container(
                width: 270.w,
                height: 244.h,
                padding: EdgeInsets.all(44),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: AssetImage('images/images/Group 7956.png')),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'The valid discount code will be 20% discount on total order',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    CustomCartButton(
                      text: 'Ok',
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckOut()));
                      },
                    )
                  ],
                ),
              ),
            );
          });
      controller.text = "";
    }
  }

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
            'Checkout',
            style: TextStyle(fontSize: 20.sp),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ButtomNavigationBar()));
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Stack(
          children: [
            Image(
              image: AssetImage('images/images/background.png'),
              color: Color(0XFF1ABCBC),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0, left: 20),
                      child: Text(
                        'Product :',
                        style: TextStyle(
                            fontSize: 17.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    CustomContainer(),
                    CustomContainer(),
                    CustomContainer(),
                    SizedBox(
                      height: 28.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Phone number: +972 597079670',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            'Address : ',
                            style: TextStyle(fontSize: 17.sp),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 19.0, left: 48),
                      child: Container(
                        width: 280.w,
                        height: 40.h,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 48),
                      child: Container(
                        width: 280.w,
                        height: 40.h,
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
                              Icons.location_on_outlined,
                              size: 35,
                              color: Color(0XFF1ABCBC),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Text(
                              'Address',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: "Roboto",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Container(
                      width: 335.w,
                      height: 207.h,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Color(0XFFF0F5E0),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total : '),
                              Text(
                                '${20}\$',
                                style: TextStyle(
                                    fontSize: 16.sp, color: Color(0XFF1ABCBC)),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Discount : '),
                              Text(
                                '${20}\$',
                                style: TextStyle(
                                    fontSize: 16.sp, color: Color(0XFF1ABCBC)),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Divider(
                            color: Color(0XFF1ABCBC),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total : '),
                              Text(
                                '${20}\$',
                                style: TextStyle(
                                    fontSize: 16.sp, color: Color(0XFF1ABCBC)),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomCartButton(
                                text: 'Order Now',
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(14)),
                                          child: Container(
                                            width: 270.w,
                                            height: 244.h,
                                            padding: EdgeInsets.all(44),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image(
                                                    image: AssetImage(
                                                        'images/images/sh.png')),
                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                                Text(
                                                  'Operation completed Order successfully',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                CustomCartButton(
                                                  text: 'Got Home',
                                                  onPressed: () {
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                ButtomNavigationBar()));
                                                  },
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                              ),
                              CustomCartButton(
                                text: 'Discount',
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(14)),
                                          child: Container(
                                            width: 270.w,
                                            height: 244.h,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 50.0,
                                                  left: 20,
                                                  right: 20),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Discount code ',
                                                    style: TextStyle(
                                                        fontSize: 20.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0XFFAECB1B)),
                                                  ),
                                                  Text(
                                                    'Please enter a valid code to get a discount .',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12.sp),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  Container(
                                                    width: double.infinity.w,
                                                    height: 40.h,
                                                    margin: EdgeInsets.only(
                                                        top: 20, bottom: 8),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(15),
                                                        bottomLeft:
                                                            Radius.circular(15),
                                                      ),
                                                      border: Border.all(
                                                        color:
                                                            Color(0XFF1ABCBC),
                                                      ),
                                                    ),
                                                    child: Form(
                                                      key: _key,
                                                      child: TextFormField(
                                                        controller: controller,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Discount code',
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .qr_code_2_rounded,
                                                            color: Color(
                                                                0XFF1ABCBC),
                                                          ),
                                                          border:
                                                              InputBorder.none,
                                                        ),
                                                        validator:
                                                            (String? value) {
                                                          if (value == null ||
                                                              value
                                                                      .trim()
                                                                      .length ==
                                                                  0) {
                                                            return "*Required";
                                                          } else if (value !=
                                                              '1234') {
                                                            return "Discount code is not correct";
                                                          } else
                                                            return null;
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  CustomCartButton(
                                                      text: 'Check',
                                                      onPressed: () {
                                                        validator();
                                                      })
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ]),
            )
          ],
        ));
  }
}