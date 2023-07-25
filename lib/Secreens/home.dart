import 'package:cart_express/component/custom_button.dart';
import 'package:cart_express/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> items = [
    '🌳 Vegetables',
    '🍇 Fruits',
    '🥩 Meat',
    '🌿 Papers',
  ];
  List<IconData> icons = [
    Icons.home,
    Icons.person,
    Icons.local_offer_outlined,
    Icons.shopping_cart_outlined
  ];
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
  int current = 0;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            setState(() {
              Scaffold.of(context).openDrawer();
            });
          },
          icon: Icon(
            Icons.menu,
            color: Color(0XFF1ABCBC).withOpacity(0.5),
          ),
        ),
        title: Text(
          'Home',
          style: TextStyle(
            fontSize: 20.sp,
            color: Color(0XFF1ABCBC),
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            width: 90.w,
            margin: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
              color: Colors.grey.withOpacity(0.1),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 50),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Color(0XFF1ABCBC).withOpacity(0.5),
                  size: 30,
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 27),
            child: Container(
              width: double.infinity.w,
              height: double.infinity.h,
              margin: EdgeInsets.only(top: 5),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity.w,
                    height: 60.h,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: items.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                current = index;
                              });
                            },
                            child: AnimatedContainer(
                              width: current == index ? 130.w : 140.w,
                              height: 40.h,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                color: current == index
                                    ? Color(0xFF1ABCBC)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              duration: Duration(milliseconds: 300),
                              child: Center(
                                child: Text(
                                  items[index],
                                  style: TextStyle(
                                    color: current == index
                                        ? Colors.white
                                        : Color(0xFF1ABCBC),
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  current == 0
                      ? Expanded(
                          child: Container(
                            width: double.infinity.w,
                            margin: EdgeInsets.only(top: 25),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: GridView.builder(
                              itemCount: 6,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: Image(image: images[index])),
                                      Text(
                                        fruits[index],
                                        style: TextStyle(
                                            fontSize: 13.sp, color: Colors.grey),
                                      ),
                                      Text(
                                        '5.00 \$ /K',
                                        style: TextStyle(
                                            fontSize: 18,
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
                                          borderRadius:
                                              BorderRadiusDirectional.only(
                                            topEnd: Radius.circular(11),
                                            bottomStart: Radius.circular(11),
                                          ),
                                        ),
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateColor.resolveWith(
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
                        )
                      : SizedBox(),
                  current == 1
                      ? Expanded(
                          child: Container(
                            width: double.infinity.w,
                            margin: EdgeInsets.only(top: 25),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: GridView.builder(
                              itemCount: 6,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 160.h / 200.w,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: Image(image: images[index])),
                                      Text(
                                        fruits[index],
                                        style: TextStyle(
                                            fontSize: 13.sp, color: Colors.grey),
                                      ),
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
                                          borderRadius:
                                              BorderRadiusDirectional.only(
                                            topEnd: Radius.circular(11),
                                            bottomStart: Radius.circular(11),
                                          ),
                                        ),
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateColor.resolveWith(
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
                        )
                      : SizedBox(),
                  current == 2
                      ? Expanded(
                          child: Container(
                            width: double.infinity.w,
                            margin: EdgeInsets.only(top: 25),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: GridView.builder(
                              itemCount: 6,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 160.h / 200.w,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: Image(image: images[index])),
                                      Text(
                                        fruits[index],
                                        style: TextStyle(
                                            fontSize: 13.sp, color: Colors.grey),
                                      ),
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
                                          borderRadius:
                                              BorderRadiusDirectional.only(
                                            topEnd: Radius.circular(11),
                                            bottomStart: Radius.circular(11),
                                          ),
                                        ),
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateColor.resolveWith(
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
                        )
                      : SizedBox(),
                  current == 3
                      ? Expanded(
                          child: Container(
                            width: double.infinity.w,
                            margin: EdgeInsets.only(top: 25),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: GridView.builder(
                              itemCount: 6,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 160.h / 200.w,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: Image(image: images[index])),
                                      Text(
                                        fruits[index],
                                        style: TextStyle(
                                            fontSize: 13.sp, color: Colors.grey),
                                      ),
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
                                          borderRadius:
                                              BorderRadiusDirectional.only(
                                            topEnd: Radius.circular(11),
                                            bottomStart: Radius.circular(11),
                                          ),
                                        ),
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateColor.resolveWith(
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
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
