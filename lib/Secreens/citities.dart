import 'package:cart_express/constants/const.dart';
import 'package:cart_express/models/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../api/controller/cities_api_controller.dart';
import '../models/base_response.dart';
import '../models/cities.dart';
import 'choose_city.dart';

class AllCitiy extends StatefulWidget {
  const AllCitiy({Key? key}) : super(key: key);

  @override
  State<AllCitiy> createState() => _AllCitiyState();
}

class _AllCitiyState extends State<AllCitiy> {
  late Future<BaseResponse> baseResponse;
  List<Cities>? all = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    baseResponse = ApiCitiesController().getCities();
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
        child: FutureBuilder<BaseResponse>(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Color(0XFF1ABCBC),
                ),
              );
            } else if (snapshot.hasData) {
              return InkWell(
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      all = snapshot.data!.cities;
                      List<Translations>? translation =
                          all![index].translations;
                      String? englishName = translation![0].name;
                      String? arabicName = translation[1].name;
                      return ListTile(
                        leading: Icon(
                          Icons.location_city,
                          color: Color(0XFF1ABCBC),
                        ),
                        title: Text(
                          englishName!,
                        ),
                        subtitle: Text(arabicName!),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Set the border radius of the ListTile
                          side: BorderSide(
                            color: Color(
                                0XFF1ABCBC), // Set the border color of the ListTile
                            width:
                                2.0.w, // Set the border width of the ListTile
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 18.h,
                      );
                    },
                    itemCount: all!.length),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ChooseCity()));
                },
              );
            } else {
              return Column(
                children: [
                  Icon(
                    Icons.warning,
                    size: 80,
                    color: Color(0XFF1ABCBC),
                  ),
                  Text(
                    'No Data',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  )
                ],
              );
            }
          },
          future: baseResponse,
        ),
      ),
    );
  }
}
