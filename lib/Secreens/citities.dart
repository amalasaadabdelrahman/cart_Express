import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/cities.dart';
import 'choose_city.dart';

class Cities extends StatefulWidget {
  const Cities({Key? key}) : super(key: key);

  @override
  State<Cities> createState() => _CitiesState();
}

class _CitiesState extends State<Cities> {
  List<dynamic> cities = [];
  void getCities() async {
    print('fetched data');
    const url = 'https://sallah.hexacit.com/api/getCities';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      cities = json['cities'];
    });
  }

  @override
  void initState() {
    getCities();
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
            fontSize: 24,
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
                  '${cities[index]['name']}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
            itemCount: cities.length),
      ),
    );
  }
}
