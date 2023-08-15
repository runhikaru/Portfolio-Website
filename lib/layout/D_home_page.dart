// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:portfolio_website/pages/desktop/D_developer_page.dart';
// import 'package:portfolio_website/pages/desktop/D_policy_page.dart';
// import 'package:portfolio_website/utils.dart';

// import '../pages/desktop/D_contact_page.dart';
// import '../pages/desktop/D_product_page.dart';
// import '../widget/fade_animation.dart';

// class DesktopHomePage extends StatefulWidget {
//   const DesktopHomePage({super.key});

//   @override
//   State<DesktopHomePage> createState() => _DesktopHomePageState();
// }

// class _DesktopHomePageState extends State<DesktopHomePage> {
//   late double deviceWidth, deviceHeight;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     deviceWidth = MediaQuery.of(context).size.width;
//     deviceHeight = MediaQuery.of(context).size.height;
//   }

//   @override
//   Widget build(BuildContext context) {
//     const enStyle = TextStyle(
//         fontWeight: FontWeight.w500, fontSize: 17, color: Colors.grey);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white60,
//         elevation: 12,
//         title: const Text(
//           "Mizuno Hikaru",
//           style: TextStyle(
//               fontWeight: FontWeight.w500, fontSize: 27, color: Colors.black),
//         ),
//         centerTitle: true,
//         iconTheme: IconThemeData(color: Colors.black),
//         leading: FadeAnimation(
//           delay: 0.8,
//           child: IconButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   PageRouteBuilder(
//                     pageBuilder: (context, animation, secondaryAnimation) {
//                       return DesktopContactPage(deviceWidth);
//                     },
//                     transitionDuration: Duration(seconds: 3),
//                     reverseTransitionDuration: Duration(seconds: 3),
//                     transitionsBuilder:
//                         (context, animation, secondaryAnimation, child) {
//                       final color = ColorTween(
//                         begin: Colors.transparent,
//                         end: Colors.black, // ブラックアウト
//                         // end: Colors.white, // ホワイトアウト
//                       ).animate(CurvedAnimation(
//                         parent: animation,
//                         // 前半
//                         curve: Interval(
//                           0.0,
//                           0.5,
//                           curve: Curves.easeInOut,
//                         ),
//                       ));
//                       final opacity = Tween<double>(
//                         begin: 0.0,
//                         end: 1.0,
//                       ).animate(CurvedAnimation(
//                         parent: animation,
//                         // 後半
//                         curve: Interval(
//                           0.5,
//                           1.0,
//                           curve: Curves.easeInOut,
//                         ),
//                       ));
//                       return AnimatedBuilder(
//                         animation: animation,
//                         builder: (context, child) {
//                           return Container(
//                             color: color.value,
//                             child: Opacity(
//                               opacity: opacity.value,
//                               child: child,
//                             ),
//                           );
//                         },
//                         child: child,
//                       );
//                     },
//                   ),
//                 );
//               },
//               icon: Icon(
//                 Icons.mail,
//                 size: 35,
//               )),
//         ),
//         actions: [
//           FadeAnimation(
//             delay: 0.8,
//             child: GestureDetector(
//                 onTap: () {
//                   GithubURL();
//                 },
//                 child: Image.asset('assets/app/github_icon.png')),
//           ),
//           FadeAnimation(
//             delay: 1,
//             child: GestureDetector(
//                 onTap: () {
//                   storeAppleURL();
//                 },
//                 child: Image.asset('assets/app/apple_store_icon.png')),
//           ),
//           FadeAnimation(
//             delay: 1.2,
//             child: GestureDetector(
//                 onTap: () {
//                   storeAndroidURL();
//                 },
//                 child: Image.asset('assets/app/play_storeicon.png')),
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 30),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 60,
//                 ),
//                 //Services
//                 buildBigTitle("Services"),
//                 FadeAnimation(
//                   delay: 1.2,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       buildSkillCard("Flutter", "モバイルアプリのUIやWebの開発に用います。",
//                           "assets/app/flutter_icon.png"),
//                       buildSkillCard("Firebase", "ログイン機能や画像、動画の保存などの構築や運用に用います。",
//                           "assets/app/firebase_icon.png"),
//                       buildSkillCard("Unity", "・オンラインFPSゲーム・3人称RPGゲーム・ARゲーム・2Dハイカジュなどの幅広いジャンルに対応して、開発ができます。",
//                           "assets/app/unity_icon.png"),
//                     ],
//                   ),
//                 ),
              
//                 const SizedBox(
//                   height: 30,
//                 ),
              
//                 //Products Title
//                 buildBigTitle("Products"),
              
//                 //Products
//                 DesktopProductPage(width: deviceWidth, height: deviceHeight),
              
//                 const SizedBox(
//                   height: 30,
//                 ),
              
//                 //About me
//                 buildBigTitle("About Me"),
              
//                 DesktopAboutmePage(),
              
//                 //PrivacyPolicy
//                 buildBigTitle("PrivacyPolicy"),
              
//                 const SizedBox(
//                   height: 30,
//                 ),
              
//                 DesktopPolicyPage(),
              
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                     "(c) 2021 Mizuno Hikaru",
//                     style: TextStyle(
//                       fontSize: 13,
//                       color: Colors.black.withOpacity(0.5),
//                     ),
//                   ),
//                 ),
              
//                 const SizedBox(
//                   height: 20,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Card buildSkillCard(String title, String description, String imagePath) {
//     return Card(
//       elevation: 10.0,
//       child: Container(
//         height: 240,
//         width: deviceWidth / 3.6,
//         margin: const EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             SizedBox(
//               height: deviceWidth * 0.007,
//             ),
//             Text(
//               title,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//             Text(
//               description,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 fontSize: 12,
//               ),
//             ),
//             const Spacer(),
//             Image.asset(
//               imagePath,
//               filterQuality: FilterQuality.medium,
//               fit: BoxFit.fitHeight,
//               width: deviceWidth * 0.15,
//               height: deviceHeight * 0.18,
//             ),
//             const Spacer(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Container buildBigTitle(String title) {
//   return Container(
//       width: double.infinity,
//       height: 100,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Stack(
//             alignment: AlignmentDirectional.bottomStart,
//             children: [
//               Text(
//                 title,
//                 style: TextStyle(
//                     fontSize: 57,
//                     fontWeight: FontWeight.w600,
//                     color: Color.fromARGB(43, 235, 192, 255)),
//               ),
//               Text(
//                 title,
//                 style: TextStyle(
//                     fontSize: 26,
//                     fontWeight: FontWeight.w600,
//                     color: Color.fromARGB(255, 86, 86, 86)),
//               ),
//             ],
//           ),
//         ],
//       ));
// }
