import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/admin/admin_main_state.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import 'package:lawan/utility/shared/widgets/custom_text_form_fields.dart';

import '../shared/constants/constants_ui.dart';
import '../shared/widgets/buttons/custom_button.dart';

class CustomDialogSuccess {
  static void successCreateArena() {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: Get.width,
          height: 288,
        ).blurred(
          blur: 7,
          blurColor: Colors.white,
          colorOpacity: 0,
          borderRadius: BorderRadius.circular(32),
          overlay: Container(
            width: Get.width,
            height: 288,
            padding: EdgeInsets.only(
              top: 24,
              left: defaultMargin,
              right: defaultMargin,
              bottom: defaultMargin,
            ),
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Arena Added Successfully!',
                  style:
                      blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                ),
                const SizedBox(height: 8),
                Image.asset(
                  'assets/icons/field_gradient.png',
                  width: 60,
                  height: 60,
                ),
                const SizedBox(height: 8),
                Text(
                  'You can now start earning from this arena',
                  style: darkGreyTextStyle.copyWith(fontSize: 12),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    CustomButton(
                      title: 'Add Another Court',
                      isBlack: false,
                      onTap: Get.back,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    CustomButton(title: 'Done', isBlack: true, onTap: Get.back),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void editArenaDialog({
    required ArenaType arenaType,
    required String data,
    required Function(String newData) onAction,
    required VoidCallback onDelete,
  }) {
    TextEditingController dataController = TextEditingController(text: data);
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: Get.width,
          height: 279,
        ).blurred(
          blur: 7,
          blurColor: Colors.white,
          colorOpacity: 0,
          borderRadius: BorderRadius.circular(32),
          overlay: Container(
            width: Get.width,
            height: 279,
            padding: EdgeInsets.only(
              top: 24,
              left: defaultMargin,
              right: defaultMargin,
              bottom: defaultMargin,
            ),
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/pencil.png',
                      color: kWhiteColor,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Edit ${arenaType.title} Name',
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: medium),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  hintText: '',
                  controller: dataController,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    CustomButton(
                      title: 'Cancel',
                      isBlack: false,
                      onTap: Get.back,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    CircleButtonTransparentWidget(
                      onTap: () {
                        Get.back();
                        confirmDialog(
                          actionType: ActionType.delete,
                          onAction: onDelete,
                        );
                      },
                      widget: SvgPicture.asset(
                        'assets/icons/trash.svg',
                      ),
                    ),
                    const SizedBox(width: 8),
                    CustomButton(
                      title: 'Update',
                      isBlack: true,
                      onTap: () {
                        Get.back();
                        confirmDialog(
                          actionType: ActionType.edit,
                          onAction: () => onAction(dataController.text),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void confirmDialog({
    required ActionType actionType,
    required VoidCallback onAction,
  }) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: Get.width,
          height: 228,
        ).blurred(
          blur: 7,
          blurColor: Colors.white,
          colorOpacity: 0,
          borderRadius: BorderRadius.circular(32),
          overlay: Container(
            width: Get.width,
            height: 228,
            padding: EdgeInsets.only(
              top: 24,
              left: defaultMargin,
              right: defaultMargin,
              bottom: defaultMargin,
            ),
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Confirm ${actionType.title}',
                  style:
                      blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                ),
                const SizedBox(height: 8),
                Text(
                  actionType.description,
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: reguler,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    CustomButton(
                      title: 'Cancel',
                      isBlack: false,
                      onTap: Get.back,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Visibility(
                      visible: actionType == ActionType.delete,
                      replacement: CustomButton(
                        title: 'Confirm',
                        isBlack: true,
                        onTap: onAction,
                      ),
                      child: CustomButton(
                        title: 'Delete',
                        isBlack: false,
                        borderColor: kRedColor,
                        textColor: kRedColor,
                        onTap: onAction,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
