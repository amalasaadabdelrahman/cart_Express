import 'package:cart_express/component/custom_button.dart';
import 'package:cart_express/models/offers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../api/controller/offers_api_controller.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  late Future<List<OffersModel>?> _future;
  List<OffersModel>? offers = [];
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
  int count = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = OffersApiController().getOffers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50.h,
        backgroundColor: const Color(0XFF1ABCBC),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Offers',
          style: TextStyle(fontSize: 20.sp),
        ),
        leading: IconButton(
          onPressed: () {
            setState(() {
              Scaffold.of(context).openDrawer();
            });
          },
          icon: const Icon(Icons.menu),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: FutureBuilder<List<OffersModel>?>(
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color(0XFF1ABCBC),
                    ),
                  );
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  offers = snapshot.data!;
                  return Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: offers!.length,
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
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 140.0, top: 10),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            radius: 25,
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.yellow,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(50),
                                                ),
                                              ),
                                            ),
                                          ),
                                          CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            radius: 23,
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.orange,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(50),
                                                ),
                                              ),
                                            ),
                                          ),
                                          CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            radius: 21,
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(55),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '${offers![index].discount}%',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        height: 50.h,
                                        width: 50.w,
                                        child: Image(
                                          image: NetworkImage(
                                            '${offers![index].image}',
                                          ),
                                          loadingBuilder: (context, child,
                                              loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            }
                                            return const Center(
                                              child: CircularProgressIndicator(
                                                color: Color(0XFF1ABCBC),
                                              ),
                                            );
                                          },
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${offers![index].name}',
                                      style: TextStyle(
                                          fontSize: 13.sp, color: Colors.grey),
                                    ),
                                    Text(
                                      '${offers![index].price} \$ /K',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.red,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                    Text(
                                      '${offers![index].priceOffer} \$ /K',
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
                                            (states) => const Color(0XFF1ABCBC),
                                          ),
                                        ),
                                        child: const Text(
                                          'Add to cart',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        onPressed: () {
                                          // setState(() {
                                          //   count += 1;
                                          // });
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: Text(
                      'No Data',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  );
                }
              },
              future: _future,
            )),
      ),
    );
  }
}
