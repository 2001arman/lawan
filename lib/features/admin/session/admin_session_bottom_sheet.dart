import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/circle_button_transparent_widget.dart';
import 'package:lawan/utility/shared/widgets/custom_button.dart';
import 'package:lawan/utility/shared/widgets/field_image_widget.dart';
import 'package:lawan/utility/shared/widgets/field_number_widget.dart';
import 'package:lawan/utility/shared/widgets/host_avatar_widget.dart';
import 'package:lawan/utility/shared/widgets/text_boder.dart';
import 'package:lawan/utility/shared/widgets/text_pill_widget.dart';

import '../../../utility/util/helper.dart';
import '../../domain/arena/arena_model.dart';
import '../../domain/session/session_model.dart';

class AdminSessionBottomSheet {
  Widget cardDetailSession({
    required String title,
    required IconData icon,
    required String contentText,
    required double fontSize,
    String? description,
  }) {
    return Expanded(
      child: Container(
        height: 98,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: kGreyColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: kDarkgreyColor,
                  size: 18,
                ),
                const SizedBox(width: 4),
                Text(
                  title,
                  style: darkGreyTextStyle.copyWith(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              contentText,
              style: blackTextStyle.copyWith(
                fontWeight: medium,
                fontSize: fontSize,
              ),
              overflow: description != null
                  ? TextOverflow.ellipsis
                  : TextOverflow.visible,
            ),
            if (description != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: TextBoder(
                  textTitle: description,
                  fontSize: 11,
                  paddingVertical: 0,
                  paddingHorizontal: 6,
                ),
              ),
          ],
        ),
      ),
    );
  }

  void sessionContainerSheet({required Widget widgetContent}) {
    Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          height: Get.height * 0.8,
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
                      widget: Icon(
                        Icons.close,
                        color: kDarkgreyColor,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    padding: EdgeInsets.all(defaultMargin),
                    color: kWhiteColor,
                    child: Row(
                      children: [
                        CircleButtonTransparentWidget(
                          onTap: () {},
                          borderColor: kGreyColor,
                          widget: SvgPicture.asset(
                            'assets/icons/trash.svg',
                          ),
                        ),
                        const SizedBox(width: 16),
                        CircleButtonTransparentWidget(
                          onTap: () {},
                          borderColor: kGreyColor,
                          widget: const Icon(
                            Icons.file_upload_outlined,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 16),
                        CircleButtonTransparentWidget(
                          onTap: () {},
                          borderColor: kGreyColor,
                          widget: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Image.asset(
                              'assets/icons/pencil.png',
                              color: kDarkgreyColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        CustomButton(
                          isBlack: true,
                          onTap: () {},
                          widget: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.groups_outlined,
                                color: kMidgreyColor,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Lobby',
                                style:
                                    whiteTextStyle.copyWith(fontWeight: medium),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      isScrollControlled: true,
      enableDrag: true,
    );
  }

  void showDetailSessionSheet({required SessionModel sessionData}) {
    return sessionContainerSheet(
      widgetContent: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
              sessionData.arena.name,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FieldNumberWidget(
                iconColor: kDarkgreyColor,
                court: sessionData
                    .arena.courtData[sessionData.selectedCourt].courtName,
              ),
            ],
          ),
          const SizedBox(height: 4),
          const TextPillWidget(data: 'Complete'),
          const HostAvatarWidget(),
          Row(
            children: [
              cardDetailSession(
                contentText: Helper.formatFullDate(sessionData.dateTime),
                title: 'Date',
                icon: Icons.date_range_outlined,
                fontSize: 14,
              ),
              const SizedBox(width: 8),
              cardDetailSession(
                contentText:
                    '${Helper.formatTime12Hour(sessionData.startHour)} - ${Helper.formatTime12Hour(sessionData.endHour)}',
                title: 'Time',
                icon: Icons.access_time_outlined,
                fontSize: 14,
                description: '${sessionData.totalHour}hr',
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              cardDetailSession(
                contentText: sessionData.arena.location,
                title: 'Location',
                icon: Icons.location_on_outlined,
                fontSize: 14,
              ),
              const SizedBox(width: 8),
              cardDetailSession(
                contentText: 'RM${sessionData.price}',
                title: 'Price',
                icon: Icons.monetization_on_outlined,
                fontSize: 20,
              ),
            ],
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  void successCreateSesssionSheet({required ArenaModel arenaModel}) {
    return sessionContainerSheet(
      widgetContent: SizedBox(
        width: Get.width,
        child: Column(
          children: [
            SizedBox(height: defaultMargin),
            Container(
              width: 40,
              height: 40,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: kGreenColor),
              child: Icon(
                Icons.check,
                color: kWhiteColor,
                size: 20,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Session Succesfully Created',
              style: darkGreyTextStyle.copyWith(fontWeight: medium),
            ),
            SizedBox(height: defaultMargin),
            FieldImageWidget(
              arenaModel: arenaModel,
              isSelected: false,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                CustomButton(
                  isBlack: true,
                  onTap: () {},
                  paddingVertical: 8,
                  widget: Column(
                    children: [
                      Text(
                        'Sesssion starting in',
                        style: midGreyTextStyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        '2 days 2 hours 6 mins 3 sec ',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const HostAvatarWidget(),
            // const Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     TextPillWidget(data: '25 - 35 years'),
            //     SizedBox(width: 8),
            //     TextPillWidget(data: 'Male & Female'),
            //     SizedBox(width: 8),
            //     TextPillWidget(data: 'English & Malay'),
            //   ],
            // ),
            Row(
              children: [
                cardDetailSession(
                  contentText: 'Tue,  25 Sep 2024',
                  title: 'Date',
                  icon: Icons.date_range_outlined,
                  fontSize: 14,
                ),
                const SizedBox(width: 8),
                cardDetailSession(
                  contentText: '9:00 AM - 11:00 AM',
                  title: 'Time',
                  icon: Icons.access_time_outlined,
                  fontSize: 14,
                  description: '2hr',
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                cardDetailSession(
                  contentText: 'Petaling Jaya, Selangor',
                  title: 'Location',
                  icon: Icons.location_on_outlined,
                  fontSize: 14,
                ),
                const SizedBox(width: 8),
                cardDetailSession(
                  contentText: 'RM220',
                  title: 'Price',
                  icon: Icons.monetization_on_outlined,
                  fontSize: 20,
                ),
              ],
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
