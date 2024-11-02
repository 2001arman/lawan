import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';

class GlassEffectDialogContainer extends StatelessWidget {
  const GlassEffectDialogContainer({
    super.key,
    required this.child,
    this.height = 0.8,
    this.padding,
  });
  final Widget child;
  final double height;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        height: Get.height * height,
        width: Get.width,
      ).blurred(
        blur: 7,
        blurColor: Colors.white,
        colorOpacity: 0,
        borderRadius: BorderRadius.circular(32),
        overlay: Container(
          width: Get.width,
          padding: padding,
          decoration: BoxDecoration(
            color: kModalColor,
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, -0.5),
                blurStyle: BlurStyle.inner,
                spreadRadius: 0,
                blurRadius: 0,
                color: kBlackColor.withOpacity(0.1),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
