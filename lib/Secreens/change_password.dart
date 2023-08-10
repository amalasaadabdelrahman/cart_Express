import 'package:cart_express/component/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home.dart';
import '../component/custom_button.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var oldPaswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmPaswordController = TextEditingController();
  validator() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      print('validated');
      oldPaswordController.text = "";
      newPasswordController.text = "";
      confirmPaswordController.text = "";
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password changed Sucssesfully'),
          backgroundColor: Color(0XFF1ABCBC),
        ),
      );
    } else {
      print('not validated');
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
          'Change Password',
          style: TextStyle(fontSize: 20.sp),
        ),
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios),
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image(
            color: Color(0XFF1ABCBC),
            image: AssetImage('images/images/background.png'),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Container(
                    width: 500.w,
                    margin: EdgeInsets.only(
                        left: 20, right: 20, bottom: 100, top: 60),
                    padding: EdgeInsets.only(bottom: 32),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Card(
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 23.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              Image(
                                  color: Color(0XFF1ABCBC),
                                  image: AssetImage('images/images/logo.png')),
                              SizedBox(
                                height: 50.h,
                              ),
                              CustomTextField(
                                controller: oldPaswordController,
                                hintText: 'Old Password',
                                prefixIcon: Icons.key,
                                angle: 360,
                                validator: (String? value) {
                                  if (value == null ||
                                      value.trim().length == 0) {
                                    return "*Required";
                                  } else
                                    return null;
                                },
                                keyboardtype: TextInputType.visiblePassword,
                              ),
                              CustomTextField(
                                controller: newPasswordController,
                                hintText: 'New Password',
                                prefixIcon: Icons.key,
                                angle: 360,
                                validator: (String? value) {
                                  if (value == null ||
                                      value.trim().length == 0) {
                                    return "*Required";
                                  } else
                                    return null;
                                },
                                keyboardtype: TextInputType.visiblePassword,
                              ),
                              CustomTextField(
                                controller: confirmPaswordController,
                                hintText: 'Confirm Password',
                                prefixIcon: Icons.key,
                                angle: 360,
                                keyboardtype: TextInputType.visiblePassword,
                                validator: (String? value) {
                                  if (value == null ||
                                      value.trim().length == 0) {
                                    return "*Required";
                                  }
                                  if (confirmPaswordController.text !=
                                      newPasswordController.text) {
                                    return "error password";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              Custom_Button(
                                  text: 'Change',
                                  onpressed: () {
                                    validator();
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
