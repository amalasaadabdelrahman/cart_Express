import 'package:cart_express/api/controller/user_api_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../component/custom_button.dart';

import '../models/user.dart';
import 'editprofile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late Future<User?> _future;
  List<User> users = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = UserApiController().getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity.w,
              height: 300.h,
              child: Transform.translate(
                offset: const Offset(0, -10),
                child: Image.asset(
                  'images/images/Path_20529.png',
                  color: const Color(0XFF1ABCBC),
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
                icon: const Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                          radius: 110,
                          backgroundColor: Colors.white.withOpacity(0.5)),
                      CircleAvatar(
                          radius: 90,
                          backgroundColor: Colors.white.withOpacity(0.3)),
                      const CircleAvatar(
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
                    color: const Color(0XFF1ABCBC),
                  ),
                ),
                SizedBox(
                  height: 29.h,
                ),
                Container(
                  width: 400.w,
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(15),
                  child: ListTile(
                    leading: const Icon(
                      Icons.email,
                      color: Color(0XFF1ABCBC),
                      size: 30,
                    ),
                    title: Text(
                      'Email',
                      style: TextStyle(
                          fontSize: 15.sp, color: const Color(0XFF1ABCBC)),
                    ),
                    trailing: Text(
                      'shimaazakarya123@gmail.com',
                      style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                ),
                Container(
                  width: 400.w,
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(15),
                  child: ListTile(
                    leading: const Icon(
                      Icons.phone,
                      color: Color(0XFF1ABCBC),
                      size: 30,
                    ),
                    title: Text(
                      'Phone',
                      style: TextStyle(
                          fontSize: 15.sp, color: const Color(0XFF1ABCBC)),
                    ),
                    trailing: Text(
                      '11111',
                      style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  decoration: const BoxDecoration(
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
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfile()));
                  },
                )
              ],
            )
            // FutureBuilder<User?>(
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return const Center(
            //         child: CircularProgressIndicator(
            //           color: Color(0XFF1ABCBC),
            //         ),
            //       );
            //     } else if (snapshot.hasData) {
            //       return Column(
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.only(top: 150),
            //             child: Stack(
            //               alignment: Alignment.center,
            //               children: [
            //                 CircleAvatar(
            //                     radius: 110,
            //                     backgroundColor: Colors.white.withOpacity(0.5)),
            //                 CircleAvatar(
            //                     radius: 90,
            //                     backgroundColor: Colors.white.withOpacity(0.3)),
            //                 const CircleAvatar(
            //                   backgroundImage:
            //                       AssetImage('images/images/Ellipse58.png'),
            //                   radius: 70,
            //                 ),
            //               ],
            //             ),
            //           ),
            //           Text(
            //             '${snapshot.data!.name}',
            //             style: TextStyle(
            //               fontWeight: FontWeight.w700,
            //               fontSize: 25.sp,
            //               color: const Color(0XFF1ABCBC),
            //             ),
            //           ),
            //           SizedBox(
            //             height: 29.h,
            //           ),
            //           Container(
            //             width: 400.w,
            //             padding: const EdgeInsets.all(5),
            //             margin: const EdgeInsets.all(15),
            //             child: ListTile(
            //               leading: const Icon(
            //                 Icons.email,
            //                 color: Color(0XFF1ABCBC),
            //                 size: 30,
            //               ),
            //               title: Text(
            //                 'Email',
            //                 style: TextStyle(
            //                     fontSize: 15.sp,
            //                     color: const Color(0XFF1ABCBC)),
            //               ),
            //               trailing: Text(
            //                 '${snapshot.data!.email}',
            //                 style:
            //                     TextStyle(fontSize: 13.sp, color: Colors.grey),
            //                 maxLines: 1,
            //                 overflow: TextOverflow.ellipsis,
            //               ),
            //             ),
            //             decoration: const BoxDecoration(
            //               color: Colors.white,
            //               borderRadius: BorderRadius.only(
            //                 bottomLeft: Radius.circular(24),
            //                 topRight: Radius.circular(24),
            //               ),
            //             ),
            //           ),
            //           Container(
            //             width: 400.w,
            //             padding: const EdgeInsets.all(5),
            //             margin: const EdgeInsets.all(15),
            //             child: ListTile(
            //               leading: const Icon(
            //                 Icons.phone,
            //                 color: Color(0XFF1ABCBC),
            //                 size: 30,
            //               ),
            //               title: Text(
            //                 'Phone',
            //                 style: TextStyle(
            //                     fontSize: 15.sp,
            //                     color: const Color(0XFF1ABCBC)),
            //               ),
            //               trailing: Text(
            //                 '${snapshot.data!.mobile}',
            //                 style:
            //                     TextStyle(fontSize: 13.sp, color: Colors.grey),
            //                 maxLines: 1,
            //                 overflow: TextOverflow.ellipsis,
            //               ),
            //             ),
            //             decoration: const BoxDecoration(
            //               color: Colors.white,
            //               borderRadius: BorderRadius.only(
            //                 bottomLeft: Radius.circular(24),
            //                 topRight: Radius.circular(24),
            //               ),
            //             ),
            //           ),
            //           SizedBox(
            //             height: 40.h,
            //           ),
            //           Custom_Button(
            //             text: 'Edit Profile',
            //             onpressed: () {
            //               Navigator.pushReplacement(
            //                   context,
            //                   MaterialPageRoute(
            //                       builder: (context) => const EditProfile()));
            //             },
            //           )
            //         ],
            //       );
            //     } else {
            //       return Center(
            //         child: Text('${snapshot.error}'),
            //       );
            //     }
            //   },
            //   future: _future,
            // )
          ],
        ),
      ),
    );
  }
}
