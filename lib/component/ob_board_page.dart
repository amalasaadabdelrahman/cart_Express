import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Stack(
      children: [
        Container(
          color: widget.color,
          child: Padding(
            padding: const EdgeInsets.only(top: 600, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title',
                  style: TextStyle(
                      color: Color(0XFF1ABCBC),
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      fontFamily: "Roboto"),
                ),
                SizedBox(
                  height: 9,
                ),
                Text(
                  'It is a long established fact that a reader will be distracted layout.',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(100, 0),
          child: widget.image,
        )
      ],
    );
  }
}
