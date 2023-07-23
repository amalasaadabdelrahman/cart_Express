import 'package:flutter/material.dart';

import '../component/custom_cart.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My cart',
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            size: 30,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 16, right: 20),
            child: Text(
              'Total : ${380}\$',
              style: TextStyle(fontSize: 15),
            ),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Transform.translate(
              offset: Offset(0, -90),
              child: Container(
                width: double.infinity,
                height: 100,
                child: Image(
                  width: double.infinity,
                  image: AssetImage('images/images/Path 20528.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomCart()
          ],
        ),
      ),
    );
  }
}
