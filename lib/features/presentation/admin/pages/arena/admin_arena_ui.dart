import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/admin/pages/arena/admin_empty_arena.dart';
import 'package:lawan/features/presentation/admin/pages/arena/controller/admin_arena_logic.dart';
import 'package:lawan/utility/util/custom_dialog_maps.dart';

import '../../../../../utility/shared/constants/arena_type.dart';
import '../../../../../utility/shared/constants/constants_ui.dart';
import '../../../../../utility/shared/widgets/add_picture_button_widget.dart';
import '../../../../../utility/shared/widgets/buttons/circle_button_widget.dart';
import '../../../../../utility/shared/widgets/buttons/gradient_button.dart';
import '../../../../../utility/shared/widgets/container/selectable_text_field.dart';
import '../../../../../utility/shared/widgets/custom_image_widget.dart';
import '../../../../../utility/shared/widgets/custom_text_form_fields.dart';
import '../../../../../utility/shared/widgets/navigations/tab_bar_widget.dart';
import '../../../../../utility/shared/widgets/selected_container_widget.dart';
import '../../../../../utility/shared/widgets/wheel_picker/choose_time_widget.dart';
import '../../../../../utility/util/dialog_wheel_picker.dart';

class AdminArenaUi extends StatelessWidget {
  final logic = Get.find<AdminArenaLogic>();
  final state = Get.find<AdminArenaLogic>().state;
  AdminArenaUi({super.key});

  @override
  Widget build(BuildContext context) {
    Widget arenaHourSection() {
      return Obx(
        () => Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Standard Hours',
                style:
                    blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
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
                            child: ChooseTimeWidget(
                              openTime: data.openTime,
                              closeTime: data.closeTIme,
                              onSave: (startTime, endTime) {
                                Get.back();
                                data.openTime.value = TimeOfDay(
                                  hour: startTime,
                                  minute: 0,
                                );
                                data.closeTIme.value = TimeOfDay(
                                  hour: endTime,
                                  minute: 0,
                                );
                              },
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
        ),
      );
    }

    Widget arenaRateSection() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
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
                            SelectableTextField(
                              suffix: Text(
                                'RM',
                                style: darkGreyTextStyle,
                              ),
                              data: Text(
                                '${data.price}',
                                style:
                                    blackTextStyle.copyWith(fontWeight: medium),
                              ),
                              onTap: () =>
                                  DialogWheelPicker.showChoosePriceDialog(
                                selectedHour: data.hour.value,
                                selectedPrice: data.price.value,
                                onSave: (price, hour) {
                                  Get.back();
                                  data.hour.value = hour;
                                  data.price.value = price;
                                  data.finalPrice.value =
                                      (price + (price * 0.2).toInt());
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            SelectableTextField(
                              suffix: Text(
                                data.hour.value != 0.5
                                    ? data.hour.toStringAsFixed(0)
                                    : '${data.hour.value}',
                                style:
                                    blackTextStyle.copyWith(fontWeight: medium),
                              ),
                              data: Text(
                                'Hour',
                                style: darkGreyTextStyle,
                              ),
                              onTap: () =>
                                  DialogWheelPicker.showChoosePriceDialog(
                                selectedHour: data.hour.value,
                                selectedPrice: data.price.value,
                                onSave: (price, hour) {
                                  Get.back();
                                  data.hour.value = hour;
                                  data.price.value = price;
                                  data.finalPrice.value =
                                      (price + (price * 0.2).toInt());
                                },
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
        ),
      );
    }

    Widget arenaDetailSection() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: defaultMargin),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Visibility(
              visible: state.selectedCourt.value.pictures.isNotEmpty,
              replacement: AddPictureButtonWidget(
                onTap: logic.updateAddimage,
              ),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 130,
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
          const SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: CustomTextFormField(
              hintText: '',
              isReadOnly: true,
              controller:
                  TextEditingController(text: 'Petaling Jaya, Selangor'),
              showSuffix: true,
              onTap: () => CustomDialogMaps.chooseDialogLocation(
                onSelected: (data) {},
              ),
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
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Text(
              'Arena Type',
              style: darkGreyTextStyle.copyWith(fontSize: 16),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: state.arenaType
                    .map(
                      (data) => SelectedContainerWidget(
                        title: data,
                        isSelected: state.selectedCourt.value.arenaType == data,
                        onTap: () => logic.updateArenaType(arenaType: data),
                        isTransparent: true,
                        borderColor: kGreyColor,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          SizedBox(height: defaultMargin),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Text(
              'Flooring',
              style: darkGreyTextStyle.copyWith(fontSize: 16),
            ),
          ),
          const SizedBox(height: 4),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              SizedBox(width: defaultMargin),
              ...state.flooringType.map(
                (data) => SelectedContainerWidget(
                  title: data,
                  isSelected: data == state.selectedCourt.value.flooringType,
                  onTap: () => logic.updateFlooringType(flooringType: data),
                  isTransparent: true,
                  borderColor: kGreyColor,
                ),
              ),
            ]),
          ),
        ],
      );
    }

    Widget detailArenaSection() {
      return ListView(
        padding: EdgeInsets.only(
          bottom: defaultMargin,
          top: defaultMargin / 2,
        ),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Text(
              'Arena',
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => logic.showEditAddDialog(
                      createFunction: logic.createNewArena,
                      arenaType: ArenaType.arena,
                    ),
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
          ),
          SizedBox(height: defaultMargin),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Text(
              'Court',
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => logic.showEditAddDialog(
                      createFunction: logic.createNewCourt,
                      arenaType: ArenaType.court,
                    ),
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
                              dynamicWidth: true,
                              widget: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Center(
                                  child: Text(
                                    court.value.courtName,
                                    style: whiteTextStyle.copyWith(
                                      color: court.key ==
                                              state.selectedListCourt.value
                                          ? kWhiteColor
                                          : kDarkgreyColor,
                                    ),
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
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: TabbarWidget(
              tabBarTitle: state.tabBarTitle,
              tabActive: state.tabActive,
              onTap: (title) {
                state.tabActive.value = title;
                logic.alignmentTabbar(title);
              },
              alignment: state.activeAlignment,
            ),
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
