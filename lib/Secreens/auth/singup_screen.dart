import 'package:cart_express/Secreens/auth/login_secreen.dart';
import 'package:cart_express/Secreens/utils/helpers.dart';
import 'package:cart_express/component/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../api/controller/user_api_controller.dart';
import '../home.dart';
import '../../component/custom_button.dart';

import '../category.dart';
import '../welcome.dart';
import 'dart:async';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> with Helpers {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isChecked = false;
  // validator() {
  //   {
  //     print('validated');
  //     emailController.text = "";
  //     passwordController.text = "";
  //     userNameController.text = "";
  //     phoneNumberController.text = "";
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('You now have an account'),
  //         backgroundColor: Color(0XFF1ABCBC),
  //       ),
  //     );
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => Home()));
  //   } else {
  //     print('Not validated');
  //   }
  // }

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
          Stack(
            alignment: Alignment.centerLeft,
            children: [
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
                padding: const EdgeInsets.only(bottom: 250.0, left: 20),
                child: Text(
                  'Sing Up',
                  style: TextStyle(
                    fontSize: 30.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
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
                width: 380.w,
                margin: EdgeInsets.only(bottom: 10),
                clipBehavior: Clip.antiAlias,
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
                          height: 45.h,
                        ),
                        CustomTextField(
                          controller: userNameController,
                          hintText: 'User Name',
                          prefixIcon: Icons.person,
                          validator: (String? value) {
                            if (value == null || value.trim().length == 0) {
                              return "*Required";
                            }
                            if (value.length < 3) {
                              return "user name should not be less than 3 characters";
                            } else {
                              return null;
                            }
                          },
                          keyboardtype: TextInputType.text,
                        ),
                        CustomTextField(
                          controller: emailController,
                          hintText: 'Email',
                          prefixIcon: Icons.email,
                          validator: (String? value) {
                            if (value == null || value.trim().length == 0) {
                              return "*Required";
                            }
                            if (!RegExp(
                                    r"^(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|'*')@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])")
                                .hasMatch(value)) {
                              return "Invalid Email Address";
                            } else
                              return null;
                          },
                        ),
                        CustomTextField(
                          controller: phoneNumberController,
                          hintText: 'Phone Number',
                          prefixIcon: Icons.phone,
                          validator: (String? value) {
                            if (value == null || value.trim().length == 0) {
                              return "*Required";
                            }
                            if (value.length < 10) {
                              return "phone number should not be less than 10 digits";
                            }
                            if (!RegExp(
                                    r"^(\+\d{1,2}\s?)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$")
                                .hasMatch(value)) {
                              return "Invalid phone number";
                            } else {
                              return null;
                            }
                          },
                          keyboardtype: TextInputType.number,
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
                          keyboardtype: TextInputType.visiblePassword,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = !isChecked;
                                });
                              },
                              checkColor: Color(0XFF1ABCBC),
                              activeColor: Colors.white,
                            ),
                            Text(
                              'you agree to the Terms& Privacy Policy',
                              style: TextStyle(
                                  fontSize: 10.sp, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Custom_Button(
                            text: 'Sing up',
                            onpressed: () {
                              // validator();
                              performRegister();
                            }),
                        SizedBox(
                          height: 50.h,
                        ),
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

  bool checkData() {
    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        userNameController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty) {
      return true;
    }
    // showSnackBar(context: context, message: 'Enter required data');
    return false;
  }

  FutureOr<void> register() async {
    bool status = await UserApiController().register(
      email: emailController.text,
      password: passwordController.text,
      name: userNameController.text,
      mobile: phoneNumberController.text,
      context: context,
    );
    if (status) {
      print('Success');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Welcome()));
    } else {
      showSnackBar(
          context: context,
          message: 'The account was not created successfully ,try again',
          error: true);
      print('Failed');
    }
  }

  FutureOr<void> performRegister() async {
    if (_formKey.currentState != null &&
        _formKey.currentState!.validate() &&
        checkData() &&
        isChecked) {
      await register();
    } else if (!isChecked) {
      showSnackBar(
          context: context,
          message: 'You should agree of our Terms & Policy',
          error: true);
    }
  }
}
