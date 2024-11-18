import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../constants/constants_ui.dart';

class CustomBottomSheet {
  static void showContainerSheet({
    required Widget child,
    required double height,
    Color? color,
  }) {
    Get.bottomSheet(
      ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        child: Container(
          width: double.infinity,
          height: height,
          color: color,
        ).blurred(
          blur: 20,
          overlay: Container(
            width: double.infinity,
            height: height,
            padding: EdgeInsets.fromLTRB(
              defaultMargin,
              12,
              defaultMargin,
              MediaQuery.of(Get.context!).padding.bottom,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kBlackColor,
                  ),
                ),
                const SizedBox(height: 12),
                child,
              ],
            ),
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }
}
