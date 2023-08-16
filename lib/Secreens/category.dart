import 'package:cart_express/Secreens/search.dart';
import 'package:cart_express/api/controller/category_api_congtroller.dart';
import 'package:cart_express/api/controller/product_api_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../component/custom_future_builder.dart';
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
  late Future<List<Products>?> _vegetables;
  late Future<List<Products>?> _leaves;
  late Future<List<Products>?> _chickens;
  late Future<List<Products>?> _meats;
  late Future<List<Products>?> _bakery;
  List<Categories> category = [];
  List<Products> fruit = [];
  List<Products> vegetable = [];
  List<Products> leave = [];
  List<Products> chicken = [];
  List<Products> meat = [];
  List<Products> bakery = [];

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
    _vegetables = ProductApiController().getVegetables();
    _leaves = ProductApiController().getLeaves();
    _chickens = ProductApiController().getChichens();
    _meats = ProductApiController().getMeat();
    _bakery = ProductApiController().getBakery();
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
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                        color: current == index
                                                            ? Colors.white
                                                            : const Color(
                                                                0XFF1ABCBC)),
                                              );
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
                                          '${category[index].name}',
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
                      ? CustomFutureBuilder(
                          list: fruit,
                          future: _fruit,
                        )
                      : const SizedBox(),
                  current == 1
                      ? CustomFutureBuilder(
                          list: vegetable, future: _vegetables)
                      : const SizedBox(),
                  current == 2
                      ? CustomFutureBuilder(list: leave, future: _leaves)
                      : const SizedBox(),
                  current == 3
                      ? CustomFutureBuilder(list: chicken, future: _chickens)
                      : const SizedBox(),
                  current == 4
                      ? CustomFutureBuilder(list: meat, future: _meats)
                      : const SizedBox(),
                  current == 5
                      ? CustomFutureBuilder(list: bakery, future: _bakery)
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
