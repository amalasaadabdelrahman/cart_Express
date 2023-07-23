import 'package:cart_express/Secreens/singup_screen.dart';
import 'package:cart_express/component/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../component/bottom_navigation_bar.dart';
import '../component/custom_text_form_field.dart';
import 'forgetpassword.dart';
import 'home.dart';

class LoginSecreen extends StatefulWidget {
  const LoginSecreen({Key? key}) : super(key: key);

  @override
  State<LoginSecreen> createState() => _LoginSecreenState();
}

class _LoginSecreenState extends State<LoginSecreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  validator() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      print('validated');
      emailController.text = "";
      passwordController.text = "";
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Logged in successfully'),
          backgroundColor: Color(0XFF1ABCBC),
        ),
      );
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => ButtomNavigationBar()));
    } else {
      print('not validated');
      emailController.text = "";
      passwordController.text = "";
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Incorrect email or password'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

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
                  offset: Offset(0, -10),
                  child: Image.asset(
                    'images/images/path_19629.png',
                    color: Color(0XFF1ABCBC),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 200.0, left: 20),
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
                width: 380.w,
                height: 500.h,
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
                        CustomTextFormField(
                          textFormField: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.black26,
                              ),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Color(0XFF1ABCBC),
                              ),
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
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
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormField(
                          textFormField: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: passwordController,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.black26,
                              ),
                              prefixIcon: Transform.rotate(
                                angle: 360,
                                child: Icon(
                                  Icons.key,
                                  color: Color(0XFF1ABCBC),
                                ),
                              ),
                              hintText: 'password',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                            validator: (String? value) {
                              if (value == null || value.trim().length == 0) {
                                return "*Required";
                              }
                              if (value.length < 6) {
                                return "password should not be less than 6 characters";
                              }
                            },
                          ),
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
                            onpressed: () {
                              validator();
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
}
