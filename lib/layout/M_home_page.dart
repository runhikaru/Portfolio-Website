import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/mobile/M_contact_page.dart';
import '../pages/mobile/M_developer_page.dart';
import '../pages/mobile/M_policy_page.dart';
import '../pages/mobile/M_product_page.dart';
import '../pages/mobile/M_project_page.dart';
import '../utils.dart';
import '../widget/fade_animation.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({super.key});

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  late double deviceWidth, deviceHeight;

  bool isJP = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white60,
        elevation: 12,
        title: const Text(
          "Mizuno Hikaru",
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 27, color: Colors.black),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return MobileContactPage();
                },
                transitionDuration: Duration(seconds: 3),
                reverseTransitionDuration: Duration(seconds: 3),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  final color = ColorTween(
                    begin: Colors.transparent,
                    end: Colors.black, // ブラックアウト
                    // end: Colors.white, // ホワイトアウト
                  ).animate(CurvedAnimation(
                    parent: animation,
                    // 前半
                    curve: Interval(
                      0.0,
                      0.5,
                      curve: Curves.easeInOut,
                    ),
                  ));
                  final opacity = Tween<double>(
                    begin: 0.0,
                    end: 1.0,
                  ).animate(CurvedAnimation(
                    parent: animation,
                    // 後半
                    curve: Interval(
                      0.5,
                      1.0,
                      curve: Curves.easeInOut,
                    ),
                  ));
                  return AnimatedBuilder(
                    animation: animation,
                    builder: (context, child) {
                      return Container(
                        color: color.value,
                        child: Opacity(
                          opacity: opacity.value,
                          child: child,
                        ),
                      );
                    },
                    child: child,
                  );
                },
              ),
            );
          },
          icon: Icon(
            Icons.mail,
            size: 35,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              GithubURL();
            },
            child: Image.asset('assets/app/github_icon.png'),
          ),
          GestureDetector(
            onTap: () {
              storeAppleURL();
            },
            child: Image.asset('assets/app/apple_store_icon.png'),
          ),
          GestureDetector(
            onTap: () {
              storeAndroidURL();
            },
            child: Image.asset('assets/app/play_storeicon.png'),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Services
                buildBigTitle("Services"),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildSkillCard("Flutter", "モバイルアプリやWebサイトの開発に用います。",
                        "assets/app/flutter_icon.png"),
                    buildSkillCard("Firebase", "ログイン機能や画像、動画の保存に用います。",
                        "assets/app/firebase_icon.png"),
                  ],
                ),

                const SizedBox(
                  height: 12,
                ),

                buildSkillCard_Large(),

                buildDivider(),

                //Products
                buildBigTitle("Products"),

                const SizedBox(
                  height: 12,
                ),

                MobileProductPage(deviceWidth),

                //About me
                buildBigTitle("About Me"),

                const SizedBox(
                  height: 12,
                ),

                MobileAboutmePage(),

                buildDivider(),

                //Projects
                buildBigTitle("Projects"),

                const SizedBox(
                  height: 12,
                ),

                MobileProjectPage(deviceWidth),

                buildDivider(),

                //Policy
                buildBigTitle("Policy"),

                const SizedBox(
                  height: 12,
                ),

                MobilePolicyPage(
                    isJP: isJP,
                    deviceWidth: deviceWidth,
                    deviceHeight: deviceHeight),

                const SizedBox(
                  height: 30,
                ),

                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "(c) 2021 Mizuno Hikaru",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card buildSkillCard(String title, String description, String imagePath) {
    return Card(
      elevation: 10.0,
      child: Container(
        height: 180,
        width: deviceWidth / 2.7,
        margin: const EdgeInsets.all(10.0),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(10),
        //   color: const Color.fromARGB(255, 165, 165, 165),
        // ),
        child: Column(
          children: [
            SizedBox(
              height: deviceWidth * 0.007,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 14,
              ),
            ),
            const Spacer(),
            Image.asset(
              imagePath,
              filterQuality: FilterQuality.medium,
              fit: BoxFit.contain,
              width: 80,
              height: 80,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget buildSkillCard_Large() {
    return Card(
      elevation: 10.0,
      color: Colors.white,
      child: Container(
        height: 180,
        width: deviceWidth,
        margin: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              height: 180,
              width: deviceWidth / 1.7,
              child: const Column(
                children: [
                  Text(
                    "Unity",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "・オンラインFPSゲーム・3人称RPGゲーム・ARゲーム・2Dハイカジュなどの幅広いジャンルに対応して、開発ができます。",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              "assets/app/unity_icon.png",
              filterQuality: FilterQuality.medium,
              fit: BoxFit.contain,
              width: deviceWidth * 0.15,
            ),
          ],
        ),
      ),
    );
  }

  Divider buildDivider() {
    return Divider(
      color: Colors.black45,
      thickness: 0.5,
      height: 50,
      indent: 0,
      endIndent: 0,
    );
  }

  Container buildBigTitle(String title) {
    return Container(
        width: double.infinity,
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 57,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(43, 235, 192, 255)),
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 86, 86, 86)),
                ),
              ],
            ),
          ],
        ));
  }
}
