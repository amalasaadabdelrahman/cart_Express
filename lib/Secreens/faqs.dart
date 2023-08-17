import 'package:cart_express/models/faq.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../api/controller/allQ_controller.dart';
import '../models/questions.dart';
import '../constants/const.dart';
import 'home.dart';

class FAQs extends StatefulWidget {
  const FAQs({super.key});

  @override
  State<FAQs> createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  late Future<List<Questions>?> _future;
  List<Questions> faqs = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = AllQApiController().AllQController();
    print(faqs);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        toolbarHeight: 50.h,
        backgroundColor: Color(0XFF1ABCBC),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      child: Icon(Icons.arrow_back_ios),
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                    ),
                    SizedBox(width: 130.w),
                    Text(
                      ' FAQ',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 20.sp),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          ExpansionPanelList(
            animationDuration: Duration(seconds: 1),
            elevation: 0,
            expandedHeaderPadding: EdgeInsets.zero,
            dividerColor: Colors.grey,
            expansionCallback: (panelIndex, isExpanded) {
              setState(() => faqs[panelIndex].isExpanded = !isExpanded);
            },
            children: faqs.map((dynamic faq) {
              return ExpansionPanel(
                backgroundColor: Colors.white,
                canTapOnHeader: true,
                isExpanded: faq.isExpanded,
                headerBuilder: (context, isExpanded) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 25),
                    child: FutureBuilder<List<Questions>?>(
                      future: _future,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasData &&
                            snapshot.data!.isNotEmpty) {
                          faqs = snapshot.data!;
                          return Text(
                            '${faqs[index].question}',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.normal,
                            ),
                          );
                        } else {
                          return const Text(
                            'No Data',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          );
                        }
                      },
                    ),
                  );
                },
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: FutureBuilder<List<Questions>?>(
                    future: _future, // Replace with your API call for answers
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child: const CircularProgressIndicator(
                          color: Color(0XFF1ABCBC),
                        ));
                      } else if (snapshot.hasData &&
                          snapshot.data!.isNotEmpty) {
                        return Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            '${faqs[index].answer}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        );
                      } else {
                        return const Text(
                          'No Data',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        );
                      }
                    },
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
