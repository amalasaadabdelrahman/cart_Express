import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
      this.keyboardtype = TextInputType.emailAddress,
      required this.controller,
      required this.hintText,
      required this.prefixIcon,
      this.angle = 0,
      this.validator})
      : super(key: key);
  final TextInputType keyboardtype;
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final double angle;
  final String? Function(String?)? validator;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28.0, right: 28, bottom: 20),
      child: Theme(
        data: Theme.of(context)
            .copyWith(colorScheme: Theme.of(context).colorScheme)
            .copyWith(primaryColor: Color(0XFF1ABCBC)),
        child: TextFormField(
          keyboardType: widget.keyboardtype,
          controller: widget.controller,
          decoration: InputDecoration(
            hintStyle: TextStyle(
              fontSize: 15.sp,
              color: Colors.black26,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0XFF1ABCBC),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0XFF1ABCBC), width: 1.5),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            prefixIcon: Transform.rotate(
              angle: widget.angle,
              child: Icon(
                widget.prefixIcon,
                color: Color(0XFF1ABCBC),
              ),
            ),
            hintText: widget.hintText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            )),
          ),
          validator: widget.validator,
        ),
      ),
    );
  }
}
