import 'package:flutter/material.dart';

class CustomBottomNavbar extends StatelessWidget {
  final Widget navbarItemWidget;
  final bool useGradient;
  const CustomBottomNavbar({
    super.key,
    required this.navbarItemWidget,
    this.useGradient = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              color: const Color(0xFFE5E6E5),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 2,
                  color: Colors.white,
                  spreadRadius: 0,
                )
              ],
            ),
            child: navbarItemWidget,
          ),
        ],
      ),
    );
  }
}
