import 'package:cart_express/component/custom_cart_button.dart';
import 'package:cart_express/component/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home.dart';
import '../component/custom_button.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneNumberController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  validate() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      userNameController.text = "";
      emailController.text = "";
      phoneNumberController.text = "";
      showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              child: Container(
                width: 270.w,
                height: 260.h,
                padding: EdgeInsets.all(44),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Image(
                      image: AssetImage('images/images/done.png'),
                    )),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'The form has been submitted successfully and we will respond as soon as possible ',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    CustomCartButton(
                      text: 'Ok',
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ),
            );
          });
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
          'Contact us ',
          style: TextStyle(fontSize: 20.sp),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/images/background.png'),
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 28.0, left: 20, right: 20, bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contact Info :',
                  style: TextStyle(
                    color: Color(0XFF1ABCBC),
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.email_outlined,
                          color: Color(0XFF1ABCBC),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Saudi Arabia @gmail.com',
                          style: TextStyle(fontSize: 10.sp),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Transform.rotate(
                          angle: 360,
                          child: Icon(
                            Icons.phone_enabled_outlined,
                            color: Color(0XFF1ABCBC),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          '5215654856922',
                          style: TextStyle(fontSize: 10.sp),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.phone_android,
                          color: Color(0XFF1ABCBC),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          '5215654856922',
                          style: TextStyle(fontSize: 10.sp),
                        ),
                      ],
                    ),
                    Image(image: AssetImage('images/images/Group 7808.png'))
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  width: double.infinity.w,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text(
                          'Contact Form',
                          style: TextStyle(
                            color: Color(0XFF1ABCBC),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        CustomTextField(
                          controller: userNameController,
                          hintText: 'User Name',
                          prefixIcon: Icons.person,
                          keyboardtype: TextInputType.text,
                          validator: (String? value) {
                            if (value == null || value.trim().length == 0) {
                              return "*Required";
                            } else if (value.trim().length < 3) {
                              return "Name should not be less than 3 characters";
                            } else
                              return null;
                          },
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
                        Container(
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
                              SizedBox(
                                width: 10.w,
                              ),
                              Icon(
                                Icons.person,
                                color: Color(0XFF1ABCBC),
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Text(
                                'Suggestions',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontFamily: "Roboto",
                                ),
                              ),
                              SizedBox(
                                width: 99.w,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  textDirection: TextDirection.rtl,
                                ),
                                color: Color(0XFF1ABCBC),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Container(
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
                              SizedBox(
                                width: 10.h,
                              ),
                              Icon(
                                Icons.message_sharp,
                                color: Color(0XFF1ABCBC),
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Text(
                                'Message',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontFamily: "Roboto",
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        CustomCartButton(
                            text: 'Send',
                            onPressed: () {
                              validate();
                            })
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
