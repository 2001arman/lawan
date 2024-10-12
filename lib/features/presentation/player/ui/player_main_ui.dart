// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/admin/admin_main_ui.dart';
import 'package:lawan/features/presentation/admin/pages/session/admin_session_bottom_sheet.dart';
import 'package:lawan/features/presentation/player/ui/player_add_session.dart';
import 'package:lawan/features/presentation/player/controller/player_main_logic.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import 'package:lawan/utility/shared/widgets/buttons/custom_button.dart';
import 'package:lawan/utility/shared/widgets/container/select_friend_item.dart';
import 'package:lawan/utility/shared/widgets/fields/field_session_widget.dart';
import 'package:lawan/utility/shared/widgets/buttons/gradient_button.dart';
import 'package:lawan/utility/shared/widgets/text/text_border.dart';

import '../../../../utility/shared/constants/constants_ui.dart';
import '../../../../utility/shared/widgets/bottom_navbar_item.dart';
import '../../../../utility/shared/widgets/navigations/custom_appbar.dart';
import '../../../../utility/shared/widgets/navigations/custom_bottom_navbar.dart';
import '../../../../utility/shared/widgets/buttons/filter_button.dart';
import '../../../../utility/shared/widgets/navigations/tab_bar_widget.dart';

class PlayerMainUi extends StatelessWidget {
  static const String namePath = '/player_main_page';
  final logic = Get.find<PlayerMainLogic>();
  final state = Get.find<PlayerMainLogic>().state;
  PlayerMainUi({super.key});

  @override
  Widget build(BuildContext context) {
    Widget customNavbar() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Obx(
            () => Visibility(
              visible: state.sessionList.isNotEmpty,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilterButton(
                      backgroundColor: kGreyColor, paddingVertical: 12),
                  SizedBox(width: defaultMargin),
                  SizedBox(
                    child: GradientButton(
                      onTap: () => PlayerAddSession(
                        logic: logic,
                        state: state,
                      ).createNewSession(),
                      widget: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/play.svg',
                            width: 16,
                            height: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Create a session',
                            style: whiteTextStyle.copyWith(fontWeight: medium),
                          ),
                          if (state.selectedFriends.isNotEmpty)
                            const SizedBox(width: 4),
                          Visibility(
                            visible: state.selectedFriends.isNotEmpty,
                            child: TextBorder(
                              textTitle: '+${state.selectedFriends.length}',
                              fontSize: 11,
                              paddingVertical: 2,
                              paddingHorizontal: 8,
                              textColor: const Color(0xFF44D8BE),
                              backgroundColor: kWhiteColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomBottomNavbar(
            navbarItemWidget: Obx(
              () => Row(
                children: state.listNavbarItem
                    .asMap()
                    .entries
                    .map(
                      (data) => Padding(
                        padding: EdgeInsets.only(
                          right: data.key != state.listNavbarItem.length - 1
                              ? 4
                              : 0,
                        ),
                        child: BottomNavbarItem(
                          title: data.value.name,
                          isActive: state.selectedNavbarIndex.value == data.key,
                          icon: data.value.icon,
                          onTap: () =>
                              state.selectedNavbarIndex.value = data.key,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      );
    }

    Widget emptySession() {
      return Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              color: kBlackColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/add_avatars.png',
                      width: 60,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'VS',
                      style: whiteTextStyle.copyWith(
                          fontSize: 10, fontWeight: bold),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      'assets/icons/add_avatars.png',
                      width: 60,
                    ),
                  ],
                ),
                SizedBox(height: defaultMargin),
                Text(
                  'No session available',
                  style:
                      whiteTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                ),
                Text(
                  'Create a session to start playing',
                  style: greyTextStyle.copyWith(fontSize: 12),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GradientButton(
                      onTap: () => PlayerAddSession(
                        logic: logic,
                        state: state,
                      ).createNewSession(),
                      widget: Obx(
                        () => Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/play.svg',
                              width: 16,
                              height: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Create a session',
                              style:
                                  whiteTextStyle.copyWith(fontWeight: medium),
                            ),
                            if (state.selectedFriends.isNotEmpty)
                              const SizedBox(width: 4),
                            Visibility(
                              visible: state.selectedFriends.isNotEmpty,
                              child: TextBorder(
                                textTitle: '+${state.selectedFriends.length}',
                                fontSize: 11,
                                paddingVertical: 2,
                                paddingHorizontal: 8,
                                textColor: const Color(0xFF44D8BE),
                                backgroundColor: kWhiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              gradient: blackGradient,
            ),
          ),
        ],
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          color: kBackgroundColor,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                // appbar
                SizedBox(height: MediaQuery.paddingOf(context).top),
                CustomAppbar(
                  onTap: () => Get.offAndToNamed(AdminMainUi.namePath),
                ),
                SizedBox(height: defaultMargin),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Column(
                    children: [
                      // tabbar
                      TabbarWidget(
                        tabBarTitle: state.tabBarTitle,
                        tabActive: state.tabActive,
                        onTap: (title) {
                          state.tabActive.value = title;
                          logic.alignmentTabbar(title);
                        },
                        alignment: state.activeAlignment,
                      ),
                      SizedBox(height: defaultMargin),

                      // friends list
                      Obx(
                        () => Visibility(
                          visible: state.listFriends.isNotEmpty,
                          replacement: Row(
                            children: [
                              CustomButton(
                                isBlack: false,
                                onTap: () {},
                                borderColor: kGreyColor,
                                widget: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/add_user.svg',
                                      color: kDarkgreyColor,
                                      width: 16,
                                      height: 16,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'Find Friends',
                                      style: blackTextStyle.copyWith(
                                          fontWeight: medium),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.zero,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: state.listFriends
                                    .map(
                                      (data) => SelectFriendItem(
                                        name: data.name,
                                        asset: data.asset,
                                        suffixWidget:
                                            CircleButtonTransparentWidget(
                                          onTap: () {
                                            state.selectedFriends.add(data);
                                            state.listFriends.remove(data);
                                          },
                                          size: 36,
                                          widget: Icon(
                                            Icons.add,
                                            color: kDarkgreyColor,
                                          ),
                                          borderColor: kGreyColor,
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // available session
                      SizedBox(height: defaultMargin),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: kWhiteColor,
                            ),
                            child: Text(
                              '${state.sessionList.length}',
                              style: blackTextStyle.copyWith(
                                  fontSize: 11, fontWeight: medium),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Available Session',
                            style: darkGreyTextStyle.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: defaultMargin),

                // session content
                Expanded(
                  child: Obx(
                    () => Visibility(
                      visible: state.sessionList.isNotEmpty,
                      replacement: emptySession(),
                      child: ListView(
                        padding:
                            EdgeInsets.symmetric(horizontal: defaultMargin),
                        children: [
                          ...state.sessionList.map(
                            (data) => GestureDetector(
                              onTap: () => AdminSessionBottomSheet()
                                  .successCreateSesssionSheet(
                                arenaModel: data.arena,
                                selectedCourt: data.selectedCourt,
                                session: data,
                                successCreate: false,
                                showPill: true,
                              ),
                              child: FieldSessionWidget(sessionModel: data),
                            ),
                          ),
                          const SizedBox(height: 150),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // buttons
            Align(
              alignment: Alignment.bottomCenter,
              child: customNavbar(),
            ),
          ],
        ),
      ),
    );
  }
}
