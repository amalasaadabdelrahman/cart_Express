import 'package:cart_express/Secreens/login_secreen.dart';
import 'package:cart_express/component/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../component/ob_board_page.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final controller = PageController();
  bool isLastPage = false;
  int currentIndex = 0;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
            isLastPage = (currentIndex == 2);
          });
        },
        children: [
          BuildPage(
            color: Color(0XFFDCF1DA),
            image: Image.asset('images/images/radish.png'),
          ),
          BuildPage(
            color: Color(0XFFF8F3D5),
            image: Image.asset('images/images/lemon.png'),
          ),
          BuildPage(
            color: Color(0XFFFDCF1DA),
            image: Image.asset('images/images/Peas.png'),
          )
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(
          bottom: 10.0,
          right: 10,
          left: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isLastPage
                ? Container(
                    clipBehavior: Clip.antiAlias,
                    width: 150.w,
                    height: 40.h,
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                        topEnd: Radius.circular(15),
                        bottomStart: Radius.circular(15),
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginSecreen(),
                          ),
                        );
                      },
                      child: Text('Get started'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Color(0XFF1ABCBC),
                        ),
                      ),
                    ),
                  )
                : TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginSecreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Color(0XFF1ABCBC),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
            SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: WormEffect(
                activeDotColor: Color(0XFF1ABCBC),
              ),
              onDotClicked: (index) => controller.animateToPage(
                index,
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
              ),
            )
          ],
        ),
      ),
    );
  }
}
