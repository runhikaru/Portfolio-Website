import 'package:flutter/material.dart';

import '../pages/mobile/M_contact_page.dart';
import '../utils.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  static int breakPoint = 1000;

  static bool isDesktopScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= breakPoint;

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: LayoutBuilder(builder: (context, constraints) {
        return isDesktopScreen(context) ? Test() : Test();
      }),
    );
  }
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
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
        iconTheme: IconThemeData(color: Colors.black),
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
    );
  }
}
