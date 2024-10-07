// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:lawan/features/presentation/admin/admin_main_ui.dart';
import 'package:lawan/features/presentation/player/player_add_session.dart';
import 'package:lawan/features/presentation/player/player_main_logic.dart';
import 'package:lawan/utility/shared/widgets/circle_button_transparent_widget.dart';
import 'package:lawan/utility/shared/widgets/custom_button.dart';
import 'package:lawan/utility/shared/widgets/field_session_widget.dart';
import 'package:lawan/utility/shared/widgets/gradient_button.dart';
import 'package:lawan/utility/shared/widgets/text_border.dart';

import '../../../utility/shared/constants/constants_ui.dart';
import '../../../utility/shared/widgets/bottom_navbar_item.dart';
import '../../../utility/shared/widgets/custom_appbar.dart';
import '../../../utility/shared/widgets/custom_bottom_navbar.dart';
import '../../../utility/shared/widgets/filter_button.dart';
import '../../../utility/shared/widgets/tab_bar_widget.dart';
import '../../../utility/util/helper.dart';
import '../../domain/arena/arena_model.dart';

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
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilterButton(backgroundColor: kGreyColor, paddingVertical: 12),
              SizedBox(width: defaultMargin),
              SizedBox(
                width: 170,
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
                    ],
                  ),
                ),
              ),
            ],
          ),
          CustomBottomNavbar(
            navbarItemWidget: Obx(
              () => Row(
                children: [
                  BottomNavbarItem(
                    title: 'Session',
                    isActive: state.selectedNavbarIndex.value == 0,
                    icon: 'assets/icons/session.svg',
                    onTap: () => state.selectedNavbarIndex.value = 0,
                  ),
                  const SizedBox(width: 4),
                  BottomNavbarItem(
                    title: 'Arena',
                    isActive: state.selectedNavbarIndex.value == 1,
                    icon: 'assets/icons/arena.svg',
                    onTap: () => state.selectedNavbarIndex.value = 1,
                  ),
                  const SizedBox(width: 4),
                  BottomNavbarItem(
                    title: 'Sales',
                    isActive: state.selectedNavbarIndex.value == 2,
                    icon: 'assets/icons/sales.svg',
                    onTap: () => state.selectedNavbarIndex.value = 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    Widget friendCard(String name) {
      return Container(
        width: 240,
        margin: const EdgeInsets.only(right: 8),
        padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          border: Border.all(width: 1, color: kGreyColor),
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/icons/image_person.png',
              width: 32,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: blackTextStyle.copyWith(
                        fontSize: 12, fontWeight: medium),
                  ),
                  TextBorder(
                    textTitle: "Novice",
                    backgroundColor: kWhiteColor,
                    borderColor: kGreyColor,
                  ),
                ],
              ),
            ),
            CircleButtonTransparentWidget(
              onTap: () {},
              size: 36,
              widget: Icon(
                Icons.add,
                color: kDarkgreyColor,
              ),
              borderColor: kGreyColor,
            ),
          ],
        ),
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
                SizedBox(
                  width: 170,
                  child: GradientButton(
                    onTap: () {},
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
                      ],
                    ),
                  ),
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
      // backgroundColor: kBackgroundColor,
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
                SizedBox(height: MediaQuery.paddingOf(context).top),
                CustomAppbar(
                  onTap: () => Get.offAndToNamed(AdminMainUi.namePath),
                ),
                SizedBox(height: defaultMargin),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Column(
                    children: [
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
                      Visibility(
                        visible: state.friendList.isNotEmpty,
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
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: state.friendList
                                .map((data) => friendCard(data))
                                .toList(),
                          ),
                        ),
                      ),
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
                              '0',
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
                SizedBox(
                  height: defaultMargin,
                  width: double.infinity,
                ),
                // empty content
                Expanded(
                  child: ListView.builder(
                    itemCount: 3,
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    itemBuilder: (context, index) => FieldSessionWidget(
                      arenaModel: ArenaModel(
                        location: 'Petaling Jaya, Selangor',
                        name: 'MBPJ Sports Complex',
                        courtData: [
                          CourtModel(
                            pictures: [
                              XFile('assets/images/field1.png'),
                            ],
                            pictureType: PictureType.asset,
                            courtName: '1',
                            arenaType: 'Indoor',
                            flooringType: 'Court Turf',
                            operationalHours: List.generate(
                              7,
                              (index) => OperationalHour(
                                isActive: true.obs,
                                dayName: Helper.dayName[index],
                                openTime:
                                    const TimeOfDay(hour: 9, minute: 00).obs,
                                closeTIme:
                                    const TimeOfDay(hour: 18, minute: 00).obs,
                                chooseTime: true.obs,
                              ),
                            ),
                            rateArena: [
                              RateModel(
                                  name: 'Weekend Rate',
                                  price: 10.obs,
                                  hour: 1.0.obs),
                              RateModel(
                                  name: 'Weekdays Rate',
                                  price: 10.obs,
                                  hour: 1.0.obs),
                            ],
                          ),
                          CourtModel(
                            pictures: [
                              XFile('assets/images/field2.png'),
                            ],
                            pictureType: PictureType.asset,
                            courtName: '2',
                            arenaType: 'Outdoor',
                            flooringType: 'Grass',
                            operationalHours: List.generate(
                              7,
                              (index) => OperationalHour(
                                isActive: true.obs,
                                dayName: Helper.dayName[index],
                                openTime:
                                    const TimeOfDay(hour: 9, minute: 00).obs,
                                closeTIme:
                                    const TimeOfDay(hour: 18, minute: 00).obs,
                                chooseTime: true.obs,
                              ),
                            ),
                            rateArena: [
                              RateModel(
                                  name: 'Weekend Rate',
                                  price: 10.obs,
                                  hour: 1.0.obs),
                              RateModel(
                                  name: 'Weekdays Rate',
                                  price: 10.obs,
                                  hour: 1.0.obs),
                            ],
                          ),
                        ],
                      ),
                      isSelected: false,
                      selectedCourt: 0,
                    ),
                  ),
                ),
              ],
            ),
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
