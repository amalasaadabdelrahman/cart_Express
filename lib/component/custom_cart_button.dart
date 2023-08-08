import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCartButton extends StatefulWidget {
  const CustomCartButton(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final Function() onPressed;

  @override
  State<CustomCartButton> createState() => _CustomCartButtonState();
}

class _CustomCartButtonState extends State<CustomCartButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAlias,
        width: 130.w,
        height: 40.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(23),
            bottomStart: Radius.circular(23),
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
              fontSize: 15.sp,
            ),
          ),
          onPressed: widget.onPressed,
        ));
  }
}
