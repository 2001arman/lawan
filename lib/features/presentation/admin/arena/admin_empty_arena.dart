import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utility/shared/constants/constants_ui.dart';
import 'controller/admin_arena_logic.dart';

class AdminEmptyArena extends StatelessWidget {
  final logic = Get.find<AdminArenaLogic>();
  AdminEmptyArena({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SizedBox(
          width: double.infinity,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'List your arena ',
              style: blackTextStyle.copyWith(
                fontFamily: 'Lufga',
                fontWeight: semiBold,
                fontSize: 20,
                height: 24 / 20,
                letterSpacing: -0.03 * 20,
              ),
              children: [
                TextSpan(
                  text: 'with Lawan,\nattrack and inspire Pahlawans!',
                  style: blackTextStyle.copyWith(fontWeight: reguler),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(defaultMargin),
          margin: EdgeInsets.symmetric(vertical: defaultMargin),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            border: Border.all(width: 2, color: kWhiteColor),
          ),
          child: Column(
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Seamless experience ',
                  style: blackTextStyle.copyWith(
                    fontFamily: 'Lufga',
                    fontWeight: semiBold,
                    fontSize: 14,
                    height: 21 / 14,
                  ),
                  children: [
                    TextSpan(
                      text: 'for your customers',
                      style: blackTextStyle.copyWith(fontWeight: reguler),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Image.asset(
                'assets/icons/scan.png',
                width: 64,
                height: 64,
              ),
              const SizedBox(height: 8),
              Text(
                'in creating and sharing sessions with friends.',
                style: blackTextStyle.copyWith(fontSize: 12),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 141,
                padding: EdgeInsets.all(defaultMargin),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(width: 2, color: kWhiteColor),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icons/devices.png',
                      width: 64,
                      height: 64,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Online visibility',
                      style: blackTextStyle.copyWith(fontSize: 14),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: defaultMargin),
            Expanded(
              child: Container(
                height: 141,
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(width: 2, color: kWhiteColor),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(top: defaultMargin),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Earn income ',
                            style: blackTextStyle.copyWith(
                              fontFamily: 'Lufga',
                              fontWeight: semiBold,
                              fontSize: 14,
                              height: 21 / 14,
                            ),
                            children: [
                              TextSpan(
                                text: 'by listing as many arena that you own',
                                style: blackTextStyle.copyWith(
                                    fontWeight: reguler),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -16,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        'assets/icons/dollar.png',
                        width: double.infinity,
                        height: 64,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () => logic.createNewArena(),
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: defaultMargin),
            height: 252,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              gradient: mainGradient,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/icons/field.png',
                    width: 220,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        margin: const EdgeInsets.only(bottom: 8, top: 27),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kWhiteColor),
                        child: Icon(Icons.add, color: kBlackColor),
                      ),
                      Text(
                        'Add Arena',
                        style: whiteTextStyle.copyWith(fontWeight: medium),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}
