import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/profile/profile_state.dart';
import 'package:lawan/utility/shared/constants/action_type.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/bottom_sheet/custom_bottom_sheet.dart';
import 'package:lawan/utility/shared/widgets/custom_text_form_fields.dart';
import 'package:lawan/utility/shared/widgets/text/text_border.dart';

import '../../../utility/util/dialogs/custom_dialog_success.dart';
import '../../../utility/util/helper.dart';

class ProfileLogic extends GetxController {
  ProfileState state = ProfileState();

  RxBool isAnotherProfile = false.obs;

  @override
  void onInit() {
    isAnotherProfile.value = Get.arguments ?? false;
    super.onInit();
  }

  changeState({
    required bool anotherProfile,
    required bool isFavorite,
  }) {
    isAnotherProfile.value = anotherProfile;
    state.isFavorite.value = isFavorite;
  }

  void lobbyAlignmentTabbar(String title) {
    switch (title) {
      case 'Sessions':
        state.lobbyActiveAlignment.value = Alignment.centerLeft;
        break;
      default:
        state.lobbyActiveAlignment.value = Alignment.centerRight;
        break;
    }
    return;
  }

  void showAlert(ActionType actionType) {
    CustomDialogSuccess.confirmDialog(
        actionType: actionType, onAction: Get.back);
  }

  void showToast(String message) {
    return Helper.showToast(isSuccess: true, message: message);
  }

  Widget commentItem() {
    return Padding(
      padding: EdgeInsets.only(top: defaultMargin),
      child: Row(
        children: [
          Image.asset(
            'assets/avatars/avatar1.png',
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Saiful Bukhari',
                      style: darkGreyTextStyle.copyWith(
                          fontSize: 12, fontWeight: medium),
                    ),
                    const SizedBox(width: 8),
                    const TextBorder(
                      textTitle: 'Legend',
                      paddingVertical: 0,
                      paddingHorizontal: 8,
                      fontSize: 11,
                    ),
                    const Spacer(),
                    Text(
                      '1d',
                      style: darkGreyTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Look whos here 😮...',
                  style:
                      blackTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'Reply',
                      style: darkGreyTextStyle.copyWith(
                          fontSize: 12, fontWeight: medium),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/icons/heart-outline.svg',
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '1',
                      style: darkGreyTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void showComment() {
    CustomBottomSheet.showContainerSheet(
      color: kModalColor.withOpacity(0.4),
      height: Get.height * 0.7,
      child: Expanded(
        child: Column(
          children: [
            Text(
              '3 Comments',
              style: blackTextStyle.copyWith(fontSize: 12, fontWeight: medium),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  commentItem(),
                  commentItem(),
                  commentItem(),
                  commentItem(),
                ],
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '👍',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  '❤️',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  '😂',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  '😮',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  '🎉',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  '🙌',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  '👏',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            SizedBox(height: defaultMargin),
            CustomTextFormField(
              hintText: 'Add comment',
              controller: TextEditingController(),
              showSuffix: true,
              margin: 0,
              suffix: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/@.svg',
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 8),
                      SvgPicture.asset(
                        'assets/icons/smile.svg',
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
