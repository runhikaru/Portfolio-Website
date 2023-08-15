import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class SideBar extends StatefulWidget {
  final double height;
  final double width;

  const SideBar({super.key, required this.height, required this.width});
  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  List<Map> menu = [
    {"title": "戻る"},
  ];
  int sideBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.1,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: widget.height * 0.05),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              RotatedBox(
                quarterTurns: 3,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "戻る",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
