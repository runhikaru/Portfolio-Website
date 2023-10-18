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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ポートフォリオ',
      home: SidebarXExampleApp(),
    );
  }
}