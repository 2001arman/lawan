import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/admin/admin_main_logic.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/add_picture_button_widget.dart';
import 'package:lawan/utility/shared/widgets/custom_appbar.dart';
import 'package:lawan/utility/shared/widgets/circle_button_widget.dart';
import 'package:lawan/utility/shared/widgets/selected_container_widget.dart';
import 'package:lawan/utility/shared/widgets/tab_bar_widget.dart';
import 'package:lawan/utility/util/helper.dart';

import '../../utility/shared/widgets/custom_text_form_fields.dart';

class AdminMainUi extends StatelessWidget {
  static const namePath = '/main_page';
  final logic = Get.find<AdminMainLogic>();
  final state = Get.find<AdminMainLogic>().state;
  AdminMainUi({super.key});

  @override
  Widget build(BuildContext context) {
    Widget bottomNavbarItem({required String title, required bool isActive}) {
      return Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isActive ? kBlackColor : kWhiteColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: blackTextStyle.copyWith(
                color: isActive ? kWhiteColor : kBlackColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 15.66 / 12,
                letterSpacing: -0.24,
              ),
            )
          ],
        ),
      );
    }

    Widget customNavbar() {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kBlackColor.withOpacity(0),
              kBlackColor.withOpacity(0.3),
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                color: const Color(0xFFE5E6E5),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 2,
                    color: Colors.white,
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                children: [
                  bottomNavbarItem(title: 'Session', isActive: false),
                  const SizedBox(width: 4),
                  bottomNavbarItem(title: 'Arena', isActive: true),
                  const SizedBox(width: 4),
                  bottomNavbarItem(title: 'Sales', isActive: false),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget emptyArena() {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SizedBox(
            width: double.infinity,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'List your arena ',
                style: blackTextStyle.copyWith(
                  fontFamily: 'Lufga',
                  fontWeight: semiBold,
                  fontSize: 20,
                  height: 24 / 20,
                  letterSpacing: -0.03 * 20,
                ),
                children: [
                  TextSpan(
                    text: 'with Lawan,\nattrack and inspire Pahlawans!',
                    style: blackTextStyle.copyWith(fontWeight: reguler),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(defaultMargin),
            margin: EdgeInsets.symmetric(vertical: defaultMargin),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              border: Border.all(width: 2, color: kWhiteColor),
            ),
            child: Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Seamless experience ',
                    style: blackTextStyle.copyWith(
                      fontFamily: 'Lufga',
                      fontWeight: semiBold,
                      fontSize: 14,
                      height: 21 / 14,
                    ),
                    children: [
                      TextSpan(
                        text: 'for your customers',
                        style: blackTextStyle.copyWith(fontWeight: reguler),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Image.asset(
                  'assets/icons/scan.png',
                  width: 64,
                  height: 64,
                ),
                const SizedBox(height: 8),
                Text(
                  'in creating and sharing sessions with friends.',
                  style: blackTextStyle.copyWith(fontSize: 12),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 141,
                  padding: EdgeInsets.all(defaultMargin),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(width: 2, color: kWhiteColor),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/icons/devices.png',
                        width: 64,
                        height: 64,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Online visibility',
                        style: blackTextStyle.copyWith(fontSize: 14),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: defaultMargin),
              Expanded(
                child: Container(
                  height: 141,
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(width: 2, color: kWhiteColor),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.only(top: defaultMargin),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Earn income ',
                              style: blackTextStyle.copyWith(
                                fontFamily: 'Lufga',
                                fontWeight: semiBold,
                                fontSize: 14,
                                height: 21 / 14,
                              ),
                              children: [
                                TextSpan(
                                  text: 'by listing as many arena that you own',
                                  style: blackTextStyle.copyWith(
                                      fontWeight: reguler),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -16,
                        left: 0,
                        right: 0,
                        child: Image.asset(
                          'assets/icons/dollar.png',
                          width: double.infinity,
                          height: 64,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => logic.createNewArena(),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: defaultMargin),
              height: 252,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                gradient: mainGradient,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/icons/field.png',
                      width: 220,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          margin: const EdgeInsets.only(bottom: 8, top: 27),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: kWhiteColor),
                          child: Icon(Icons.add, color: kBlackColor),
                        ),
                        Text(
                          'Add Arena',
                          style: whiteTextStyle.copyWith(fontWeight: medium),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 100),
        ],
      );
    }

    Widget detailArenaSection() {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Arena',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Image.asset(
                    'assets/icons/pencil.png',
                    width: 20,
                  ),
                ),
                Row(
                  children: state.listArena
                      .asMap()
                      .entries
                      .map(
                        (data) => SelectedContainerWidget(
                          title: data.value.name,
                          isSelected: state.selectedListArena.value == data.key,
                          onTap: () => state.selectedListArena.value = data.key,
                        ),
                      )
                      .toList(),
                ),
                CircleButtonWidget(
                  onTap: logic.createNewArena,
                ),
              ],
            ),
          ),
          SizedBox(height: defaultMargin),
          Text(
            'Court',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Image.asset(
                    'assets/icons/pencil.png',
                    width: 20,
                  ),
                ),
                CircleButtonWidget(
                  widget: Center(
                    child: Text(
                      '1',
                      style: whiteTextStyle,
                    ),
                  ),
                  margin: const EdgeInsets.only(right: 12),
                  onTap: () {},
                ),
                CircleButtonWidget(
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
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
          Obx(() {
            switch (state.tabActive.value) {
              case 'Details':
                return arenaDetailSection();
              case 'Hour':
                return arenaHourSection();
              case 'Rate':
                return arenaRateSection();
              default:
                return arenaDetailSection();
            }
          }),
          const SizedBox(height: 100),
        ],
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: const CustomAppbar(),
      body: Stack(
        children: [
          Obx(() {
            if (state.listArena.isEmpty) {
              return emptyArena();
            } else {
              return detailArenaSection();
            }
          }),
          Align(
            alignment: Alignment.bottomCenter,
            child: customNavbar(),
          ),
        ],
      ),
    );
  }

  Widget arenaHourSection() {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Standard Hours',
            style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
          ),
          const SizedBox(height: 2),
          Text(
            'Standard hours of operation for this arena',
            style: darkGreyTextStyle.copyWith(fontSize: 12),
          ),
          const SizedBox(height: 8),
          Column(
            children: state
                .listArena[state.selectedListArena.value].operationalHours
                .map(
                  (data) => Column(
                    children: [
                      Row(
                        children: [
                          Text(data.dayName, style: darkGreyTextStyle),
                          const Spacer(),
                          Text(data.isActive.value ? 'Open' : 'Closed',
                              style: darkGreyTextStyle),
                          SizedBox(
                            height: 30,
                            width: 50,
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Switch(
                                value: data.isActive.value,
                                onChanged: (active) {
                                  data.isActive.value = active;
                                  Get.log('cek isActive ${data.isActive}');
                                },
                                activeColor: kWhiteColor,
                                activeTrackColor: kGreenColor,
                                inactiveThumbColor: kDarkgreyColor,
                                inactiveTrackColor: Colors.transparent,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (data.isActive.value) const SizedBox(height: 8),
                      Visibility(
                        visible: data.isActive.value,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(80),
                                  color: kWhiteColor,
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons/clock.png',
                                      width: 16,
                                      height: 16,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      Helper.formatTime12Hour(
                                          data.openTime.value),
                                      style: blackTextStyle.copyWith(
                                          fontWeight: medium),
                                    ),
                                    const Spacer(),
                                    Image.asset(
                                        'assets/icons/arrow_up_down.png',
                                        width: 20,
                                        height: 20),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                'to',
                                style: darkGreyTextStyle,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(80),
                                  color: kWhiteColor,
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons/clock.png',
                                      width: 16,
                                      height: 16,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      Helper.formatTime12Hour(
                                          data.closeTIme.value),
                                      style: blackTextStyle.copyWith(
                                          fontWeight: medium),
                                    ),
                                    const Spacer(),
                                    Image.asset(
                                      'assets/icons/arrow_up_down.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget arenaRateSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Court Rate ',
          style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
        ),
        const SizedBox(height: 2),
        Text(
          'Customize to fit your needs',
          style: darkGreyTextStyle.copyWith(fontSize: 12),
        ),
        const SizedBox(height: 16),
        Column(
          children: state.listArena[state.selectedListArena.value].rateArena
              .map(
                (data) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.name, style: darkGreyTextStyle),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              color: kWhiteColor,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'RM',
                                  style: blackTextStyle,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '${data.price}',
                                  style: blackTextStyle.copyWith(
                                      fontWeight: medium),
                                ),
                                const Spacer(),
                                Image.asset('assets/icons/arrow_up_down.png',
                                    width: 20, height: 20),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              color: kWhiteColor,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  '${data.hour}',
                                  style: blackTextStyle.copyWith(
                                      fontWeight: medium),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Hour',
                                  style: blackTextStyle,
                                ),
                                const Spacer(),
                                Image.asset(
                                  'assets/icons/arrow_up_down.png',
                                  width: 20,
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      margin: EdgeInsets.symmetric(vertical: defaultMargin),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        gradient: mainGradient,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Listing Price',
                            style: midGreyTextStyle.copyWith(fontSize: 12),
                          ),
                          Text(
                            'RM${data.finalPrice}',
                            style: whiteTextStyle.copyWith(
                                fontSize: 24, fontWeight: semiBold),
                          ),
                          Text(
                            '20% hosting fee by Lawan included',
                            style: greyTextStyle.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget arenaDetailSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 120,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            enableInfiniteScroll: false,
          ),
          items: state.listArena[state.selectedListArena.value].pictures
              .asMap()
              .entries
              .map((data) {
            return Builder(
              builder: (BuildContext context) {
                if (data.value.path == 'empty') {
                  return AddPictureButtonWidget(
                    onTap: logic.image,
                  );
                }
                return Container(
                  margin: EdgeInsets.only(
                    top: defaultMargin,
                    bottom: defaultMargin,
                    right: 8,
                  ),
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: FileImage(
                        File(data.value.path),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => logic.changeImage(index: data.key),
                        child: SvgPicture.asset(
                          'assets/icons/container_rotate.svg',
                          width: 36,
                          height: 36,
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () => logic.deleteImage(index: data.key),
                        child: SvgPicture.asset(
                          'assets/icons/container_trash.svg',
                          width: 36,
                          height: 36,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: defaultMargin),
        CustomTextFormField(
          hintText: '',
          isReadOnly: true,
          controller: TextEditingController(text: 'Petaling Jaya, Selangor'),
          suffix: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/location.png',
                width: 20,
                height: 20,
                fit: BoxFit.cover,
                color: kMidgreyColor,
              ),
            ],
          ),
        ),
        Text(
          'Arena Type',
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
        ),
        const SizedBox(height: 4),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: state.arenaType
                .map(
                  (data) => SelectedContainerWidget(
                    title: data,
                    isSelected: state.listArena[state.selectedListArena.value]
                            .arenaType ==
                        data,
                    onTap: () {},
                  ),
                )
                .toList(),
          ),
        ),
        SizedBox(height: defaultMargin),
        Text(
          'Flooring',
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
        ),
        const SizedBox(height: 4),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: state.flooringType
                .map(
                  (data) => SelectedContainerWidget(
                    title: data,
                    isSelected: data ==
                        state.listArena[state.selectedListArena.value]
                            .flooringType,
                    onTap: () {},
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
