import 'package:cart_express/Secreens/choose_city.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _navigatetohome();
    super.initState();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 2500), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ChooseCity(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Image.asset(
            'images/images/background.png',
            color: Color(0XFF1ABCBC),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 44),
                    child: Row(
                      children: [
                        Image.asset(
                          'images/images/logo.png',
                          color: Color(0XFF1ABCBC),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 44,
                    ),
                    child: Text(
                      'it is a long established fact that a reader will \nbe distrbuted layout',
                      style: TextStyle(
                        fontSize: 11,
                        fontFamily: "Roboto",
                        color: Color(0XFF707070),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(200, 200),
            child: Image.asset('images/images/path_16.png'),
          ),
          Container(
            width: double.infinity,
            height: 251,
            child: Transform.translate(
              offset: Offset(0, 565),
              child: Image.asset(
                'images/images/fruit.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
