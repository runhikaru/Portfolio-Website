import 'package:flutter/material.dart';

import '../../utils.dart';

class DesktopProjectPage extends StatefulWidget {
  DesktopProjectPage(this.width, this.height, {super.key});

  double width;
  double height;

  @override
  State<DesktopProjectPage> createState() => _DesktopProjectPageState();
}

class _DesktopProjectPageState extends State<DesktopProjectPage> {
  final titleStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 31);

  final subStyle = TextStyle(fontWeight: FontWeight.w300, fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 10.0,
          child: Container(
            height: widget.height * 0.9,
            width: double.infinity,
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/app/images/ui10.png",
                  filterQuality: FilterQuality.medium,
                  width: widget.width * 0.3,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "AI 翻訳アプリ",
                      style: titleStyle,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 70,
                      width: 190,
                      child: OutlinedButton(
                        child: const Text(
                          'github repo  ->',
                          style: TextStyle(fontSize: 16),
                        ),
                        clipBehavior: Clip.antiAlias,
                        style: OutlinedButton.styleFrom(
                          primary: Colors.black,
                          shape: const StadiumBorder(),
                          side: const BorderSide(color: Colors.black, width: 3),
                        ),
                        onPressed: GithubTranslationURL,
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  "assets/app/images/ui11.png",
                  filterQuality: FilterQuality.medium,
                  width: widget.width * 0.3,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: buildGithubCard(
              "assets/app/images/ui1.png", "旅行予約アプリ", GithubTravelURL),
        ),
        buildGithubCard("assets/app/images/ui2.png", "デリバリーアプリ", GithubFoodURL),
      ],
    );
  }

  Card buildGithubCard(String image, String name, VoidCallback callback) {
    return Card(
      elevation: 10.0,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Image.asset(
              image,
              filterQuality: FilterQuality.medium,
              // fit: BoxFit.fitWidth,
              width: widget.width * 0.8,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              name,
              style: titleStyle,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: 70,
                width: 190,
                child: OutlinedButton(
                  child: const Text(
                    'github repo  ->',
                    style: TextStyle(fontSize: 16),
                  ),
                  clipBehavior: Clip.antiAlias,
                  style: OutlinedButton.styleFrom(
                    primary: Colors.black,
                    shape: const StadiumBorder(),
                    side: const BorderSide(color: Colors.black, width: 3),
                  ),
                  onPressed: callback,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
