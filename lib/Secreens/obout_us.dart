import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home.dart';

class AboutUS extends StatefulWidget {
  const AboutUS({Key? key}) : super(key: key);

  @override
  State<AboutUS> createState() => _AboutUSState();
}

class _AboutUSState extends State<AboutUS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => Home()));
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Image(
                image: AssetImage('images/images/background.png'),
                color: Color(0XFF1ABCBC),
              ),
              Stack(
                children: [
                  Container(
                    height: 375.h,
                    child: Transform.translate(
                      offset: Offset(0, -100),
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors
                              .black54, // Replace with the desired color for the filter
                          BlendMode
                              .color, // Choose the blend mode for the filter
                        ),
                        child: SizedBox(
                          width: double.infinity.w,
                          child: Image(
                            image: AssetImage('images/images/v.png'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 375.w,
                        height: 474.5.h,
                        child: Transform.translate(
                          offset: Offset(0, 180),
                          child: Image(
                            image: AssetImage(
                                'images/images/Component 10 – 1.png'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 245.0, left: 30),
                        child: Text(
                          'About us',
                          style: TextStyle(
                              color: Color(0XFF1ABCBC),
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 340, left: 20, right: 20),
                        child: Text(
                          'Contrary to popular belief, Lorem Ipsum is not simple\ntext. It has roots in a piece of classical Latin literature from 45 BC, making \n Contrary to popular belief, Lorem Ipsum is not simply rand text. It has roots in a piece of classical Latin literature from 45 BC, making\nit over 2000 years old. Richard McClintock, a Latin profess at Hampden-Sydney College in Virginia, looked up one of the more obscure\nLatin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the\nword in classical literature, discovered the undoubtable s. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
                          style: TextStyle(
                            fontSize: 13.sp,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
