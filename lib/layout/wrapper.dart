import 'package:flutter/material.dart';

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
        // centerTitle: true,
      ),
    );
  }
}
