import 'package:cart_express/component/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  List<AssetImage> images = [
    AssetImage('images/images/apple.png'),
    AssetImage('images/images/banana.png'),
    AssetImage('images/images/orange.png'),
    AssetImage('images/images/Cherry.png'),
    AssetImage('images/images/Cherry.png'),
    AssetImage('images/images/Cherry.png'),
  ];
  List<String> fruits = [
    'Apple',
    'Banana',
    'Orange',
    'Cherry',
    'Cherry',
    'Cherry',
  ];
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     'Offers',
      //     style: TextStyle(fontSize: 20),
      //   ),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: IconButton(
      //     onPressed: () {},
      //     icon: Icon(
      //       Icons.menu,
      //       size: 30,
      //     ),
      //   ),
      // ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity.w,
              height: 100.h,
              child: Image(
                width: double.infinity,
                image: AssetImage('images/images/Path 20528.png'),
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 160 / 200,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(5),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 140.0, top: 10),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(50),
                                    ),
                                  ),
                                ),
                                backgroundColor: Colors.transparent,
                                radius: 25,
                              ),
                              CircleAvatar(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(50),
                                    ),
                                  ),
                                ),
                                backgroundColor: Colors.transparent,
                                radius: 23,
                              ),
                              CircleAvatar(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(50),
                                    ),
                                  ),
                                ),
                                backgroundColor: Colors.transparent,
                                radius: 21,
                              ),
                              Text(
                                '12%',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: Image(image: images[index])),
                        Text(
                          fruits[index],
                          style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                        ),
                        Text('5.00 \$ /K',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.red,
                            )),
                        Text(
                          '5.00 \$ /K',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0XFF1ABCBC)),
                        ),
                        Container(
                          clipBehavior: Clip.antiAlias,
                          width: 150.w,
                          height: 40.h,
                          margin: EdgeInsets.only(
                            top: 40,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.only(
                              topEnd: Radius.circular(11),
                              bottomStart: Radius.circular(11),
                            ),
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Color(0XFF1ABCBC),
                              ),
                            ),
                            child: Text(
                              'Add to cart',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            onPressed: () {
                              setState(() {
                                count += 1;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
