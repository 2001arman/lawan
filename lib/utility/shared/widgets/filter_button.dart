import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/constants_ui.dart';

class FilterButton extends StatelessWidget {
  final Color? backgroundColor;
  final double paddingVertical;

  const FilterButton({
    super.key,
    this.backgroundColor,
    this.paddingVertical = 14,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: paddingVertical),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            width: 1,
            color: kWhiteColor,
          ),
          color: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/filter.svg',
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 4),
            Text(
              'Filter',
              style: blackTextStyle.copyWith(fontWeight: medium),
            ),
          ],
        ),
      ),
    );
  }
}
