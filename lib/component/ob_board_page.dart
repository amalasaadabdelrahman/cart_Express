import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildPage extends StatefulWidget {
  const BuildPage({Key? key, required this.color, required this.image})
      : super(key: key);
  final Color color;
  final Image image;

  @override
  State<BuildPage> createState() => _BuildPageState();
}

class _BuildPageState extends State<BuildPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            color: widget.color,
            child: Padding(
              padding: const EdgeInsets.only(top: 600, left: 30),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title',
                      style: TextStyle(
                          color: Color(0xFF1ABCBC),
                          fontWeight: FontWeight.bold,
                          fontSize: 50.sp,
                          fontFamily: "Roboto"),
                    ),
                    SizedBox(
                      height: 9.h,
                    ),
                    Text(
                      'It is a long established fact that a reader will be distracted layout.',
                      style: TextStyle(fontSize: 15.sp),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(100, 0),
            child: widget.image,
          )
        ],
      ),
    );
  }
}
