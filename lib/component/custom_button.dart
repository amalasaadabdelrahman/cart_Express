import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Custom_Button extends StatefulWidget {
  const Custom_Button({Key? key, required this.text, required this.onpressed})
      : super(key: key);
  final String text;
  final Function() onpressed;
  @override
  State<Custom_Button> createState() => _Custom_ButtonState();
}

class _Custom_ButtonState extends State<Custom_Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: 180.w,
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(15),
          bottomStart: Radius.circular(15),
        ),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith(
            (states) => Color(0XFF1ABCBC),
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 20.sp,
          ),
        ),
        onPressed: widget.onpressed,
      ),
    );
  }
}
