import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/profile/notifications/notifications_logic.dart';
import 'package:lawan/features/presentation/profile/notifications/notifications_state.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/buttons/custom_button.dart';
import 'package:lawan/utility/shared/widgets/container/achievement_container.dart';
import 'package:lawan/utility/shared/widgets/gradient/horizontal_black_gradient.dart';

import '../../../../utility/shared/widgets/gradient/horizontal_white_gradient.dart';
import '../../../../utility/shared/widgets/navigations/custom_appbar.dart';

class NotificationsUi extends StatelessWidget {
  static const String namePath = '/notifications_page';
  final logic = Get.find<NotificationsLogic>();
  final state = Get.find<NotificationsLogic>().state;
  NotificationsUi({super.key});

  @override
  Widget build(BuildContext context) {
    Widget typeWidget(String data) {
      return GestureDetector(
        onTap: () => state.selectedType.value = data,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 11.5,
          ),
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: data == state.selectedType.value ? kBlackColor : null,
            border: data == state.selectedType.value
                ? null
                : Border.all(width: 1, color: kGreyColor),
          ),
          child: Text(
            data,
            style: whiteTextStyle.copyWith(
              color: data == state.selectedType.value
                  ? kWhiteColor
                  : kDarkgreyColor,
            ),
          ),
        ),
      );
    }

    Widget requestFriendItem({
      required NotificationType type,
    }) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/avatars/avatar1.png',
                width: 48,
                height: 48,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Maria Green',
                          style: blackTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: medium,
                          ),
                        ),
                        Text(
                          type.subTitle,
                          style: blackTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          ' 2hr',
                          style: darkGreyTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '1 mutual friend',
                      style: darkGreyTextStyle.copyWith(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  isBlack: false,
                  onTap: () {},
                  paddingVertical: 7.5,
                  title: type.decline,
                  borderColor: kGreyColor,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: CustomButton(
                  isBlack: true,
                  paddingVertical: 7.5,
                  onTap: () {},
                  title: type.accept,
                ),
              ),
            ],
          )
        ],
      );
    }

    Widget infoItem() {
      return Row(
        children: [
          Image.asset(
            'assets/avatars/avatar2.png',
            width: 48,
            height: 48,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Jo Russo',
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: medium,
                      ),
                    ),
                    Text(
                      ' assigned you as referee.',
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      ' 2hr',
                      style: darkGreyTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '9:00AM - 11:00AM | Wed,  25 Sep',
                  style: darkGreyTextStyle.copyWith(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget badgeItem() {
      return Row(
        children: [
          const AchievementContainer(
            icon: 'assets/achievement/Medal.svg',
            size: 48,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'You',
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: medium,
                      ),
                    ),
                    Text(
                      ' have received a badge.',
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      ' 9hr',
                      style: darkGreyTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'MVP Hunter',
                  style: darkGreyTextStyle.copyWith(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          )
        ],
      );
    }

    Widget giftItem() {
      return Row(
        children: [
          Container(
            width: 48,
            height: 48,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: goldGradient,
            ),
            child: SvgPicture.asset('assets/icons/coin.svg'),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'You',
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: medium,
                      ),
                    ),
                    Text(
                      ' have received some gifts.',
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      ' 9hr',
                      style: darkGreyTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '+1000 point',
                  style: darkGreyTextStyle.copyWith(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget commentItem() {
      return Row(
        children: [
          Image.asset(
            'assets/avatars/avatar3.png',
            width: 48,
            height: 48,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Xixi Lee',
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: medium,
                      ),
                    ),
                    Text(
                      ' sent you a comment.',
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      ' 2hr',
                      style: darkGreyTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Powerrrr bro!!',
                  style: darkGreyTextStyle.copyWith(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget chatItem() {
      return Row(
        children: [
          Image.asset(
            'assets/avatars/avatar4.png',
            width: 48,
            height: 48,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Row(
              children: [
                Text(
                  'Maria Green',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: medium,
                  ),
                ),
                Text(
                  ' sent you a chat.',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
                Text(
                  ' 1w',
                  style: darkGreyTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget newSectionContainer() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(defaultMargin),
        margin: EdgeInsets.only(bottom: defaultMargin),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New',
              style: darkGreyTextStyle.copyWith(fontWeight: medium),
            ),
            SizedBox(height: defaultMargin),
            requestFriendItem(type: NotificationType.requestFollow),
            SizedBox(height: defaultMargin),
            requestFriendItem(type: NotificationType.following),
            SizedBox(height: defaultMargin),
            infoItem(),
            SizedBox(height: defaultMargin),
            badgeItem(),
          ],
        ),
      );
    }

    Widget yesterdaySectionContainer() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: defaultMargin),
        padding: EdgeInsets.all(defaultMargin),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Yesterday',
              style: darkGreyTextStyle.copyWith(fontWeight: medium),
            ),
            SizedBox(height: defaultMargin),
            requestFriendItem(type: NotificationType.inviteSession),
            SizedBox(height: defaultMargin),
            giftItem(),
            SizedBox(height: defaultMargin),
            commentItem(),
          ],
        ),
      );
    }

    Widget monthSectionContainer() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: defaultMargin),
        padding: EdgeInsets.all(defaultMargin),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Last 30 days',
              style: darkGreyTextStyle.copyWith(fontWeight: medium),
            ),
            SizedBox(height: defaultMargin),
            chatItem(),
            SizedBox(height: defaultMargin),
            chatItem(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: CustomAppbar(
                    title: 'Notifications',
                    iconColor: kDarkgreyColor,
                    borderColor: kGreyColor,
                    textColor: kBlackColor,
                    prefixIcon: 'assets/icons/bell-bold.svg',
                  ),
                ),
                SizedBox(height: defaultMargin),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(
                    () => Row(
                      children: [
                        SizedBox(width: defaultMargin),
                        ...state.listType.map(
                          (data) => typeWidget(data),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      ListView(
                        padding: EdgeInsets.only(
                          top: defaultMargin,
                          bottom: 50,
                          left: defaultMargin,
                          right: defaultMargin,
                        ),
                        children: [
                          newSectionContainer(),
                          yesterdaySectionContainer(),
                          monthSectionContainer(),
                        ],
                      ),
                      const HorizontalWhiteGradient(),
                    ],
                  ),
                ),
              ],
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: HorizontalBlackGradient(),
            )
          ],
        ),
      ),
    );
  }
}
