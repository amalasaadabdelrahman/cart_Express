import 'package:flutter/material.dart';

class CustomCart extends StatefulWidget {
  const CustomCart({Key? key}) : super(key: key);

  @override
  State<CustomCart> createState() => _CustomCartState();
}

class _CustomCartState extends State<CustomCart> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(24),
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24))),
        child: ListTile(
          leading: Image(
            image: AssetImage('images/images/apple.png'),
          ),
          title: Text('Apple'),
          subtitle: Text(
            '${5.00}\$/K',
            style: TextStyle(
                color: Color(0XFF1ABCBC),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          trailing: Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.close,
                  color: Color(0XFFFC3346),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0XFF1ABCBC),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            topLeft: Radius.circular(3),
                            bottomRight: Radius.circular(3),
                            bottomLeft: Radius.circular(12))),
                    child: IconButton(
                      onPressed: () {
                        count != 0 ? count-- : count;
                      },
                      icon: Icon(
                        Icons.minimize,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('${05}'),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0XFF1ABCBC),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            topLeft: Radius.circular(3),
                            bottomRight: Radius.circular(3),
                            bottomLeft: Radius.circular(12))),
                    child: IconButton(
                      onPressed: () {
                        count++;
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
