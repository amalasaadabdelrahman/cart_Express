import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'choose_city.dart';

class Cities extends StatefulWidget {
  const Cities({Key? key}) : super(key: key);

  @override
  State<Cities> createState() => _CitiesState();
}

class _CitiesState extends State<Cities> {
  Future<http.Response> fetchAlbum() async {
    return await http
        .get(Uri.parse('https://sallah.hexacit.com/api/getCities'));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF1ABCBC),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ChooseCity(),
              ),
            );
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Cities',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto",
            fontSize: 24.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(
                  Icons.location_city,
                  color: Color(0XFF1ABCBC),
                ),
                title: Text(
                  '',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(''),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Set the border radius of the ListTile
                  side: BorderSide(
                    color: Color(
                        0XFF1ABCBC), // Set the border color of the ListTile
                    width: 2.0.w, // Set the border width of the ListTile
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 18.h,
              );
            },
            itemCount: 10),
      ),
    );
  }
}
