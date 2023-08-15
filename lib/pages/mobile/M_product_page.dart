import 'package:flutter/material.dart';

import '../../utils.dart';
import '../../widget/fade_animation.dart';

class MobileProductPage extends StatefulWidget {
  MobileProductPage(this.width, {super.key});

  double width;
  @override
  State<MobileProductPage> createState() => _MobileProductPageState();
}

class _MobileProductPageState extends State<MobileProductPage> {
  final titleStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 27);

  final subStyle = TextStyle(fontWeight: FontWeight.w300, fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              "assets/app/images/ui5.png",
            ),
            Positioned(
              bottom: 60,
              child: FadeAnimation(
                delay: 1.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildStoreButton(
                        "assets/app/apple_store.png", escTerausaIOSURL),
                    buildStoreButton(
                        "assets/app/play_store.png", escTerausaAndroidURL),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text("脱出ゲーム 寺うさ", style: titleStyle),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "風情のある、古風な日本の寺院からさまざまな謎や仕掛けを解いて2023年の初詣に行こう！",
            style: subStyle,
          ),
        ),
        buildDivider(),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              "assets/app/images/ui6.png",
              // height: deviceHeight / 1.7,
            ),
            Positioned(
              bottom: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildStoreButton(
                      "assets/app/apple_store.png", escTerausaIOSURL),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text("脱出ゲーム あぶら屋", style: titleStyle),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "ようこそ「旅館あぶら屋」へ" + "\n空の移ろいと共に浮かび上がる" + "\n草花が揺れる客室 木々の香る露天風呂",
            style: subStyle,
          ),
        ),
        buildDivider(),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              "assets/app/images/ui7.png",
              // height: deviceHeight / 1.7,
            ),
            Positioned(
              bottom: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildStoreButton(
                      "assets/app/apple_store.png", escTabidachiIOSURL),
                  buildStoreButton(
                      "assets/app/play_store.png", escTabidachiAndroidURL),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text("脱出ゲーム 旅立ち", style: titleStyle),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "個性的な生徒達を卒業させるべく奮闘！？" +
                "\n教師になって初めて受け持つことになったクラスには、自由奔放な生徒達が集まった。大きく羽ばたいて欲しいが。",
            style: subStyle,
          ),
        ),
        buildDivider(),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              "assets/app/images/ui8.png",
              // height: deviceHeight / 1.7,
            ),
            Positioned(
              bottom: 60,
              child: Row(
                children: [
                  buildStoreButton(
                      "assets/app/apple_store.png", escFairyIOSURL),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text("脱出ゲーム 異世界召喚", style: titleStyle),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "妖精の女王を名乗る”レーシィ ”に 異世界 に召喚されることに。" +
                "\n行方不明の父を探している”レーシィ ”と呪いの遺跡に行くのだがーー" +
                "\nきみは知ることになるだろう。呪いの正体　妖精の結末　父の行方　を。",
            style: subStyle,
          ),
        ),
        buildDivider(),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              "assets/app/images/ui9.png",
              // height: deviceHeight / 1.7,
            ),
            Positioned(
              bottom: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildStoreButton(
                      "assets/app/apple_store.png", escTanabataIOSURL),
                  buildStoreButton(
                      "assets/app/play_store.png", escTanabataAndroidURL),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text("脱出ゲーム 七夕の昔話", style: titleStyle),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "神に引き離された彦星と織姫" + "\n果たして 彦星は織姫に会うことができるのか！？",
            style: subStyle,
          ),
        ),
        buildDivider(),
      ],
    );
  }

  //* プロダクト
  InkWell buildStoreButton(String image, VoidCallback onPressed) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Card(
        color: Colors.white.withOpacity(0.5),
        elevation: 36,
        child: Container(
          width: widget.width / 2.7,
          margin: const EdgeInsets.all(10.0),
          child: Center(
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
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
}
