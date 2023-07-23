import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({Key? key, required this.textFormField})
      : super(key: key);
  final TextFormField textFormField;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 65,
      child: widget.textFormField,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0XFF1ABCBC),
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
    );
  }
}
