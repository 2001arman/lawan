// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/profile/find-friend/find_friend_logic.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_widget.dart';
import 'package:lawan/utility/shared/widgets/buttons/custom_button.dart';
import 'package:lawan/utility/shared/widgets/custom_text_form_fields.dart';

import '../../../../utility/shared/widgets/navigations/custom_appbar.dart';
import '../../../../utility/shared/widgets/navigations/tab_bar_widget.dart';
import '../../../../utility/shared/widgets/text/text_border.dart';
import '../../../../utility/shared/widgets/text/text_pill_widget.dart';

class FindFriendUi extends StatelessWidget {
  static const String namePath = '/find_friend_page';
  final logic = Get.find<FindFriendLogic>();
  final state = Get.find<FindFriendLogic>().state;
  FindFriendUi({super.key});

  @override
  Widget build(BuildContext context) {
    Widget emptySearch() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/user_group.svg',
            width: 60,
            height: 60,
            color: kMidgreyColor,
          ),
          SizedBox(height: defaultMargin),
          Text(
            'Discover People to Play With',
            style: blackTextStyle.copyWith(
                fontSize: 16, fontWeight: medium, height: 24 / 18),
          ),
          const SizedBox(height: 8),
          Text(
            'Explore and make new connections',
            style: darkGreyTextStyle.copyWith(
              fontSize: 12,
              height: 18 / 12,
            ),
          ),
          SizedBox(height: defaultMargin),
          Text(
            'or',
            style: darkGreyTextStyle.copyWith(
              fontSize: 12,
              height: 18 / 12,
            ),
          ),
          SizedBox(height: defaultMargin),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                isBlack: true,
                paddingVertical: 11.5,
                paddingHorizontal: defaultMargin,
                onTap: () {},
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/qrcode.svg',
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Scan QR',
                      style: whiteTextStyle.copyWith(fontWeight: medium),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    }

    Widget emptyFacebook({
      required bool isFacebook,
    }) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            isFacebook
                ? 'assets/icons/facebook-grey.svg'
                : 'assets/icons/agenda.svg',
            width: 60,
            height: 60,
          ),
          SizedBox(height: defaultMargin),
          Text(
            isFacebook ? 'Find via Facebook' : 'Find via Phone Contacts',
            style: blackTextStyle.copyWith(
                fontSize: 16, fontWeight: medium, height: 24 / 18),
          ),
          const SizedBox(height: 8),
          Text(
            'Instantly find friends who play and\ninvite them to join your team.',
            style: darkGreyTextStyle.copyWith(
              fontSize: 12,
              height: 18 / 12,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: defaultMargin),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                paddingHorizontal: 16,
                paddingVertical: 11.5,
                isBlack: true,
                onTap: () {},
                title: 'Connect',
              ),
            ],
          ),
        ],
      );
    }

    Widget emptySection() {
      switch (state.tabActive.value) {
        case 'Facebook':
          return emptyFacebook(isFacebook: true);
        case 'Contact':
          return emptyFacebook(isFacebook: false);
        default:
          return emptySearch();
      }
    }

    Widget friendItem({required RxBool isSelected}) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: kWhiteColor,
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/avatars/avatar1.png',
              width: 48,
              height: 48,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sarah Yahya',
                    style: blackTextStyle.copyWith(
                        fontSize: 12, fontWeight: medium),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      TextPillWidget(
                        verticalPadding: 2,
                        backgroundColor: kBackgroundColor,
                        prefix: Padding(
                          padding: const EdgeInsets.only(right: 3),
                          child: SvgPicture.asset('assets/icons/user.svg'),
                        ),
                        title: 'GK',
                        titleColor: kBlackColor,
                      ),
                    ],
                  )
                ],
              ),
            ),
            TextBorder(
              textTitle: 'Novice',
              backgroundColor: kWhiteColor,
              fontSize: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: defaultMargin),
              child: CircleButtonWidget(
                onTap: isSelected.toggle,
                size: 48,
                borderColor: isSelected.value ? Colors.transparent : kGreyColor,
                isActive: isSelected.value,
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/add_user.svg',
                      color: isSelected.value ? kWhiteColor : kDarkgreyColor,
                      width: 16,
                      height: 16,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 4),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          right: defaultMargin,
          left: defaultMargin,
        ),
        child: Column(
          children: [
            CustomAppbar(
              title: 'Find Friends',
              iconColor: kDarkgreyColor,
              borderColor: kGreyColor,
              textColor: kBlackColor,
              prefixIcon: 'assets/icons/user-plus-bold.svg',
            ),
            SizedBox(height: defaultMargin),
            TabbarWidget(
              tabBarTitle: state.tabBarTitle,
              tabActive: state.tabActive,
              onTap: (title) {
                state.tabActive.value = title;
                logic.alignmentTabbar(title);
              },
              alignment: state.activeAlignment,
              activeColor: kWhiteColor,
              textActiveColor: kBlackColor,
              textInActiveColor: kDarkgreyColor,
            ),
            const SizedBox(height: 24),
            CustomTextFormField(
              hintText: 'Search or add name/email',
              controller: state.searchController,
              showClear: true,
              onClear: () => state.showFriend.value = false,
              onChanged: (val) {
                val != ''
                    ? state.showFriend.value = true
                    : state.showFriend.value = false;
              },
              prefix: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/search.svg',
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
            ),
            Obx(
              () => Expanded(
                child: Visibility(
                  visible: state.showFriend.value,
                  replacement: emptySection(),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: state.listFriends
                        .map(
                          (data) => friendItem(isSelected: data),
                        )
                        .toList(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
