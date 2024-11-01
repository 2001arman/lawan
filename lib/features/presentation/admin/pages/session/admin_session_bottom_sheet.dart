import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/lobby/pages/lobby_ui.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import 'package:lawan/utility/shared/widgets/buttons/custom_button.dart';
import 'package:lawan/utility/shared/widgets/card_detail_session.dart';
import 'package:lawan/utility/shared/widgets/fields/field_image_widget.dart';
import 'package:lawan/utility/shared/widgets/fields/field_number_widget.dart';
import 'package:lawan/utility/shared/widgets/host_avatar_widget.dart';
import 'package:lawan/utility/shared/widgets/share_section.dart';
import 'package:lawan/utility/shared/widgets/text/text_pill_widget.dart';

import '../../../../../utility/util/helper.dart';
import '../../../../domain/arena/arena_model.dart';
import '../../../../domain/session/session_model.dart';

class AdminSessionBottomSheet {
  Future<void> sessionContainerSheet({
    required Widget widgetContent,
    required VoidCallback onDelete,
    required VoidCallback onUpdate,
    required VoidCallback onShare,
    required VoidCallback onBackShare,
    bool isAdmin = true,
  }) {
    var showShare = false.obs;
    return Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.all(8),
        child: Obx(
          () => SizedBox(
            height: showShare.value ? Get.height * 0.88 : Get.height * 0.75,
            width: Get.width,
          ).blurred(
            blur: 7,
            blurColor: Colors.white,
            colorOpacity: 0,
            borderRadius: BorderRadius.circular(32),
            overlay: Container(
              width: Get.width,
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
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: SingleChildScrollView(
                      child: widgetContent,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: CircleButtonTransparentWidget(
                        size: 40,
                        onTap: Get.back,
                        borderColor: kGreyColor,
                        widget: SvgPicture.asset('assets/icons/x.svg'),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Obx(
                      () => Visibility(
                        visible: showShare.value == false,
                        replacement: Container(
                          width: double.infinity,
                          height: 163,
                          padding: EdgeInsets.all(defaultMargin),
                          color: kWhiteColor,
                          child: ShareSection(
                            onTapBack: () {
                              showShare.value = false;
                              onBackShare();
                            },
                          ),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 80,
                          padding: EdgeInsets.all(defaultMargin),
                          color: kWhiteColor,
                          child: Row(
                            children: [
                              CircleButtonTransparentWidget(
                                onTap: isAdmin ? onDelete : onUpdate,
                                borderColor: kGreyColor,
                                widget: SvgPicture.asset(
                                  isAdmin
                                      ? 'assets/icons/trash.svg'
                                      : 'assets/icons/pencil.svg',
                                ),
                              ),
                              const SizedBox(width: 16),
                              CircleButtonTransparentWidget(
                                onTap: () {
                                  showShare.value = true;
                                  onShare();
                                },
                                borderColor: kGreyColor,
                                widget:
                                    SvgPicture.asset('assets/icons/upload.svg'),
                              ),
                              const SizedBox(width: 16),
                              CircleButtonTransparentWidget(
                                onTap: isAdmin ? onUpdate : Helper.openCalendar,
                                borderColor: kGreyColor,
                                widget: SvgPicture.asset(isAdmin
                                    ? 'assets/icons/pencil.svg'
                                    : 'assets/icons/calendar.svg'),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: CustomButton(
                                  isBlack: true,
                                  onTap: () => Get.toNamed(LobbyUi.namePath),
                                  widget: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/users_group.svg',
                                        width: 16,
                                        height: 16,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Lobby',
                                        style: whiteTextStyle.copyWith(
                                            fontWeight: medium),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      isScrollControlled: true,
      enableDrag: true,
    );
  }

  Widget qrSection({required String arenaName}) {
    return Column(
      children: [
        Container(
          width: Get.width * 0.5,
          padding: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            gradient: mainGradient,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(80),
              bottomRight: Radius.circular(80),
            ),
          ),
          child: Text(
            arenaName,
            style: whiteTextStyle.copyWith(
              fontSize: 12,
              fontWeight: medium,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 12),
        SvgPicture.asset(
          'assets/icons/QR.svg',
          width: Get.width * 0.5,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            FieldNumberWidget(
              court: '4',
              iconColor: kDarkgreyColor,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        )
      ],
    );
  }

  Future<void> successCreateSesssionSheet({
    required ArenaModel arenaModel,
    required int selectedCourt,
    required SessionModel session,
    required VoidCallback onUpdate,
    required VoidCallback onDelete,
    bool successCreate = true,
    bool showPill = false,
    String title = 'Session Succesfully Created',
    bool isAdmin = true,
  }) {
    var showQr = false.obs;
    return sessionContainerSheet(
      onDelete: onDelete,
      onUpdate: onUpdate,
      onBackShare: () {
        showQr.toggle();
      },
      onShare: () {
        showQr.toggle();
      },
      isAdmin: isAdmin,
      widgetContent: SizedBox(
        width: Get.width,
        child: Column(
          children: [
            Obx(
              () => showQr.value
                  ? const SizedBox()
                  : Visibility(
                      visible: successCreate,
                      replacement: Padding(
                        padding: EdgeInsets.symmetric(vertical: defaultMargin),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/ball.png',
                              width: 30,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Friendly',
                              style: blackTextStyle.copyWith(
                                  fontSize: 20, fontWeight: medium),
                            ),
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: defaultMargin),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: kGreenColor),
                            child: Icon(
                              Icons.check,
                              color: kWhiteColor,
                              size: 20,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            title,
                            style:
                                darkGreyTextStyle.copyWith(fontWeight: medium),
                          ),
                          SizedBox(height: defaultMargin),
                        ],
                      ),
                    ),
            ),
            Obx(
              () => showQr.value
                  ? qrSection(arenaName: session.arena.name)
                  : FieldImageWidget(
                      arenaModel: arenaModel,
                      selectedCourt: selectedCourt,
                      showInformation: true,
                      showLocation: false,
                    ),
            ),
            Obx(
              () => showQr.value
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Visibility(
                        visible: Helper.isUpcoming(session.getStartDateTime()),
                        child: CustomButton(
                          isBlack: true,
                          onTap: () {},
                          width: double.infinity,
                          paddingVertical: 8,
                          widget: Column(
                            children: [
                              Text(
                                'Sesssion starting in',
                                style: midGreyTextStyle.copyWith(fontSize: 12),
                              ),
                              Text(
                                Helper.timeBetweenNowAndSession(
                                  session.getStartDateTime(),
                                ),
                                style: whiteTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: semiBold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            ),
            const HostAvatarWidget(),
            Visibility(
              visible: showPill,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextPillWidget(title: '25 - 35 years'),
                  SizedBox(width: 8),
                  TextPillWidget(title: 'Male & Female'),
                  SizedBox(width: 8),
                  TextPillWidget(title: 'English & Malay'),
                ],
              ),
            ),
            if (showPill) const SizedBox(height: 16),
            Row(
              children: [
                CardDetailSession(
                  contentText: Helper.formatFullDate(session.dateTime),
                  title: 'Date',
                  icon: 'assets/icons/calendar.svg',
                  fontSize: 14,
                ),
                const SizedBox(width: 8),
                CardDetailSession(
                  contentText:
                      '${Helper.formatTime12Hour(session.startHour)} - ${Helper.formatTime12Hour(session.endHour)}',
                  title: 'Time',
                  icon: 'assets/icons/clock.svg',
                  fontSize: 14,
                  description: '${session.totalHour}hr',
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                CardDetailSession(
                  contentText: session.arena.location,
                  title: 'Location',
                  icon: 'assets/icons/location.svg',
                  fontSize: 14,
                ),
                const SizedBox(width: 8),
                CardDetailSession(
                  contentText: 'RM${session.price}',
                  title: 'Price',
                  icon: 'assets/icons/currency.svg',
                  fontSize: 20,
                  showPax: true,
                ),
              ],
            ),
            Obx(
              () => SizedBox(height: showQr.value ? 183 : 100),
            ),
          ],
        ),
      ),
    );
  }
}
