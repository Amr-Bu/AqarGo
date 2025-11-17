// import 'package:flutter/material.dart';
// import 'package:travel_app/core/constant/color.dart';
//
// class CardComponent extends StatelessWidget {
//    final void Function()? onTap;
//   final String image;
//   final String name;
//
//   const CardComponent({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: (){
//         Navigator.push(context,MaterialPageRoute(builder: (context)=>CountryDetiles()));
//       },
//       child: Container(
//         width: 150,
//         child: Card(
//           clipBehavior: Clip.hardEdge,
//           // shape: RoundedRectangleBorder(
//           //   borderRadius: BorderRadius.circular(16),
//           // ),
//           child: Stack(
//             children: [
//               Positioned.fill(
//                 child: Image.asset(
//                   "assets/images/test3.jpg",
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Positioned.fill(
//                 child: Container(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.bottomCenter,
//                       end: Alignment.topCenter,
//                       colors: [
//                         Colors.black.withOpacity(0.5),
//                         Colors.transparent,
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               // اسم المحافظة
//               Positioned(
//                 bottom: 8,
//                 right: 8,
//                 child: Text(
//                   "دمشق",
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//               // أيقونة المفضلة
//               Positioned(
//                 top: 0,
//                 left: 0,
//                 child: IconButton(
//                   constraints: BoxConstraints(),
//                   padding: EdgeInsets.zero,
//                   icon: Icon(
//                     Icons.favorite,
//                     color: whitColor,
//                     size: 20,
//                   ),
//                   onPressed: (){},
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
