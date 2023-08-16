import 'package:cart_express/Secreens/search.dart';
import 'package:cart_express/api/controller/category_api_congtroller.dart';
import 'package:cart_express/api/controller/product_api_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/category.dart';
import '../models/product.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  late Future<List<Categories>?> _future;
  late Future<List<Products>?> _fruit;
  List<Categories> category = [];
  List<Products> fruit = [];
  List<IconData> icons = [
    Icons.home,
    Icons.person,
    Icons.local_offer_outlined,
    Icons.shopping_cart_outlined
  ];
  List<AssetImage> images = [
    const AssetImage('images/images/apple.png'),
    const AssetImage('images/images/banana.png'),
    const AssetImage('images/images/orange.png'),
    const AssetImage('images/images/Cherry.png'),
    const AssetImage('images/images/Cherry.png'),
    const AssetImage('images/images/Cherry.png'),
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
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = CategoryApiController().getCategory();
    _fruit = ProductApiController().getFruits();
    print(fruit);
  }

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
            color: const Color(0XFF1ABCBC).withOpacity(0.5),
          ),
        ),
        title: Text(
          'Home',
          style: TextStyle(
            fontSize: 20.sp,
            color: const Color(0XFF1ABCBC),
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            width: 90.w,
            margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(14),
              ),
              color: Colors.grey.withOpacity(0.1),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 50),
              child: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Search()));
                },
                icon: Icon(
                  Icons.search,
                  color: const Color(0XFF1ABCBC).withOpacity(0.5),
                  size: 30,
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
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
              margin: const EdgeInsets.only(top: 5),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity.w,
                    height: 60.h,
                    child: FutureBuilder<List<Categories>?>(
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Color(0XFF1ABCBC),
                            ),
                          );
                        } else if (snapshot.hasData &&
                            snapshot.data!.isNotEmpty) {
                          category = snapshot.data!;
                          return ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: category.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      current = index;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    width: current == index ? 150.w : 140.w,
                                    height: 10.h,
                                    margin: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 2,
                                          blurRadius: 3,
                                          offset: const Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      color: current == index
                                          ? const Color(0xFF1ABCBC)
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    duration: const Duration(milliseconds: 300),
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Image(
                                            image: NetworkImage(
                                              '${category[index].image}',
                                            ),
                                            loadingBuilder: (context, child,
                                                loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return CircularProgressIndicator(
                                                  color: current == index
                                                      ? Colors.white
                                                      : const Color(
                                                          0XFF1ABCBC));
                                            },
                                          ),
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          width: 40.w,
                                          height: 40.h,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text(
                                          '${category![index].name}',
                                          style: TextStyle(
                                            color: current == index
                                                ? Colors.white
                                                : const Color(0xFF1ABCBC),
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        }
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Color(0XFF1ABCBC),
                          ),
                        );
                      },
                      future: _future,
                    ),
                  ),
                  current == 0
                      ? FutureBuilder<List<Products>?>(
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Color(0XFF1ABCBC),
                                ),
                              );
                            } else if (snapshot.hasError) {
                              Center(
                                child: Text('${snapshot.error}'),
                              );
                            } else if (snapshot.hasData &&
                                snapshot.data!.isNotEmpty) {
                              print(snapshot.error);
                              fruit = snapshot.data!;
                              return Container(
                                width: double.infinity.w,
                                margin: const EdgeInsets.only(top: 25),
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: fruit.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 160 / 200,
                                  ),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.all(5),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
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
                                            child: Image(
                                              image: NetworkImage(
                                                  '${fruit[index].image}'),
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return const CircularProgressIndicator(
                                                  color: Color(0XFF1ABCBC),
                                                );
                                              },
                                            ),
                                          ),
                                          Text(
                                            '${fruit[index].name}',
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            '${fruit[index].price} \$ /K',
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0XFF1ABCBC)),
                                          ),
                                          Container(
                                            clipBehavior: Clip.antiAlias,
                                            width: 150.w,
                                            height: 40.h,
                                            margin: const EdgeInsets.only(
                                              top: 40,
                                            ),
                                            decoration: const BoxDecoration(
                                              borderRadius:
                                                  BorderRadiusDirectional.only(
                                                topEnd: Radius.circular(11),
                                                bottomStart:
                                                    Radius.circular(11),
                                              ),
                                            ),
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateColor
                                                        .resolveWith(
                                                  (states) =>
                                                      const Color(0XFF1ABCBC),
                                                ),
                                              ),
                                              child: const Text(
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
                              );
                            } else {
                              return const Center(
                                child: Text(
                                  'No Data',
                                ),
                              );
                            }
                            return const Center(
                              child: Text(
                                'No Data',
                              ),
                            );
                          },
                          future: _fruit,
                        )
                      : const SizedBox(),
                  current == 1
                      ? Expanded(
                          child: Container(
                            width: double.infinity.w,
                            margin: const EdgeInsets.only(top: 25),
                            decoration: const BoxDecoration(
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
                                  margin: const EdgeInsets.all(5),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(
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
                                            fontSize: 13.sp,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        '5.00 \$ /K',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0XFF1ABCBC)),
                                      ),
                                      Container(
                                        clipBehavior: Clip.antiAlias,
                                        width: 150.w,
                                        height: 40.h,
                                        margin: const EdgeInsets.only(
                                          top: 40,
                                        ),
                                        decoration: const BoxDecoration(
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
                                              (states) =>
                                                  const Color(0XFF1ABCBC),
                                            ),
                                          ),
                                          child: const Text(
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
                      : const SizedBox(),
                  current == 2
                      ? Expanded(
                          child: Container(
                            width: double.infinity.w,
                            margin: const EdgeInsets.only(top: 25),
                            decoration: const BoxDecoration(
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
                                  margin: const EdgeInsets.all(5),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(
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
                                            fontSize: 13.sp,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        '5.00 \$ /K',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0XFF1ABCBC)),
                                      ),
                                      Container(
                                        clipBehavior: Clip.antiAlias,
                                        width: 150.w,
                                        height: 40.h,
                                        margin: const EdgeInsets.only(
                                          top: 40,
                                        ),
                                        decoration: const BoxDecoration(
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
                                              (states) =>
                                                  const Color(0XFF1ABCBC),
                                            ),
                                          ),
                                          child: const Text(
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
                      : const SizedBox(),
                  current == 3
                      ? Expanded(
                          child: Container(
                            width: double.infinity.w,
                            margin: const EdgeInsets.only(top: 25),
                            decoration: const BoxDecoration(
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
                                  margin: const EdgeInsets.all(5),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(
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
                                            fontSize: 13.sp,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        '5.00 \$ /K',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0XFF1ABCBC)),
                                      ),
                                      Container(
                                        clipBehavior: Clip.antiAlias,
                                        width: 150.w,
                                        height: 40.h,
                                        margin: const EdgeInsets.only(
                                          top: 40,
                                        ),
                                        decoration: const BoxDecoration(
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
                                              (states) =>
                                                  const Color(0XFF1ABCBC),
                                            ),
                                          ),
                                          child: const Text(
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
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
