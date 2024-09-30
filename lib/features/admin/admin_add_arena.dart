import 'package:blur/blur.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/admin/admin_main_logic.dart';
import 'package:lawan/features/admin/admin_main_state.dart';
import 'package:lawan/utility/shared/widgets/add_picture_button_widget.dart';
import 'package:lawan/utility/shared/widgets/custom_button.dart';
import 'package:lawan/utility/shared/widgets/custom_image_widget.dart';
import 'package:lawan/utility/shared/widgets/custom_text_form_fields.dart';
import 'package:lawan/utility/shared/widgets/selected_container_widget.dart';
import 'package:lawan/utility/util/custom_dialog.dart';

import '../../utility/shared/constants/constants_ui.dart';
import '../../utility/util/helper.dart';

class AdminAddArena {
  final AdminMainState state;
  final AdminMainLogic logic;

  AdminAddArena({required this.state, required this.logic});

  

  Widget contentSection() {
    switch (state.selectedIndex.value) {
      case 1:
        return detailSection();
      case 2:
        return hourSection();
      case 3:
        return rateSection();
      default:
        return detailSection();
    }
  }

  Widget topItemBottomSheet(
      {required int number, required String title, required bool isActive}) {
    return GestureDetector(
      onTap: () => state.selectedIndex.value = number,
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  width: 1, color: isActive ? Colors.transparent : kWhiteColor),
              color: isActive ? kGreenColor : Colors.transparent,
            ),
            child: Center(
              child: Text(
                '$number',
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: isActive ? medium : reguler,
                  color: isActive ? kWhiteColor : kDarkgreyColor,
                ),
              ),
            ),
          ),
          Text(
            title,
            style: greenTextStyle.copyWith(
              fontWeight: isActive ? medium : reguler,
              color: isActive ? kGreenColor : kDarkgreyColor,
            ),
          )
        ],
      ),
    );
  }

  void createNewArena() {
    Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          height: Get.height * 0.9,
          width: Get.width,
        ).blurred(
          blur: 7,
          blurColor: Colors.white,
          colorOpacity: 0,
          borderRadius: BorderRadius.circular(32),
          overlay: Container(
            padding: EdgeInsets.all(defaultMargin),
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
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      topItemBottomSheet(
                        number: 1,
                        title: 'Details',
                        isActive: state.selectedIndex.value == 1,
                      ),
                      Container(
                        width: 24,
                        height: 1,
                        color: kWhiteColor,
                        margin: EdgeInsets.symmetric(
                            horizontal: defaultMargin, vertical: 20),
                      ),
                      topItemBottomSheet(
                        number: 2,
                        title: 'Hour',
                        isActive: state.selectedIndex.value == 2,
                      ),
                      Container(
                        width: 24,
                        height: 1,
                        color: kWhiteColor,
                        margin: EdgeInsets.symmetric(
                            horizontal: defaultMargin, vertical: 20),
                      ),
                      topItemBottomSheet(
                        number: 3,
                        title: 'Rate',
                        isActive: state.selectedIndex.value == 3,
                      ),
                    ],
                  ),
                  contentSection(),
                  Row(
                    children: [
                      CustomButton(
                        title: 'Cancel',
                        isBlack: false,
                        onTap: () => Get.back(),
                      ),
                      const SizedBox(width: 16),
                      CustomButton(
                        title: state.selectedIndex.value == 3
                            ? 'Add Arena'
                            : 'Next',
                        isBlack: true,
                        onTap: logic.handleNextButton,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      isScrollControlled: true,
      enableDrag: true,
    ).whenComplete(() => logic.clearState());
  }

  Widget rateSection() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: defaultMargin),
            Text(
              'Configure the rate',
              style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
            ),
            const SizedBox(height: 2),
            Text(
              'Customize to fit your needs',
              style: darkGreyTextStyle.copyWith(fontSize: 12),
            ),
            const SizedBox(height: 16),
            Column(
              children: state.rateList
                  .map(
                    (data) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.name, style: darkGreyTextStyle),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () => CustomDialog.showChoosePriceDialog(
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
                                      Image.asset(
                                          'assets/icons/arrow_up_down.png',
                                          width: 20,
                                          height: 20),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => CustomDialog.showChoosePriceDialog(
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
                                        data.hour.value != 0.5
                                            ? data.hour.toStringAsFixed(0)
                                            : '${data.hour.value}',
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
                              Obx(
                                () => Text(
                                  'RM${data.finalPrice}',
                                  style: whiteTextStyle.copyWith(
                                      fontSize: 24, fontWeight: semiBold),
                                ),
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
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget detailSection() {
    return Expanded(
      child: Form(
        key: state.textFormKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: defaultMargin),
              Text(
                'Add Arena Details',
                style:
                    blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
              ),
              const SizedBox(height: 2),
              Text(
                'Add photos, name and location',
                style: darkGreyTextStyle.copyWith(fontSize: 12),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 126,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  enableInfiniteScroll: false,
                ),
                items: state.uploadedPictures.asMap().entries.map((data) {
                  return Builder(
                    builder: (BuildContext context) {
                      if (data.value.path == 'empty') {
                        return AddPictureButtonWidget(
                          onTap: logic.image,
                        );
                      }
                      return CustomImageWidget(
                        path: data.value.path,
                        changeImage: () => logic.changeImage(index: data.key),
                        deleteImage: () => logic.deleteImage(index: data.key),
                      );
                    },
                  );
                }).toList(),
              ),
              CustomTextFormField(
                hintText: 'Location',
                controller: TextEditingController(),
                isReadOnly: true,
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
              CustomTextFormField(
                hintText: 'Enter Arena Name',
                controller: state.nameController,
                validator: (data) => Helper.regularValidator(data),
              ),
              CustomTextFormField(
                hintText: 'Enter Court Name',
                controller: state.courtController,
                validator: (data) => Helper.regularValidator(data),
                suffix: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Optional',
                        style: blackTextStyle.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text('Arena Type', style: darkGreyTextStyle),
              const SizedBox(height: 4),
              Obx(
                () => Row(
                  children: state.arenaType
                      .map(
                        (data) => SelectedContainerWidget(
                          title: data,
                          isSelected: data == state.selectedArenaType.value,
                          onTap: () => state.selectedArenaType.value = data,
                          isTransparent: true,
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 12),
              Text('Flooring', style: darkGreyTextStyle),
              const SizedBox(height: 4),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(
                  () => Row(
                    children: state.flooringType
                        .map(
                          (data) => SelectedContainerWidget(
                            title: data,
                            isSelected:
                                data == state.selectedFlooringType.value,
                            isTransparent: true,
                            onTap: () =>
                                state.selectedFlooringType.value = data,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget hourSection() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: defaultMargin),
            Text(
              'Set Standard Hours',
              style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
            ),
            const SizedBox(height: 2),
            Text(
              'Standard hours of operation for this arena',
              style: darkGreyTextStyle.copyWith(fontSize: 12),
            ),
            Obx(
              () => Column(
                children: state.listOperationalHour
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
                                  child: GestureDetector(
                                    onTap: () =>
                                        CustomDialog.showChooseTimeDialog(
                                      startTime: data.openTime.value.hour,
                                      endTime: data.closeTIme.value.hour,
                                      onSave: (startTime, endTime) {
                                        Get.back();

                                        data.openTime.value = TimeOfDay(
                                            hour: startTime, minute: 0);
                                        data.closeTIme.value =
                                            TimeOfDay(hour: endTime, minute: 0);
                                      },
                                    ),
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
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Text(
                                    'to',
                                    style: darkGreyTextStyle,
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () =>
                                        CustomDialog.showChooseTimeDialog(
                                      startTime: data.openTime.value.hour,
                                      endTime: data.closeTIme.value.hour,
                                      onSave: (startTime, endTime) {
                                        Get.back();
                                        data.openTime.value = TimeOfDay(
                                            hour: startTime, minute: 0);
                                        data.closeTIme.value =
                                            TimeOfDay(hour: endTime, minute: 0);
                                      },
                                    ),
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
            ),
          ],
        ),
      ),
    );
  }
}
