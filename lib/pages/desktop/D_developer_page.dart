import 'package:flutter/material.dart';
import 'package:portfolio_website/widget/subtitle_widget.dart';

class DesktopAboutmePage extends StatefulWidget {
  DesktopAboutmePage(this.deviceWidth, this.deviceHeight, {super.key});

  double deviceWidth;
  double deviceHeight;

  @override
  State<DesktopAboutmePage> createState() => _DesktopAboutmePageState();
}

class _DesktopAboutmePageState extends State<DesktopAboutmePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SubtitleText(subtitle: "About me"),
            const SizedBox(
              height: 60,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     buildSkillCard("Flutter", "モバイルアプリのUIやWebの開発に用います。",
            //         "assets/app/flutter_icon.png"),
            //     buildSkillCard("Firebase", "ログイン機能や画像、動画の保存などの構築や運用に用います。",
            //         "assets/app/firebase_icon.png"),
            //     buildSkillCard(
            //         "Unity",
            //         "・オンラインFPSゲーム・3人称RPGゲーム・ARゲーム・2Dハイカジュなどの幅広いジャンルに対応して、開発ができます。",
            //         "assets/app/unity_icon.png"),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Card buildSkillCard(String title, String description, String imagePath) {
    return Card(
      elevation: 10.0,
      child: Container(
        height: 260,
        width: widget.deviceWidth / 3.6,
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: widget.deviceWidth * 0.007,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 16,
              ),
            ),
            const Spacer(),
            Image.asset(
              imagePath,
              filterQuality: FilterQuality.medium,
              fit: BoxFit.fitHeight,
              width: widget.deviceWidth * 0.15,
              height: widget.deviceHeight * 0.18,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
