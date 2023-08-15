// import 'package:flutter/material.dart';

// import '../../utils.dart';
// import '../../widget/fade_animation.dart';

// class DesktopProductPage extends StatefulWidget {
//   double width;
//   double height;

//   DesktopProductPage({
//     Key? key,
//     required this.width,
//     required this.height,
//   }) : super(key: key);

//   @override
//   State<DesktopProductPage> createState() => _DesktopProductPageState();
// }

// class _DesktopProductPageState extends State<DesktopProductPage> {
//   final titleStyle = TextStyle(fontWeight: FontWeight.w700, fontSize: 27);

//   final subStyle = TextStyle(fontWeight: FontWeight.w300, fontSize: 17);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             Stack(
//               alignment: Alignment.bottomCenter,
//               children: [
//                 Card(
//                   elevation: 20,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       height: widget.height,
//                       child: Image.asset(
//                         "assets/app/images/ui5.png",
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               width: 30,
//             ),
//             Container(
//               width: widget.width / 2.5,
//               child: Column(
//                 children: [
//                   Text("脱出ゲーム 寺うさ", style: titleStyle),
//                   Text(
//                     "風情のある、古風な日本の寺院からさまざまな謎や仕掛けを解いて2023年の初詣に行こう！",
//                     style: subStyle,
//                   ),
//                   const SizedBox(
//                     height: 60,
//                   ),
//                   buildStoreButton(
//                       "assets/app/apple_store.png", escTerausaIOSURL),
//                   const SizedBox(
//                     height: 12,
//                   ),
//                   buildStoreButton(
//                       "assets/app/play_store.png", escTerausaAndroidURL),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Container(
//               width: widget.width / 2.5,
//               child: Column(
//                 children: [
//                   Text("脱出ゲーム あぶら屋", style: titleStyle),
//                   Text(
//                     "ようこそ「旅館あぶら屋」へ\n空の移ろいと共に浮かび上がる\n草花が揺れる客室 木々の香る露天風呂",
//                     style: subStyle,
//                   ),
//                   const SizedBox(
//                     height: 60,
//                   ),
//                   buildStoreButton(
//                       "assets/app/apple_store.png", escAburayaIOSURL),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               width: 30,
//             ),
//             Stack(
//               alignment: Alignment.bottomCenter,
//               children: [
//                 Card(
//                   elevation: 20,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       height: widget.height,
//                       child: Image.asset(
//                         "assets/app/images/ui6.png",
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         Row(
//           children: [
//             buildProductCard("assets/app/images/ui7.png", escTabidachiIOSURL,
//                 escTabidachiAndroidURL, true),
//             buildProductCard("assets/app/images/ui8.png", escFairyIOSURL,
//                 escTanabataAndroidURL, false),
//             buildProductCard("assets/app/images/ui9.png", escTanabataIOSURL,
//                 escTanabataAndroidURL, true),
//           ],
//         ),
//         buildDivider(),
//       ],
//     );
//   }

//   Stack buildProductCard(String image, VoidCallback iosPressed,
//       VoidCallback androidPressed, bool android) {
//     return Stack(
//       alignment: Alignment.bottomCenter,
//       children: [
//         Card(
//           elevation: 20,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               width: widget.width / 3.5,
//               child: Image.asset(
//                 image,
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           bottom: 60,
//           child: FadeAnimation(
//             delay: 1.6,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 buildStoreButton("assets/app/apple_store.png", iosPressed),
//                 android
//                     ? buildStoreButton(
//                         "assets/app/play_store.png", androidPressed)
//                     : SizedBox(),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   //* プロダクト
//   InkWell buildStoreButton(String image, VoidCallback onPressed) {
//     return InkWell(
//       onTap: () {
//         onPressed();
//       },
//       child: Card(
//         color: Colors.white.withOpacity(0.5),
//         elevation: 36,
//         child: Container(
//           width: 220,
//           margin: const EdgeInsets.all(10.0),
//           child: Center(
//             child: Image.asset(
//               image,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Divider buildDivider() {
//     return Divider(
//       color: Colors.black45,
//       thickness: 0.5,
//       height: 50,
//       indent: 20,
//       endIndent: 20,
//     );
//   }
// }
