// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/settings/ads/ads_create/ads_create_logic.dart';
import 'package:lawan/features/presentation/settings/ads/ads_create/preview/ads_preview_ui.dart';
import 'package:lawan/utility/shared/widgets/gradient/horizontal_white_gradient.dart';

import '../../../../../utility/shared/constants/constants_ui.dart';
import '../../../../../utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import '../../../../../utility/shared/widgets/buttons/gradient_button.dart';
import '../../../../../utility/shared/widgets/navigations/custom_appbar.dart';
import '../../widgets/settings_list_container.dart';

class AdsCreateUi extends StatelessWidget {
  static const String namePath = '/ads_create_page';
  final logic = Get.find<AdsCreateLogic>();
  final state = Get.find<AdsCreateLogic>().state;
  AdsCreateUi({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buttonBottom() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.fromLTRB(
            defaultMargin,
            defaultMargin,
            defaultMargin,
            MediaQuery.of(context).padding.bottom,
          ),
          decoration: BoxDecoration(
            gradient: shadowGradient,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              GradientButton(
                widget: Text(
                  'Publish',
                  style: whiteTextStyle,
                ),
                onTap: Get.back,
              ),
            ],
          ),
        ),
      );
    }

    Widget dottedContainer({
      required String icon,
      required String title,
      required String subTitle,
      Color? iconColor,
    }) {
      return DottedBorder(
        dashPattern: const [6],
        borderType: BorderType.RRect,
        radius: const Radius.circular(20),
        color: kGreyColor,
        child: SizedBox(
          width: double.infinity,
          height: 194,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                width: 60,
                height: 60,
                color: iconColor,
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              Text(
                subTitle,
                style: darkGreyTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget optionItem({
      required String icon,
      required String title,
      required String subTitle,
    }) {
      return Row(
        children: [
          CircleButtonTransparentWidget(
            onTap: () {},
            widget: SvgPicture.asset(
              icon,
              color: kDarkgreyColor,
              width: 24,
              height: 24,
            ),
            borderColor: kGreyColor,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: blackTextStyle.copyWith(fontWeight: medium),
                ),
                Text(
                  subTitle,
                  style: darkGreyTextStyle.copyWith(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          SvgPicture.asset(
            'assets/icons/chevron-right.svg',
            width: 24,
            height: 24,
          ),
        ],
      );
    }

    Widget selectedImage() {
      return GestureDetector(
        onTap: () => Get.to(
          () => AdsPreviewUi(
            file: File(state.imagePath.value),
          ),
        ),
        child: Container(
          width: double.infinity,
          height: 194,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kBlackColor,
          ),
          child: Image.file(
            File(state.imagePath.value),
            fit: BoxFit.fitHeight,
            height: 194,
            width: double.infinity,
          ),
        ),
      );
    }

    Widget adsMediaSection() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(defaultMargin),
        margin: EdgeInsets.only(bottom: defaultMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kWhiteColor,
        ),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ads Media',
                style: darkGreyTextStyle.copyWith(fontWeight: medium),
              ),
              SizedBox(height: defaultMargin),
              if (state.imagePath.value != '') selectedImage(),
              if (state.imagePath.value == '')
                GestureDetector(
                  onTap: logic.getImageOrVideo,
                  child: dottedContainer(
                    icon: 'assets/icons/play.svg',
                    title: 'Add Image or Video',
                    subTitle: '1080x1920, 9:16 recommended',
                    iconColor: kMidgreyColor,
                  ),
                ),
              SizedBox(height: defaultMargin),
              optionItem(
                icon: 'assets/icons/copy.svg',
                title: 'CTA Link',
                subTitle:
                    'https://shopee.com.my/%E2%AD%90-_Perfume-Yaya-Empire-10ml_-%E2%AD%90-i.1267536086.27301713290?sp_atk=ba67f418-092c-4d11-928d-5fe562e86d48&xptdk=ba67f418-092c-4d11-928d-5fe562e86d48',
              ),
            ],
          ),
        ),
      );
    }

    Widget brandMediaSection() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(defaultMargin),
        margin: EdgeInsets.only(bottom: defaultMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kWhiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Brand',
              style: darkGreyTextStyle.copyWith(fontWeight: medium),
            ),
            SizedBox(height: defaultMargin),
            dottedContainer(
              icon: 'assets/icons/user-rounded.svg',
              title: 'Upload Profile Picture',
              subTitle: '400x400 min, 1:1 recommended',
            ),
            SizedBox(height: defaultMargin),
            optionItem(
              icon: 'assets/icons/user_thin.svg',
              title: 'Display Name',
              subTitle: 'The Ambitionista',
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              defaultMargin,
              MediaQuery.of(context).padding.top,
              defaultMargin,
              0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppbar(
                  title: 'Create Ads',
                  iconColor: kDarkgreyColor,
                  borderColor: kGreyColor,
                  textColor: kBlackColor,
                ),
                Expanded(
                  child: Stack(
                    children: [
                      ListView(
                        padding: EdgeInsets.only(
                          top: defaultMargin,
                          bottom: 100,
                        ),
                        children: [
                          SettingsListContainer(
                            listSettings: state.moreItems,
                            title: 'Settings',
                          ),
                          adsMediaSection(),
                          brandMediaSection(),
                          SettingsListContainer(
                            listSettings: state.bindingItems,
                            title: 'Bidding',
                          ),
                        ],
                      ),
                      const HorizontalWhiteGradient(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // bottom navbar
          buttonBottom(),
        ],
      ),
    );
  }
}
