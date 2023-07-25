import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      ),
      body: Container(
        child: Stack(
          children: [
            Image(
              image: AssetImage('images/images/background.png'),
              color: Color(0XFF1ABCBC),
            ),
            Stack(
              children: [
                Transform.translate(
                  offset: Offset(0, -100),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors
                          .black45, // Replace with the desired color for the filter
                      BlendMode.color, // Choose the blend mode for the filter
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Image(
                        image: AssetImage('images/images/v.png'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 192.5),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
