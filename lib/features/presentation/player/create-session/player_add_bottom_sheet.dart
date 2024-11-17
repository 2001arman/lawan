// ignore_for_file: deprecated_member_use

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_widget.dart';
import 'package:lawan/utility/shared/widgets/buttons/custom_button.dart';
import 'package:lawan/utility/shared/widgets/container/select_friend_item.dart';
import 'package:lawan/utility/shared/widgets/custom_text_form_fields.dart';
import 'package:lawan/utility/shared/widgets/text/text_border.dart';
import 'package:lawan/utility/shared/widgets/text/text_pill_widget.dart';
import 'package:lawan/utility/util/helper.dart';
import 'package:lawan/utility/util/helper_data.dart';

import '../../../../utility/shared/constants/constants_ui.dart';
import '../../../domain/session/avatar_model.dart';

class PlayerAddBottomSheet {
  TextEditingController searchController = TextEditingController();

  Widget friendWidget({
    required AvatarModel data,
    required VoidCallback onTapAdd,
    required VoidCallback onTapRemove,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: kGreyColor, width: 1),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(data.asset, width: 48),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 6),
                TextBorder(
                  textTitle: 'Novice',
                  backgroundColor: kWhiteColor,
                  fontSize: 10,
                  paddingVertical: 2,
                  paddingHorizontal: 8,
                )
              ],
            ),
          ),
          Row(
            children: [
              Text(
                'Prefer as',
                style: darkGreyTextStyle.copyWith(fontSize: 10),
              ),
              const SizedBox(width: 8),
              TextPillWidget(
                verticalPadding: 2,
                backgroundColor: kWhiteColor,
                prefix: Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: Icon(
                    Icons.person_2_outlined,
                    size: 18,
                    color: kMidgreyColor,
                  ),
                ),
                title: data.position,
                titleColor: kBlackColor,
              ),
            ],
          ),
          const SizedBox(width: 12),
          CircleButtonTransparentWidget(
            // onTap: () {
            //   Helper.showToast(
            //       isSuccess: true,
            //       message: 'User added for invitation successfully');
            //   state.selectedFriends.add(data);
            //   state.listFriends.remove(data);
            // },
            onTap: onTapAdd,
            widget: SvgPicture.asset(
              'assets/icons/plus.svg',
              color: kDarkgreyColor,
            ),
            borderColor: kGreyColor,
            size: 40,
          ),
        ],
      ),
    );
  }

  void addPlayerBottomSheet(
      {required VoidCallback onBack,
      required Function(List<AvatarModel> avatars) onSave}) {
    var showPlayer = false.obs;
    var listFriends = <AvatarModel>[].obs;
    var listFriendsRecent = <AvatarModel>[].obs;
    var selectedFriends = <AvatarModel>[].obs;
    listFriends.addAll(HelperData.listFriends);
    listFriendsRecent.addAll(HelperData.listFriends);

    Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          height: Get.height * 0.865,
          width: Get.width,
        ).blurred(
          blur: 7,
          blurColor: Colors.white,
          colorOpacity: 0,
          borderRadius: BorderRadius.circular(32),
          overlay: Container(
            padding: EdgeInsets.symmetric(vertical: defaultMargin),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // title and close button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/user-plus-arena.svg',
                        height: 20,
                        width: 20,
                        color: kDarkgreyColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Invite Friend(s)',
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: medium),
                      ),
                      const Spacer(),
                      CircleButtonTransparentWidget(
                        onTap: Get.back,
                        widget: SvgPicture.asset(
                          'assets/icons/x.svg',
                          color: kDarkgreyColor,
                        ),
                        borderColor: kGreyColor,
                        size: 40,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: defaultMargin),

                // text input search
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: CustomTextFormField(
                    hintText: 'Search or add name/email',
                    controller: searchController,
                    onChanged: (value) {
                      value != ''
                          ? showPlayer.value = true
                          : showPlayer.value = false;
                    },
                    prefix: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SvgPicture.asset(
                        'assets/icons/search.svg',
                        color: kDarkgreyColor,
                      ),
                    ),
                    showClear: true,
                    onClear: () => showPlayer.value = false,
                  ),
                ),

                // info container
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(defaultMargin),
                  margin: EdgeInsets.only(
                      bottom: 10, right: defaultMargin, left: defaultMargin),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: kGreyColor, width: 1),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: kWhiteColor,
                        weight: 1,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Complete your booking to send an invite to the session and start playing together!',
                          style: darkGreyTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Invitation will expire in',
                      style: blackTextStyle.copyWith(fontSize: 12),
                      children: [
                        TextSpan(
                          text: ' 2 days 2 hours 6 mins 3 sec ',
                          style: blackTextStyle.copyWith(fontWeight: bold),
                        ),
                      ],
                    ),
                  ),
                ),

                // friends
                SizedBox(height: defaultMargin),
                Expanded(
                  child: Obx(
                    () => listFriends.isNotEmpty && showPlayer.value
                        ? Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: SingleChildScrollView(
                              child: Column(
                                children: listFriends
                                    .map(
                                      (data) => friendWidget(
                                        data: data,
                                        onTapAdd: () {
                                          Helper.showToast(
                                              isSuccess: true,
                                              message:
                                                  'User added for invitation successfully');
                                          selectedFriends.add(data);
                                          listFriends.remove(data);
                                        },
                                        onTapRemove: () {},
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          )
                        : SizedBox(
                            width: Get.width,
                            height: Get.height,
                            child: Center(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/users_group.svg',
                                      color: kWhiteColor,
                                      width: 60,
                                      height: 60,
                                    ),
                                    Text(
                                      'Search Players',
                                      style: blackTextStyle.copyWith(
                                          fontSize: 16, fontWeight: medium),
                                    ),
                                    Text(
                                      'Search for player to team up and play together',
                                      style: darkGreyTextStyle.copyWith(
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ),
                ),

                // recent people
                Obx(
                  () => listFriendsRecent.isNotEmpty
                      ? Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          child: Column(
                            children: [
                              SizedBox(height: defaultMargin),
                              Text(
                                'Recent people',
                                style: darkGreyTextStyle.copyWith(fontSize: 12),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        )
                      : const SizedBox(),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(
                    () => Row(
                      children: [
                        SizedBox(width: defaultMargin),
                        ...listFriendsRecent.map(
                          (data) => SelectFriendItem(
                            name: data.name,
                            asset: data.asset,
                            suffixWidget: data.isSelected.value
                                ? CircleButtonWidget(
                                    onTap: () {
                                      Helper.showToast(
                                          isSuccess: true,
                                          message:
                                              'User removed from invitation successfully');
                                      selectedFriends.remove(data);
                                      data.isSelected.value = false;
                                    },
                                    isActive: true,
                                    widget: Icon(
                                      Icons.done,
                                      size: 20,
                                      color: kWhiteColor,
                                    ),
                                    size: 36,
                                  )
                                : CircleButtonTransparentWidget(
                                    onTap: () {
                                      Helper.showToast(
                                          isSuccess: true,
                                          message:
                                              'User added for invitation successfully');
                                      selectedFriends.add(data);
                                      data.isSelected.value = true;
                                    },
                                    size: 36,
                                    widget: SvgPicture.asset(
                                      'assets/icons/plus.svg',
                                      color: kDarkgreyColor,
                                    ),
                                    borderColor: kGreyColor,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // button
                SizedBox(height: defaultMargin),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Row(
                    children: [
                      CircleButtonTransparentWidget(
                        onTap: onBack,
                        widget: SvgPicture.asset(
                          'assets/icons/back.svg',
                          color: kDarkgreyColor,
                        ),
                      ),
                      SizedBox(width: defaultMargin),
                      Expanded(
                        child: CustomButton(
                          isBlack: true,
                          onTap: () {
                            Helper.showToast(
                                isSuccess: true,
                                message: 'Users added to invitation successfully');
                            onBack();
                            onSave(selectedFriends);
                          },
                          widget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Add',
                                style:
                                    whiteTextStyle.copyWith(fontWeight: medium),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: kWhiteColor,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: defaultMargin),
                      Obx(
                        () => Row(
                          children: [
                            ...selectedFriends.take(3).map(
                                  (friend) => Align(
                                    widthFactor: .55,
                                    child: SizedBox(
                                      width: 48,
                                      height: 48,
                                      child: CircleAvatar(
                                        backgroundColor: kGreyColor,
                                        radius: 48,
                                        child: CircleAvatar(
                                          radius: 40,
                                          backgroundImage:
                                              AssetImage(friend.asset),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            if (selectedFriends.length > 3)
                              Align(
                                widthFactor: .55,
                                child: SizedBox(
                                  width: 48,
                                  height: 48,
                                  child: CircleAvatar(
                                    backgroundColor: kGreyColor,
                                    radius: 48,
                                    child: CircleAvatar(
                                      radius: 40,
                                      backgroundColor: Colors.black,
                                      child: Text(
                                        '+${selectedFriends.length - 3}',
                                        style: whiteTextStyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: medium,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      isScrollControlled: true,
      enableDrag: true,
    );
  }
}
