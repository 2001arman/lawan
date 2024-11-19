import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
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

  void _addEmojiToComment(String emoji) {
    // Append the emoji to the current text in the commentController
    state.commentController.text += emoji;
    // Move the cursor to the end of the text
    state.commentController.selection = TextSelection.fromPosition(
      TextPosition(offset: state.commentController.text.length),
    );
  }

  Widget emojiItem(String emoji) {
    return GestureDetector(
      onTap: () => _addEmojiToComment(emoji),
      child: Text(emoji, style: const TextStyle(fontSize: 24)),
    );
  }

  Widget commentItem() {
    RxBool isFavorite = false.obs;
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
                    Obx(
                      () => GestureDetector(
                        onTap: isFavorite.toggle,
                        child: SvgPicture.asset(
                          isFavorite.value
                              ? 'assets/icons/heart.svg'
                              : 'assets/icons/heart-outline.svg',
                          width: 20,
                          height: 20,
                        ),
                      ),
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

  void showComment() async {
    var showEmoji = false.obs;
    await CustomBottomSheet.showContainerSheet(
      horizontalPadding: 0,
      color: kModalColor.withOpacity(0.4),
      height: Get.height * 0.7,
      child: Expanded(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(Get.context!).unfocus();
            showEmoji.value = false;
          },
          child: Column(
            children: [
              Text(
                '3 Comments',
                style:
                    blackTextStyle.copyWith(fontSize: 12, fontWeight: medium),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  children: [
                    commentItem(),
                    commentItem(),
                    commentItem(),
                    commentItem(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    emojiItem('👍'),
                    emojiItem('❤️'),
                    emojiItem('😂'),
                    emojiItem('😮'),
                    emojiItem('🎉'),
                    emojiItem('🙌'),
                    emojiItem('👏'),
                  ],
                ),
              ),
              SizedBox(height: defaultMargin),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: CustomTextFormField(
                  hintText: 'Add comment',
                  controller: state.commentController,
                  showSuffix: true,
                  margin: 0,
                  suffix: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () => _addEmojiToComment('@'),
                            child: SvgPicture.asset(
                              'assets/icons/@.svg',
                              width: 16,
                              height: 16,
                            ),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              showEmoji.toggle();
                              if (showEmoji.value) {
                                FocusManager.instance.primaryFocus?.unfocus();
                              }
                            },
                            child: SvgPicture.asset(
                              'assets/icons/smile.svg',
                              width: 16,
                              height: 16,
                            ),
                          ),
                          const SizedBox(width: 16),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              if (showEmoji.value) const SizedBox(height: 8),
              Obx(
                () => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height: showEmoji.value
                      ? 200
                      : 0, // Adjust height based on your design
                  child: SingleChildScrollView(
                    child: Visibility(
                      visible: showEmoji.value,
                      child: EmojiPicker(
                        textEditingController: state.commentController,
                        onEmojiSelected: (category, emoji) {
                          // state.controller.text = state.controller.text + emoji.emoji;
                        },
                        config: const Config(
                          bottomActionBarConfig: BottomActionBarConfig(
                            enabled: false,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Platform.isIOS ? 0 : defaultMargin),
            ],
          ),
        ),
      ),
    );
    state.commentController.text = '';
  }
}
