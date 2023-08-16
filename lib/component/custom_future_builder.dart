import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFutureBuilder extends StatefulWidget {
  CustomFutureBuilder({Key? key, required this.list, required this.future})
      : super(key: key);
  List<dynamic>? list;

  final Future<List<dynamic>?> future;
  @override
  State<CustomFutureBuilder> createState() => _CustomFutureBuilderState();
}

class _CustomFutureBuilderState extends State<CustomFutureBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>?>(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0XFF1ABCBC),
            ),
          );
        } else if (snapshot.hasError) {
          Center(
            child: Text('${snapshot.error}'),
          );
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          widget.list = snapshot.data!;
          return Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Container(
                width: double.infinity.w,
                margin: const EdgeInsets.only(top: 25),
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.list!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Image(
                              image:
                                  NetworkImage('${widget.list![index].image}'),
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Color(0XFF1ABCBC),
                                  ),
                                );
                              },
                            ),
                          ),
                          Text(
                            '${widget.list![index].name}',
                            style:
                                TextStyle(fontSize: 13.sp, color: Colors.grey),
                          ),
                          Text(
                            '${widget.list![index].price} \$ /K',
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
                              borderRadius: BorderRadiusDirectional.only(
                                topEnd: Radius.circular(11),
                                bottomStart: Radius.circular(11),
                              ),
                            ),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
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
      future: widget.future,
    );
  }
}
