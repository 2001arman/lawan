// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/club/club_logic.dart';
import 'package:lawan/features/presentation/player/club/create-club/create_club_ui.dart';
import 'package:lawan/features/presentation/settings/comming-soon/comming_soon_ui.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/custom_text_form_fields.dart';
import 'package:lawan/utility/shared/widgets/gradient/horizontal_white_gradient.dart';
import 'package:lawan/utility/shared/widgets/text/text_border.dart';

import '../../../../utility/shared/widgets/selected_container_widget.dart';

class ClubUi extends StatelessWidget {
  final logic = Get.find<ClubLogic>();
  final state = Get.find<ClubLogic>().state;
  ClubUi({super.key});

  @override
  Widget build(BuildContext context) {
    Widget appBarItem({
      required String icon,
      required String title,
      required VoidCallback onTap,
    }) {
      return Expanded(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: kGreyColor),
              borderRadius: BorderRadius.circular(32),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  icon,
                  width: 16,
                  color: kDarkgreyColor,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style:
                      blackTextStyle.copyWith(fontSize: 15, fontWeight: medium),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget textItem({required String type}) {
      return Expanded(
        child: Column(
          children: [
            Text(
              '2133',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            Text(
              type,
              style: darkGreyTextStyle.copyWith(fontSize: 12),
            ),
          ],
        ),
      );
    }

    Widget clubItem() {
      return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kWhiteColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icons/club-arsenal.png',
                  width: 48,
                  height: 48,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Arsenal FC',
                        style: blackTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const TextBorder(
                        textTitle: 'Grassroots',
                        paddingVertical: 0,
                        paddingHorizontal: 6,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                textItem(type: 'Win'),
                Container(
                  width: 2,
                  height: 40,
                  color: kBackgroundColor,
                ),
                textItem(type: 'Draw'),
                Container(
                  width: 2,
                  height: 40,
                  color: kBackgroundColor,
                ),
                textItem(type: 'Loss'),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(400),
                      color: kBackgroundColor,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/eye.svg',
                      width: 16,
                      height: 16,
                      color: kDarkgreyColor,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    return Column(
      children: [
        SizedBox(
          height: 58 + MediaQuery.of(context).padding.top + defaultMargin,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            children: [
              appBarItem(
                icon: 'assets/icons/users-outline.svg',
                title: 'Transfer',
                onTap: () => Get.toNamed(CommingSoonUi.namePath),
              ),
              SizedBox(width: defaultMargin),
              appBarItem(
                icon: 'assets/icons/plus.svg',
                title: 'New Club',
                onTap: () => Get.toNamed(CreateClubUi.namePath),
              ),
            ],
          ),
        ),
        SizedBox(height: defaultMargin),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: CustomTextFormField(
            hintText: 'Search',
            controller: TextEditingController(),
            prefix: Padding(
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset(
                'assets/icons/search.svg',
                color: kDarkgreyColor,
              ),
            ),
            showClear: true,
            margin: 0,
          ),
        ),
        SizedBox(height: defaultMargin),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: defaultMargin),
              ...state.clubType.map(
                (data) => Obx(
                  () => SelectedContainerWidget(
                    title: data,
                    isSelected: state.selectedType.value == data,
                    onTap: () => state.selectedType.value = data,
                    isTransparent: true,
                    borderColor: kGreyColor,
                    marginRight: 8,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Stack(
            children: [
              GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 168,
                  mainAxisSpacing: 8,
                ),
                padding: EdgeInsets.only(
                  left: defaultMargin,
                  right: defaultMargin,
                  bottom: 100,
                  top: 8,
                ),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return clubItem();
                },
              ),
              const HorizontalWhiteGradient(),
            ],
          ),
        ),
      ],
    );
  }
}
