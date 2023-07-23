import 'package:cart_express/Secreens/login_secreen.dart';
import 'package:flutter/material.dart';

import '../component/bottom_navigation_bar.dart';
import '../component/custom_button.dart';
import '../component/custom_text_form_field.dart';
import 'home.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isChecked = false;
  validator() {
    if (_formKey.currentState != null &&
        _formKey.currentState!.validate() &&
        isChecked) {
      print('validated');
      emailController.text = "";
      passwordController.text = "";
      userNameController.text = "";
      phoneNumberController.text = "";
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('You now have an account'),
          backgroundColor: Color(0XFF1ABCBC),
        ),
      );
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => ButtomNavigationBar()));
    } else {
      print('Not validated');
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
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                width: double.infinity,
                height: 300,
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
                  'Sing Up',
                  style: TextStyle(
                    fontSize: 30,
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
                width: 380,
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
                          height: 40,
                        ),
                        Image.asset(
                          'images/images/logo.png',
                          color: Color(0XFF1ABCBC),
                        ),
                        SizedBox(
                          height: 45,
                        ),
                        CustomTextFormField(
                          textFormField: TextFormField(
                            controller: userNameController,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.black26,
                              ),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Color(0XFF1ABCBC),
                              ),
                              hintText: 'User Name',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
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
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          textFormField: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                fontSize: 15,
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
                          height: 20,
                        ),
                        CustomTextFormField(
                          textFormField: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: phoneNumberController,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.black26,
                              ),
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Color(0XFF1ABCBC),
                              ),
                              hintText: 'Phone Number',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
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
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          textFormField: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: passwordController,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                fontSize: 15,
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
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Row(
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
                                    fontSize: 10, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Custom_Button(
                            text: 'Sing up',
                            onpressed: () {
                              validator();
                            }),
                        SizedBox(
                          height: 50,
                        )
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
