import 'package:cart_express/Secreens/profile.dart';
import 'package:flutter/material.dart';
import '../component/custom_button.dart';
import '../component/custom_text_form_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  final phoneController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  validator() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      print('validated');
      emailController.text = "";
      userNameController.text = "";
      phoneController.text = "";
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Edited successfully'),
          backgroundColor: Color(0XFF1ABCBC),
        ),
      );
    } else {
      print('not validated');
      emailController.text = "";
      userNameController.text = "";
      phoneController.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  child: Transform.translate(
                    offset: Offset(0, -10),
                    child: Image.asset(
                      'images/images/Path_20529.png',
                      color: Color(0XFF1ABCBC),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 42.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Profile()));
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 150, left: 100),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                              radius: 110,
                              backgroundColor: Colors.white.withOpacity(0.5)),
                          CircleAvatar(
                              radius: 90,
                              backgroundColor: Colors.white.withOpacity(0.3)),
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('images/images/Ellipse58.png'),
                            radius: 70,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.edit,
                            size: 25,
                            color: Color(0XFF1ABCBC),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Expanded(
                child: Container(
                  width: 500,
                  margin:
                      EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 5),
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
                            Text(
                              'Edit Profile',
                              style: TextStyle(
                                color: Color(0XFF1ABCBC),
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 30,
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
                                      borderSide: BorderSide.none),
                                ),
                                validator: (String? value) {
                                  if (value == null ||
                                      value.trim().length == 0) {
                                    return "*Required";
                                  }
                                  if (value.trim().length < 3) {
                                    return "User Name should not be less than 3 character";
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
                                  if (value == null ||
                                      value.trim().length == 0) {
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
                                controller: phoneController,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black26,
                                  ),
                                  prefixIcon: Transform.rotate(
                                    angle: 360,
                                    child: Icon(
                                      Icons.phone,
                                      color: Color(0XFF1ABCBC),
                                    ),
                                  ),
                                  hintText: 'Phone',
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                ),
                                validator: (String? value) {
                                  if (value == null ||
                                      value.trim().length == 0) {
                                    return "*Required";
                                  }
                                  if (value.length < 10) {
                                    return "phone number should not be less than 10 numbers";
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
                            Custom_Button(
                                text: 'Save',
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
            )
          ],
        ),
      ),
    );
  }
}
