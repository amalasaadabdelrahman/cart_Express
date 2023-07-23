import 'package:cart_express/Secreens/login_secreen.dart';
import 'package:flutter/material.dart';

import '../component/custom_button.dart';
import '../component/custom_text_form_field.dart';
import 'home.dart';

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
            padding: const EdgeInsets.only(
              top: 90.0,
              right: 20,
              left: 24,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                clipBehavior: Clip.antiAlias,
                width: 380,
                height: 450,
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
                          height: 28,
                        ),
                        Text(
                          'Forget Password',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 50,
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
