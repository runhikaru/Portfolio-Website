import 'package:flutter/material.dart';
import 'package:portfolio_website/pages/desktop/D_contact_page.dart';
import 'package:portfolio_website/pages/desktop/D_developer_page.dart';
import 'package:portfolio_website/pages/desktop/D_policy_page.dart';
import 'package:portfolio_website/pages/desktop/D_product_page.dart';
import 'package:portfolio_website/pages/desktop/D_project_page.dart';
import 'package:portfolio_website/pages/mobile/M_contact_page.dart';
import 'package:portfolio_website/pages/mobile/M_developer_page.dart';
import 'package:portfolio_website/pages/mobile/M_policy_page.dart';
import 'package:portfolio_website/pages/mobile/M_product_page.dart';
import 'package:portfolio_website/pages/mobile/M_project_page.dart';
import 'package:sidebarx/sidebarx.dart';

import '../utils.dart';

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: Colors.white,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return const SizedBox(
          height: 100,
        );
      },
      items: [
        const SidebarXItem(
          icon: Icons.home,
          label: 'Products',
        ),
        const SidebarXItem(
          icon: Icons.person,
          label: 'About Me',
        ),
        const SidebarXItem(
          icon: Icons.folder,
          label: 'Projects',
        ),
        const SidebarXItem(
          icon: Icons.shield,
          label: 'Policy',
        ),
        const SidebarXItem(
          icon: Icons.mail,
          label: 'Contact',
        ),
        SidebarXItem(
            iconWidget: SizedBox(
                width: 20,
                height: 20,
                child: Image.asset('assets/app/github_icon.png')),
            label: 'Github',
            onTap: GithubURL),
        SidebarXItem(
            iconWidget: SizedBox(
                width: 20,
                height: 20,
                child: Image.asset('assets/app/apple_store_icon.png')),
            label: 'Apple Store',
            onTap: storeAppleURL),
        SidebarXItem(
            iconWidget: SizedBox(
                width: 20,
                height: 20,
                child: Image.asset(
                  'assets/app/play_storeicon.png',
                )),
            label: 'Play Store',
            onTap: storeAndroidURL),
      ],
    );
  }
}

class ScreensExample extends StatefulWidget {
  const ScreensExample({
    Key? key,
    required this.controller,
    required this.mobile,
  }) : super(key: key);

  final SidebarXController controller;
  final bool mobile;

  @override
  State<ScreensExample> createState() => ScreensExampleState();
}

class ScreensExampleState extends State<ScreensExample> {
  late double deviceWidth, deviceHeight;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        switch (widget.controller.selectedIndex) {
          case 0:
            return widget.mobile
                ? MobileProductPage(deviceWidth, deviceHeight)
                : DesktopProductPage(deviceWidth, deviceHeight);
          case 1:
            return widget.mobile ? MobileAboutmePage() : DesktopAboutmePage(deviceWidth, deviceHeight);
          case 2:
            return widget.mobile
                ? MobileProjectPage(deviceWidth)
                : DesktopProjectPage(deviceWidth, deviceHeight);
          case 3:
            return widget.mobile
                ? MobilePolicyPage(
                    isJP: true,
                    deviceWidth: deviceWidth,
                    deviceHeight: deviceHeight)
                : DesktopPolicyPage();
          case 4:
            return widget.mobile
                ? MobileContactPage()
                : DesktopContactPage(deviceWidth);
          default:
            return SizedBox();
        }
      },
    );
  }
}

const primaryColor = Color.fromARGB(255, 0, 0, 0);
const canvasColor = Color.fromARGB(255, 40, 40, 40);
const scaffoldBackgroundColor = Colors.black87;
const accentCanvasColor = Color.fromARGB(255, 101, 101, 106);
final actionColor = Color.fromARGB(255, 125, 125, 136).withOpacity(0.6);
final divider = Divider(color: Colors.white.withOpacity(0.3), height: 1);
