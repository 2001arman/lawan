import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/utility/shared/constants/global_variable.dart';
import 'package:lawan/utility/util/dialogs/custom_dialog_sport.dart';

import '../../constants/constants_ui.dart';

class CustomAppbarProfile extends StatelessWidget {
  final bool backEnable;
  final VoidCallback onTap;
  const CustomAppbarProfile({
    super.key,
    this.backEnable = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final globalVariable = Get.find<GlobalVariable>();
    return Container(
      height: 58,
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: CustomDialogSport.showDialogSport,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              margin: const EdgeInsets.only(left: 16, top: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: kWhiteColor,
              ),
              child: Obx(
                () => Row(
                  children: [
                    Image.asset(
                      globalVariable.selectedSport.value!.icon,
                      width: 32,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      globalVariable.selectedSport.value!.name,
                      style: blackTextStyle.copyWith(fontWeight: medium),
                    ),
                    const SizedBox(width: 4),
                    SvgPicture.asset('assets/icons/chevron-down.svg'),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              margin: const EdgeInsets.only(right: 16, top: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: kWhiteColor,
              ),
              child: Row(
                children: [
                  Image.asset('assets/icons/image_person.png',
                      width: 32, fit: BoxFit.cover),
                  const SizedBox(width: 4),
                  SvgPicture.asset('assets/icons/chevron-down.svg'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
