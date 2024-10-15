import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/admin/pages/arena/admin_empty_arena.dart';
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
  AdminArenaUi({super.key});

  @override
  Widget build(BuildContext context) {
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
              children: state.selectedCourt.value.operationalHours
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
            children: state.selectedCourt.value.rateArena
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
                                    data.hour.toStringAsPrecision(1),
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
          Visibility(
            visible: state.selectedCourt.value.pictures.isNotEmpty,
            replacement: AddPictureButtonWidget(
              onTap: logic.updateAddimage,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: defaultMargin,
                bottom: 12,
                right: 8,
              ),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 126,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  enableInfiniteScroll: false,
                ),
                items: state.selectedCourt.value.pictures
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
                        pictureType: state.selectedCourt.value.pictureType,
                        changeImage: () =>
                            logic.updateChangeImage(index: data.key),
                        deleteImage: () =>
                            logic.updateDeleteImage(index: data.key),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ),
          CustomTextFormField(
            hintText: '',
            isReadOnly: true,
            controller: TextEditingController(text: 'Petaling Jaya, Selangor'),
            prefix: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
              child: SvgPicture.asset('assets/icons/target.svg'),
            ),
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
            style: darkGreyTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          const SizedBox(height: 4),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: state.arenaType
                  .map(
                    (data) => SelectedContainerWidget(
                      title: data,
                      isSelected: state.selectedCourt.value.arenaType == data,
                      onTap: () => logic.updateArenaType(arenaType: data),
                    ),
                  )
                  .toList(),
            ),
          ),
          SizedBox(height: defaultMargin),
          Text(
            'Flooring',
            style: darkGreyTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          const SizedBox(height: 4),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: state.flooringType
                  .map(
                    (data) => SelectedContainerWidget(
                      title: data,
                      isSelected:
                          data == state.selectedCourt.value.flooringType,
                      onTap: () => logic.updateFlooringType(flooringType: data),
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
                        state.selectedArena.value.name,
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
                    children: state.selectedArena.value.courtData
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
                            onTap: () {
                              state.selectedListCourt.value = court.key;
                              state.selectedCourt.value = court.value;
                            },
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
          Obx(
            () => state.tabActive.value != 'Details'
                ? SizedBox(height: defaultMargin)
                : const SizedBox(),
          ),
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
      () => logic.arenaDataSource.listArena.isNotEmpty
          ? detailArenaSection()
          : AdminEmptyArena(),
    );
  }
}
