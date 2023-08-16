import 'package:flutter/material.dart';
import 'package:portfolio_website/utils.dart';

class MobileProjectPage extends StatefulWidget {
  MobileProjectPage(this.width, {super.key});

  double width;

  @override
  State<MobileProjectPage> createState() => _MobileProjectPageState();
}

class _MobileProjectPageState extends State<MobileProjectPage> {
  final titleStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 27);

  final subStyle = TextStyle(fontWeight: FontWeight.w300, fontSize: 15);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 10.0,
          child: Container(
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
                  children: [
                    Text(
                      "AI 翻訳",
                      style: titleStyle,
                    ),
                    const Divider(
                      color: Colors.black45,
                      thickness: 5,
                      height: 50,
                      indent: 0,
                      endIndent: 0,
                    ),
                    OutlinedButton(
                      child: const Text('github repo'),
                      clipBehavior: Clip.antiAlias,
                      style: OutlinedButton.styleFrom(
                        primary: Colors.black,
                        shape: const StadiumBorder(),
                        side: const BorderSide(color: Colors.black),
                      ),
                      onPressed: GithubTranslationURL,
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
            Text(
              name,
              style: titleStyle,
            ),
            const Divider(
              color: Colors.black45,
              thickness: 5,
              height: 50,
              indent: 0,
              endIndent: 0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: OutlinedButton(
                child: const Text('github repo'),
                clipBehavior: Clip.antiAlias,
                style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  shape: const StadiumBorder(),
                  side: const BorderSide(color: Colors.black),
                ),
                onPressed: callback,
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
