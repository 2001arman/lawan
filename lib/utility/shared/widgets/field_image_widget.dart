import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants_ui.dart';
import 'text_boder.dart';

class FieldImageWidget extends StatelessWidget {
  const FieldImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: AspectRatio(
        aspectRatio: 2.88 / 1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            border: Border.all(width: 1, color: kGreyColor),
            image: const DecorationImage(
              image: AssetImage(
                'assets/images/field1.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Container(
                width: Get.width * 0.5,
                padding: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: kBlackColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(80),
                  ),
                ),
                child: Text(
                  'MBPJ Sports Complex',
                  style: whiteTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: medium,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Row(
                  children: [
                    TextBoder(
                      textTitle: '5.2km',
                      backgroundColor: kWhiteColor,
                      paddingVertical: 0,
                      paddingHorizontal: 8,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: kWhiteColor,
                            size: 20,
                          ),
                          Text(
                            'Petaling Jaya',
                            style: whiteTextStyle.copyWith(
                                fontSize: 12, fontWeight: medium),
                          ),
                        ],
                      ),
                    ),
                    TextBoder(
                      textTitle: 'Grass',
                      backgroundColor: kWhiteColor,
                      paddingVertical: 0,
                      paddingHorizontal: 8,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
