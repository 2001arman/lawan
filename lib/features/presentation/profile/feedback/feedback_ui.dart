import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/profile/feedback/feedback_logic.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/custom_text_form_fields.dart';
import 'package:lawan/utility/shared/widgets/navigations/custom_appbar.dart';

import '../../../../utility/shared/widgets/buttons/gradient_button.dart';

class FeedbackUi extends StatelessWidget {
  static const String namePath = '/feedback_page';
  final logic = Get.find<FeedbackLogic>();
  FeedbackUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppbar(
                  title: 'Help us improve the app',
                  iconColor: kDarkgreyColor,
                  borderColor: kGreyColor,
                  textColor: kBlackColor,
                  icon: 'assets/icons/x.svg',
                ),
                SizedBox(height: defaultMargin),
                Text(
                  'Rate your Experience',
                  style: darkGreyTextStyle,
                ),
                SizedBox(height: defaultMargin),
                Container(
                  width: double.infinity,
                  height: 48,
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: kGreyColor),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    children: [
                      for (int i = 0; i < 5; i++)
                        Expanded(
                          child: GestureDetector(
                            onTap: () => logic.rating.value = i,
                            child: Container(
                              height: 48,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                border: Border(
                                  right: i == 4
                                      ? BorderSide.none
                                      : BorderSide(width: 1, color: kGreyColor),
                                ),
                              ),
                              child: Obx(
                                () => SvgPicture.asset(
                                  logic.rating.value + 1 > i
                                      ? 'assets/icons/star.svg'
                                      : 'assets/icons/star-empty.svg',
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: logic.rating.value == -1,
                    replacement: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          logic.selectedByStar(logic.rating.value),
                          style: darkGreyTextStyle.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Very Poor',
                          style: darkGreyTextStyle.copyWith(fontSize: 12),
                        ),
                        Text(
                          'Excellent',
                          style: darkGreyTextStyle.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: defaultMargin),
                Text(
                  'Let us know how we can improve the experience',
                  style: darkGreyTextStyle,
                ),
                const SizedBox(height: 12),
                CustomTextFormField(
                  hintText: 'We’d love to know...',
                  controller: TextEditingController(),
                  minLines: 7,
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 110,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 110,
                  padding: const EdgeInsets.only(top: 12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        kBlackColor.withOpacity(0),
                        kBlackColor.withOpacity(0.4),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 48,
                    margin: EdgeInsets.fromLTRB(
                      16,
                      0,
                      16,
                      MediaQuery.of(context).padding.bottom,
                    ),
                    child: GradientButton(
                      widget: Text(
                        'Submit',
                        style: whiteTextStyle.copyWith(fontWeight: medium),
                      ),
                      onTap: Get.back,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
