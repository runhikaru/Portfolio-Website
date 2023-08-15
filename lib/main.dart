import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_website/layout/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 向き指定
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, //縦固定
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ポートフォリオ',
      home: TEST(),
    );
  }
}

class TEST extends StatelessWidget {
  const TEST({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
    );
  }
}
