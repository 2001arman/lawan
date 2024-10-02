import 'package:flutter/material.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';

class SelectedContainerWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final bool isTransparent;
  final Color? borderColor;
  final VoidCallback onTap;
  const SelectedContainerWidget({
    super.key,
    required this.title,
    required this.isSelected,
    this.isTransparent = false,
    this.borderColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            width: 1,
            color: isSelected ? Colors.transparent : borderColor ?? kWhiteColor,
          ),
          color: isSelected
              ? kBlackColor
              : isTransparent
                  ? Colors.transparent
                  : kWhiteColor,
        ),
        child: Text(
          title,
          style: whiteTextStyle.copyWith(
            color: isSelected ? kWhiteColor : kDarkgreyColor,
          ),
        ),
      ),
    );
  }
}
