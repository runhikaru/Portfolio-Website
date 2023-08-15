import 'package:flutter/material.dart';
import 'package:portfolio_website/layout/M_home_page.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  static int breakPoint = 1000;

  static bool isDesktopScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= breakPoint;

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: LayoutBuilder(builder: (context, constraints) {
        return isDesktopScreen(context) ? MobileHomePage() : MobileHomePage();
      }),
    );
  }
}