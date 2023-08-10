import 'package:cart_express/Secreens/auth/singup_screen.dart';
import 'package:cart_express/Secreens/utils/helpers.dart';
import 'package:cart_express/component/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../api/controller/user_api_controller.dart';
import '../home.dart';
import '../../component/custom_textformfield.dart';
import 'forgetpassword.dart';
import '../category.dart';

class LoginSecreen extends StatefulWidget {
  const LoginSecreen({Key? key}) : super(key: key);

  @override
  State<LoginSecreen> createState() => _LoginSecreenState();
}

class _LoginSecreenState extends State<LoginSecreen> with Helpers {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF1ABCBC),
        elevation: 0,
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
                  'Sing In',
                  style: TextStyle(
                    fontSize: 30.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 90.0,
              right: 20,
              left: 24,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                clipBehavior: Clip.antiAlias,
                width: 335.w,
                height: 427.h,
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
                          controller: emailController,
                          hintText: 'Email',
                          prefixIcon: Icons.email,
                          keyboardtype: TextInputType.emailAddress,
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
                          controller: passwordController,
                          hintText: 'Password',
                          prefixIcon: Icons.key,
                          keyboardtype: TextInputType.visiblePassword,
                          angle: 360,
                          validator: (String? value) {
                            if (value == null || value.trim().length == 0) {
                              return "*Required";
                            }
                            if (value.trim().length < 6) {
                              return "password should not be less than 6 characters";
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 208),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ForgetPassword()));
                            },
                            child: Text(
                              'Forget password',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                        Custom_Button(
                            text: 'Sing in',
                            onpressed: () async {
                              await performLogin();
                            }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an acount ?",
                              style: TextStyle(
                                  fontSize: 10.sp, fontWeight: FontWeight.w500),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SingUpScreen()));
                              },
                              child: Text(
                                'Sing Up',
                                style: TextStyle(
                                  color: Color(0XFF1ABCBC),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  bool checkData() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> login() async {
    bool status = await UserApiController().login(
        email: emailController.text,
        password: passwordController.text,
        context: context);
    if (status) {
      showSnackBar(
        context: context,
        message: 'Logged in successfully',
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    } else {
      showSnackBar(
          context: context, message: 'Login failed ,try again', error: true);
      print('Failed');
    }
  }

  Future<void> performLogin() async {
    if (_formKey.currentState != null &&
        _formKey.currentState!.validate() &&
        checkData()) {
      await login();
    }
  }
}
