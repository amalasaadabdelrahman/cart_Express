import 'package:cart_express/Secreens/auth/login_secreen.dart';
import 'package:cart_express/component/custom_textformfield.dart';
import 'package:flutter/material.dart';

import '../component/custom_button.dart';

import 'home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  validator() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      print('validated');
      passwordController.text = "";
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('check your email to get new password'),
          backgroundColor: Color(0XFF1ABCBC),
        ),
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginSecreen()));
    } else {
      print('not validated');
      passwordController.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF1ABCBC),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginSecreen()));
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            'images/images/background.png',
            color: Color(0XFF1ABCBC),
          ),
          Container(
            width: double.infinity.w,
            height: 300.h,
            child: Transform.translate(
              offset: Offset(0, -60),
              child: Image.asset(
                'images/images/path_19629.png',
                color: Color(0XFF1ABCBC),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 90.0,
              right: 20,
              left: 24,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                clipBehavior: Clip.antiAlias,
                width: 335.w,
                height: 353.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Card(
                  elevation: 0,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40.h,
                        ),
                        Image.asset(
                          'images/images/logo.png',
                          color: Color(0XFF1ABCBC),
                        ),
                        SizedBox(
                          height: 28.h,
                        ),
                        Text(
                          'Forget Password',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        CustomTextField(
                          controller: passwordController,
                          hintText: 'Password',
                          prefixIcon: Icons.key,
                          angle: 360,
                          validator: (String? value) {
                            if (value == null || value.trim().length == 0) {
                              return "*Required";
                            }
                            if (value.length < 6) {
                              return "password should not be less than 6 characters";
                            }
                          },
                        ),
                        Custom_Button(
                            text: 'Resend',
                            onpressed: () {
                              validator();
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
