import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../util/generate_card_number.dart';
import '../../constants/constants_ui.dart';

class CardWidget extends StatelessWidget {
  final String icon;
  final String expDate;
  final String cardNumber;
  final String cardOwner;
  final String cardType;
  const CardWidget({
    super.key,
    required this.icon,
    required this.expDate,
    required this.cardNumber,
    required this.cardOwner,
    required this.cardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 250,
      margin: const EdgeInsets.only(top: 0, right: 16),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(icon),
              Text(
                expDate,
                style: darkGreyTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: generateCardNumber(cardNumber),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  cardOwner,
                  style: darkGreyTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                cardType,
                style: midGreyTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: reguler,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
