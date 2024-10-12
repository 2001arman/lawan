import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/admin/pages/arena/controller/admin_arena_logic.dart';

import '../../../../../utility/shared/constants/arena_type.dart';
import '../../../../../utility/shared/constants/constants_ui.dart';
import '../../../../../utility/shared/widgets/add_picture_button_widget.dart';
import '../../../../../utility/shared/widgets/buttons/circle_button_widget.dart';
import '../../../../../utility/shared/widgets/buttons/gradient_button.dart';
import '../../../../../utility/shared/widgets/custom_image_widget.dart';
import '../../../../../utility/shared/widgets/custom_text_form_fields.dart';
import '../../../../../utility/shared/widgets/navigations/tab_bar_widget.dart';
import '../../../../../utility/shared/widgets/selected_container_widget.dart';
import '../../../../../utility/util/helper.dart';

class AdminArenaUi extends StatelessWidget {
  final logic = Get.find<AdminArenaLogic>();
  final state = Get.find<AdminArenaLogic>().state;
  final arenaDataSource = Get.find<AdminArenaLogic>().arenaDataSource;
  AdminArenaUi({super.key});

  @override
  Widget build(BuildContext context) {
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
              children: arenaDataSource
                  .getOperationalHour(
                      indexArena: state.selectedListArena.value,
                      indexCourt: state.selectedListCourt.value)
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
            children: arenaDataSource
                .getRateArena(
                    indexArena: state.selectedListArena.value,
                    indexCourt: state.selectedListCourt.value)
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
              height: 126,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              enableInfiniteScroll: false,
            ),
            items: arenaDataSource
                .getPicturesArena(
                    indexArena: state.selectedListArena.value,
                    indexCourt: state.selectedListCourt.value)
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
                  return CustomImageWidget(
                    path: data.value.path,
                    pictureType: arenaDataSource.getPicturesType(
                        indexArena: state.selectedListArena.value,
                        indexCourt: state.selectedListCourt.value),
                    changeImage: () {},
                    deleteImage: () {},
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
                      isSelected: arenaDataSource.getArenaType(
                            indexArena: state.selectedListArena.value,
                            indexCourt: state.selectedListCourt.value,
                          ) ==
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
                          arenaDataSource.getFlooringType(
                            indexArena: state.selectedListArena.value,
                            indexCourt: state.selectedListCourt.value,
                          ),
                      onTap: () {},
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      );
    }

    Widget detailArenaSection() {
      return ListView(
        padding: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin,
          top: defaultMargin / 2,
        ),
        children: [
          Text(
            'Arena',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GestureDetector(
                  // onTap: () => logic.editArena(arenaType: ArenaType.arena),
                  onTap: logic.showEditAddDialog,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(
                      'assets/icons/pencil.png',
                      width: 20,
                    ),
                  ),
                ),
                GradientButton(
                  onTap: logic.chooseArenaDialog,
                  widget: Row(
                    children: [
                      Text(
                        arenaDataSource
                            .getArena(index: state.selectedListArena.value)
                            .name,
                        style: whiteTextStyle.copyWith(fontWeight: medium),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: kWhiteColor,
                        size: 18,
                      )
                    ],
                  ),
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
                GestureDetector(
                  onTap: () => logic.editArena(arenaType: ArenaType.court),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(
                      'assets/icons/pencil.png',
                      width: 20,
                    ),
                  ),
                ),
                Obx(
                  () => Row(
                    children: arenaDataSource
                        .getCourt(indexArena: state.selectedListArena.value)
                        .asMap()
                        .entries
                        .map(
                          (court) => CircleButtonWidget(
                            widget: Center(
                              child: Text(
                                court.value.courtName,
                                style: whiteTextStyle.copyWith(
                                  color:
                                      court.key == state.selectedListCourt.value
                                          ? kWhiteColor
                                          : kBlackColor,
                                ),
                              ),
                            ),
                            margin: const EdgeInsets.only(right: 12),
                            onTap: () =>
                                state.selectedListCourt.value = court.key,
                            isActive:
                                court.key == state.selectedListCourt.value,
                          ),
                        )
                        .toList(),
                  ),
                ),
                CircleButtonWidget(
                  onTap: logic.createNewCourt,
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

    return Obx(
      () => Visibility(
        visible: arenaDataSource.listArena.isNotEmpty,
        replacement: emptyArena(),
        child: detailArenaSection(),
      ),
    );
  }
}
