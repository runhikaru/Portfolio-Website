import 'package:flutter/material.dart';

class MobileAboutmePage extends StatelessWidget {
  const MobileAboutmePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        "私は、モバイルアプリのフロントエンドとバックエンドのプログラマーです。" +
            "\n\n2019年にFlutterとUnityを使ったモバイルアプリの開発を始めました。" +
            "0から作ったいくつかのアプリをストアに公開し、広告収入で月20万を売り上げました。",
        style: TextStyle(fontSize: 14),
      ),
      const SizedBox(
        height: 36,
      ),
      Image.asset("assets/face.png")
    ]);
  }
}
