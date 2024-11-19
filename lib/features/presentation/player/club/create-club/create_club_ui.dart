// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/club/create-club/create_club_logic.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/custom_text_form_fields.dart';
import 'package:lawan/utility/shared/widgets/navigations/custom_appbar.dart';
import 'package:lawan/utility/shared/widgets/navigations/payment_bottom_bar.dart';

class CreateClubUi extends StatelessWidget {
  static const String namePath = '/create-club-page';
  final logic = Get.find<CreateClubLogic>();
  final state = Get.find<CreateClubLogic>().state;
  CreateClubUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              defaultMargin,
              MediaQuery.of(context).padding.top,
              defaultMargin,
              defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppbar(
                  title: 'Enter club details',
                  iconColor: kDarkgreyColor,
                  borderColor: kGreyColor,
                  textColor: kBlackColor,
                ),
                SizedBox(height: defaultMargin),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: logic.image,
                      child: SizedBox(
                        width: 48,
                        height: 60,
                        child: Stack(
                          children: [
                            GestureDetector(
                              child: Obx(
                                () => Container(
                                  width: 48,
                                  height: 48,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kMidgreyColor,
                                    image: state.selectedImage.value != ''
                                        ? DecorationImage(
                                            image: FileImage(
                                              File(state.selectedImage.value),
                                            ),
                                            fit: BoxFit.cover,
                                          )
                                        : null,
                                  ),
                                  child: state.selectedImage.value == ''
                                      ? SvgPicture.asset(
                                          'assets/icons/club.svg',
                                          color: kWhiteColor,
                                        )
                                      : null,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: const SizedBox(
                                  width: 22,
                                  height: 22,
                                ).blurred(
                                  blur: 10,
                                  overlay: Container(
                                    width: 22,
                                    height: 22,
                                    padding: const EdgeInsets.all(4),
                                    child: SvgPicture.asset(
                                      'assets/icons/pencil.svg',
                                      color: kDarkgreyColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // input section
                SizedBox(height: defaultMargin),
                Text('Club Name', style: darkGreyTextStyle),
                const SizedBox(height: 8),
                CustomTextFormField(
                  hintText: 'Name',
                  controller: TextEditingController(),
                ),
                CustomTextFormField(
                  hintText: 'Acronym',
                  controller: TextEditingController(),
                  margin: 0,
                ),
                SizedBox(height: defaultMargin),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'This will appear on your profile',
                      style: darkGreyTextStyle.copyWith(fontSize: 10),
                    ),
                  ],
                ),

                // input region
                SizedBox(height: defaultMargin),
                Text('Where is this club located', style: darkGreyTextStyle),
                const SizedBox(height: 8),
                CustomTextFormField(
                  hintText: '',
                  controller: TextEditingController(text: 'Malaysia'),
                  prefix: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: SvgPicture.asset('assets/images/malaysia.svg'),
                  ),
                  showSuffix: true,
                  suffix: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: SvgPicture.asset(
                      'assets/icons/chevron-down.svg',
                      color: kBlackColor,
                    ),
                  ),
                ),
                CustomTextFormField(
                  hintText: 'State',
                  controller: TextEditingController(),
                  showSuffix: true,
                  suffix: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: SvgPicture.asset(
                      'assets/icons/chevron-down.svg',
                      color: kBlackColor,
                    ),
                  ),
                ),
                CustomTextFormField(
                  hintText: 'Region',
                  controller: TextEditingController(),
                  showSuffix: true,
                  suffix: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: SvgPicture.asset(
                      'assets/icons/chevron-down.svg',
                      color: kBlackColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: PaymentBottomBar(
              useCoin: true,
              totalPayment: '1500',
              textButton: 'Create Now',
              onTapPay: Get.back,
            ),
          ),
        ],
      ),
    );
  }
}
