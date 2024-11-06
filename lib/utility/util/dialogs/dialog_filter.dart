// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import 'package:lawan/utility/shared/widgets/buttons/custom_button.dart';
import 'package:lawan/utility/shared/widgets/custom_text_form_fields.dart';
import 'package:lawan/utility/shared/widgets/range_slider_widget.dart';
import 'package:lawan/utility/util/dialogs/custom_dialog.dart';
import 'package:lawan/utility/util/helper.dart';

import '../../shared/constants/constants_ui.dart';
import '../../shared/widgets/selected_container_widget.dart';

class DialogFilter {
  static Widget selectableItem({
    String title = '',
    required List<String> listData,
    required RxString selectedData,
    String? iconAsset,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 16),
      child: Obx(
        () => Row(
          children: [
            SizedBox(
              width: iconAsset != null ? 40 : 80,
              child: iconAsset != null
                  ? SvgPicture.asset(
                      iconAsset,
                      width: 24,
                      height: 24,
                      color: kDarkgreyColor,
                    )
                  : Text(
                      title,
                      style: darkGreyTextStyle,
                    ),
            ),
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const SizedBox(width: 20),
                        ...listData.map(
                          (data) => SelectedContainerWidget(
                            title: data,
                            isSelected: data == selectedData.value,
                            onTap: () => selectedData.value = data,
                            isTransparent: true,
                            borderColor: kGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 25,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.white,
                          Colors.white.withOpacity(0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future<void> showFilterDialog() {
    TextEditingController monthController =
        TextEditingController(text: 'All month');

    List<String> statesData = [
      'All',
      'Johor',
      'Kedah',
      'Kelantan',
      'Melaka',
      'Negeri Sembilan',
    ];
    List<String> availableData = [
      'Weekend',
      'Weekdays',
    ];

    List<String> flooringData = [
      'All',
      'Grass',
      'Turf',
      'Cement',
    ];

    List<String> genderData = [
      'All',
      'Male',
      'Female',
    ];

    List<String> arenaData = [
      'All',
      'Outdoor',
      'Indoor',
    ];

    var selectedState = 'All'.obs;
    var selectedArena = 'All'.obs;
    var selectedGender = 'All'.obs;
    var selectedFlooring = 'All'.obs;
    var selectedAvailable = 'Weekend'.obs;
    var selectedMonth = 0.obs;

    void resetData() {
      selectedState.value = 'All';
      selectedArena.value = 'All';
      selectedGender.value = 'All';
      selectedFlooring.value = 'All';
      selectedAvailable.value = 'Weekend';
      selectedMonth.value = 0;
    }

    return Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          width: Get.width * .9,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              // month text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomTextFormField(
                  hintText: 'yoo',
                  isReadOnly: true,
                  controller: monthController,
                  onTap: () => CustomDialog.chooseMonth(
                    selectedMonth: selectedMonth.value,
                    showAllData: true,
                    onSelected: (index) {
                      monthController.text = Helper.monthNames[index];
                      selectedMonth.value = index;
                    },
                  ),
                  showSuffix: true,
                  borderColor: kGreyColor,
                  suffix: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultMargin,
                      vertical: 12,
                    ),
                    child: Image.asset(
                      'assets/icons/arrow_up_down.png',
                      width: 20,
                      height: 20,
                      color: kBlackColor,
                    ),
                  ),
                ),
              ),

              // range slider
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9),
                child: RangeSliderWidget(
                  dataText: ' km',
                  title: 'Range',
                  rangeValues: const RangeValues(10, 70),
                ),
              ),
              SizedBox(height: defaultMargin),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9),
                child: RangeSliderWidget(
                  dataText: ' years',
                  title: 'Age',
                  rangeValues: const RangeValues(20, 30),
                  maxRange: 40,
                  minRange: 15,
                ),
              ),

              // states
              const SizedBox(height: 8),
              DialogFilter.selectableItem(
                title: 'States',
                listData: statesData,
                selectedData: selectedState,
              ),
              DialogFilter.selectableItem(
                title: 'Availability',
                listData: availableData,
                selectedData: selectedAvailable,
              ),
              DialogFilter.selectableItem(
                title: 'Flooring',
                listData: flooringData,
                selectedData: selectedFlooring,
              ),
              DialogFilter.selectableItem(
                title: 'Gender',
                listData: genderData,
                selectedData: selectedGender,
              ),
              DialogFilter.selectableItem(
                title: 'Arena Type',
                listData: arenaData,
                selectedData: selectedArena,
              ),

              SizedBox(height: defaultMargin),
              Container(
                padding: EdgeInsets.all(defaultMargin),
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: Row(
                  children: [
                    CircleButtonTransparentWidget(
                      size: 48,
                      onTap: resetData,
                      borderColor: kGreyColor,
                      widget: SvgPicture.asset('assets/icons/refresh.svg'),
                    ),
                    SizedBox(width: defaultMargin),
                    Expanded(
                      child: CustomButton(
                        isBlack: false,
                        onTap: Get.back,
                        title: 'Cancel',
                        borderColor: kGreyColor,
                      ),
                    ),
                    SizedBox(width: defaultMargin),
                    Expanded(
                      child: CustomButton(
                        isBlack: true,
                        onTap: Get.back,
                        title: 'Apply',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Future<void> showFilterLeaderDialog() {
    List<String> agesData = [
      'All',
      '18 - 22',
      '22 - 35',
      '35 - 45',
      '45 - 60',
    ];

    List<String> genderData = [
      'All',
      'Male',
      'Female',
    ];

    List<String> positionData = [
      'All',
      'FW',
      'MF',
      'DF',
      'GK',
    ];

    var selectedAge = 'All'.obs;
    var selectedGender = 'All'.obs;
    var selectedPosition = 'All'.obs;

    void resetData() {
      selectedGender.value = 'All';
      selectedPosition.value = 'All';
      selectedAge.value = 'All';
    }

    return Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          width: Get.width * .9,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              // states
              DialogFilter.selectableItem(
                listData: genderData,
                selectedData: selectedGender,
                iconAsset: 'assets/icons/gender.svg',
              ),
              DialogFilter.selectableItem(
                listData: agesData,
                selectedData: selectedAge,
                iconAsset: 'assets/icons/hourglass.svg',
              ),
              DialogFilter.selectableItem(
                listData: positionData,
                selectedData: selectedPosition,
                iconAsset: 'assets/icons/user.svg',
              ),

              SizedBox(height: defaultMargin),
              Container(
                padding: EdgeInsets.all(defaultMargin),
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: Row(
                  children: [
                    CircleButtonTransparentWidget(
                      size: 48,
                      onTap: resetData,
                      borderColor: kGreyColor,
                      widget: SvgPicture.asset('assets/icons/refresh.svg'),
                    ),
                    SizedBox(width: defaultMargin),
                    Expanded(
                      child: CustomButton(
                        isBlack: false,
                        onTap: Get.back,
                        title: 'Cancel',
                        borderColor: kGreyColor,
                      ),
                    ),
                    SizedBox(width: defaultMargin),
                    Expanded(
                      child: CustomButton(
                        isBlack: true,
                        onTap: Get.back,
                        title: 'Apply',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
