// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// class CustomCatrgoryName extends StatelessWidget {
//   const CustomCatrgoryName({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//       },
//       child: AnimatedContainer(
//         width: 150.w,
//         height: 10.h,
//         margin: EdgeInsets.all(5),
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.1),
//               spreadRadius: 2,
//               blurRadius: 3,
//               offset: Offset(0, 3),
//             ),
//           ],
//           color: current == index
//               ? Color(0xFF1ABCBC)
//               : Colors.white,
//           borderRadius: BorderRadius.circular(50),
//         ),
//         duration: Duration(milliseconds: 300),
//         child: Row(
//           children: [
//             Expanded(
//               child: Container(
//                 child: Image(
//                   image: NetworkImage(
//                       '${categories[index].image}'),
//                   loadingBuilder: (context, child,
//                       loadingProgress) {
//                     if (loadingProgress == null) {
//                       return child;
//                     }
//                     return CircularProgressIndicator(
//                       color: Color(0XFF1ABCBC),
//                     );
//                   },
//                 ),
//                 height: 30.h,
//               ),
//             ),
//             SizedBox(
//               width: 5.w,
//             ),
//             Text(
//               '${categories[index].name}',
//               style: TextStyle(
//                 color: current == index
//                     ? Colors.white
//                     : Color(0xFF1ABCBC),
//                 fontSize: 15,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
