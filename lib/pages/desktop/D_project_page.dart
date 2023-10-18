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
  final titleStyle =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 31, color: Colors.white);

  final subStyle =
      TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
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
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      clipBehavior: Clip.antiAlias,
                      style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                        shape: const StadiumBorder(),
                        side: const BorderSide(color: Colors.white, width: 3),
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
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/app/images/ui12.png",
                filterQuality: FilterQuality.medium,
                width: widget.width * 0.3,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "メモ帳 顔認証",
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
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      clipBehavior: Clip.antiAlias,
                      style: OutlinedButton.styleFrom(
                        shape: const StadiumBorder(),
                        side: const BorderSide(color: Colors.white, width: 3),
                      ),
                      onPressed: GithubMemoURL,
                    ),
                  ),
                ],
              ),
              Image.asset(
                "assets/app/images/ui13.png",
                filterQuality: FilterQuality.medium,
                width: widget.width * 0.3,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: buildGithubCard(
                "assets/app/images/ui1.png", "旅行予約アプリ", GithubTravelURL),
          ),
          buildGithubCard(
              "assets/app/images/ui2.png", "デリバリーアプリ", GithubFoodURL),
        ],
      ),
    );
  }

  Widget buildGithubCard(String image, String name, VoidCallback callback) {
    return Column(
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
                primary: Colors.white,
                shape: const StadiumBorder(),
                side: const BorderSide(color: Colors.white, width: 3),
              ),
              onPressed: callback,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}
