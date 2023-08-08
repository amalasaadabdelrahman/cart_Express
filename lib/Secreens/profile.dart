import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../component/custom_button.dart';

import 'editprofile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
        child: Stack(
          children: [
            Container(
              width: double.infinity.w,
              height: 300.h,
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
                  setState(() {
                    Scaffold.of(context).openDrawer();
                  });
                },
                icon: Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 150),
                  child: Stack(
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
                ),
                Text(
                  'Shimaa Zakarya',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25.sp,
                    color: Color(0XFF1ABCBC),
                  ),
                ),
                SizedBox(
                  height: 29.h,
                ),
                Container(
                  width: 400.w,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(15),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Color(0XFF1ABCBC),
                      size: 30,
                    ),
                    title: Text(
                      'Email',
                      style:
                          TextStyle(fontSize: 15.sp, color: Color(0XFF1ABCBC)),
                    ),
                    trailing: Text(
                      'shimaazakarya123@gmail.com',
                      style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                ),
                Container(
                  width: 400.w,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(15),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Color(0XFF1ABCBC),
                      size: 30,
                    ),
                    title: Text(
                      'Phone',
                      style:
                          TextStyle(fontSize: 15.sp, color: Color(0XFF1ABCBC)),
                    ),
                    trailing: Text(
                      '11111',
                      style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Custom_Button(
                  text: 'Edit Profile',
                  onpressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => EditProfile()));
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
