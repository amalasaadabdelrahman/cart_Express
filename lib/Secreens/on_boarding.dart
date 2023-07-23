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
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = (index == 2);
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
                ? Custom_Button(
                    text: 'Get Started',
                    onpressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginSecreen(),
                        ),
                      );
                    })
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
