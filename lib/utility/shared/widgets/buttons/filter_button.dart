import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lawan/utility/util/dialogs/dialog_filter.dart';

import '../../constants/constants_ui.dart';

class FilterButton extends StatelessWidget {
  final bool useBlur;
  final double paddingVertical;
  final Color iconColor;
  final Color textColor;
  final bool fromLeaderBoard;

  const FilterButton({
    super.key,
    this.useBlur = false,
    this.paddingVertical = 14,
    required this.iconColor,
    required this.textColor,
    this.fromLeaderBoard = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fromLeaderBoard
          ? DialogFilter.showFilterLeaderDialog
          : DialogFilter.showFilterDialog,
      child: Container(
        width: 90,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            width: 1,
            color: kGreyColor,
          ),
          color: useBlur ? Colors.black.withOpacity(0.3) : null,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: BackdropFilter(
            filter: useBlur
                ? ImageFilter.blur(sigmaX: 40, sigmaY: 40)
                : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/filter.svg',
                  width: 20,
                  height: 20,
                  // ignore: deprecated_member_use
                  color: iconColor,
                ),
                const SizedBox(width: 4),
                Text(
                  'Filter',
                  style: whiteTextStyle.copyWith(
                    fontWeight: medium,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
