// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/payment/payment/add_card/payment_add_card_logic.dart';
import 'package:lawan/utility/shared/widgets/buttons/gradient_button.dart';
import 'package:lawan/utility/util/formatter/alphabet_formatter.dart';
import 'package:lawan/utility/util/formatter/expired_date_format.dart';
import 'package:lawan/utility/util/helper.dart';

import '../../../../../../utility/shared/constants/constants_ui.dart';
import '../../../../../../utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import '../../../../../../utility/shared/widgets/custom_text_form_fields.dart';
import '../../../../../../utility/shared/widgets/payment/card_widget.dart';

class PaymentAddCardPage extends StatelessWidget {
  static const String namePath = '/payment_add_card_page';
  final ctrl = Get.find<PaymentAddCardLogic>();
  PaymentAddCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    var cardNumber = ''.obs;
    var expired = ''.obs;
    var name = ''.obs;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        surfaceTintColor: Colors.transparent,
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/credit-card.svg',
              color: kBlackColor,
            ),
            const SizedBox(width: 10),
            Text(
              ctrl.isAdmin ? 'Company and Bank Details' : 'Add Card',
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
          ],
        ),
        leadingWidth: 48 + defaultMargin,
        leading: CircleButtonTransparentWidget(
          borderColor: kGreyColor,
          margin: EdgeInsets.only(left: defaultMargin),
          onTap: () {
            Get.back();
            ctrl.clearData();
          },
          size: 48,
          widget: SvgPicture.asset(
            'assets/icons/back.svg',
            color: kBlackColor,
          ),
        ),
      ),
      body: Column(
        children: [
          if (ctrl.isAdmin)
            Padding(
              padding: EdgeInsets.fromLTRB(defaultMargin, 12, defaultMargin, 0),
              child: CustomTextFormField(
                hintText: 'Business Name',
                controller: TextEditingController(),
                title: 'Business Name',
                textInputType: TextInputType.text,
                maxLength: 19,
                onChanged: (value) {},
              ),
            ),
          if (ctrl.isAdmin)
            Padding(
              padding: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 0),
              child: CustomTextFormField(
                hintText: 'SSM Number',
                controller: TextEditingController(),
                title: 'Registration Number',
                textInputType: const TextInputType.numberWithOptions(
                    signed: true, decimal: false),
                maxLength: 19,
                onChanged: (value) {},
              ),
            ),
          Obx(
            () => CardWidget(
              icon: Helper.getCardType(cardNumber.value),
              expDate: expired.value,
              cardNumber: cardNumber.value,
              cardOwner: name.value,
              cardType: 'Debit Card',
            ),
          ),
          Expanded(
            child: _buildForm(
              cardNumber: cardNumber,
              expired: expired,
              name: name,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
              16,
              0,
              16,
              Platform.isIOS ? MediaQuery.of(context).padding.bottom : 12,
            ),
            height: 48,
            child: GradientButton(
              widget: Text(
                'Add Card',
                style: whiteTextStyle,
              ),
              onTap: () {
                ctrl.addCard();
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildForm({
    required RxString cardNumber,
    required RxString expired,
    required RxString name,
  }) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      child: SingleChildScrollView(
        controller: ScrollController(),
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: ctrl.formKey,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'Card Number',
                controller: ctrl.cardNumberCtrl,
                title: 'Card Number',
                textInputType: const TextInputType.numberWithOptions(
                    signed: true, decimal: false),
                maxLength: 19,
                showSuffix: true,
                suffix: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/camera.svg',
                      width: 24,
                      height: 24,
                      color: kDarkgreyColor,
                    ),
                  ],
                ),
                onChanged: (value) {
                  // Remove non-digit characters
                  String digits = value.replaceAll(RegExp(r'\D'), '');

                  // Format the card number
                  StringBuffer formatted = StringBuffer();
                  for (int i = 0; i < digits.length; i++) {
                    if (i > 0 && i % 4 == 0) {
                      formatted.write('-');
                    }
                    formatted.write(digits[i]);
                  }

                  // Update the text in the TextFormField
                  ctrl.cardNumberCtrl.value = TextEditingValue(
                    text: formatted.toString(),
                    selection:
                        TextSelection.collapsed(offset: formatted.length),
                  );
                  cardNumber.value = digits;
                },
                validator: (v) {
                  if (v!.isEmpty) {
                    return 'please fill out this field.';
                  } else if (v.length != 19) {
                    return 'card number must be 16 digits.';
                  } else {
                    return null;
                  }
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      hintText: 'MM/YY',
                      controller: ctrl.expDateCtrl,
                      title: 'Expired Date',
                      onChanged: (data) => expired.value = data,
                      textInputType: const TextInputType.numberWithOptions(
                          signed: true, decimal: false),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        ExpirationDateFormatter(), // Apply the custom formatter here
                      ],
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'please fill out this field.';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextFormField(
                      hintText: 'CVV',
                      controller: ctrl.cvvCtrl,
                      title: 'CVV',
                      textInputType: const TextInputType.numberWithOptions(
                          signed: true, decimal: false),
                      maxLength: 3,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'please fill out this field.';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ],
              ),
              if (ctrl.showBank)
                CustomTextFormField(
                  hintText: 'Bank Name',
                  controller: ctrl.bankNameCtrl,
                  title: 'Bank Name',
                  inputFormatters: [
                    AlphabeticFormatter(),
                  ],
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'please fill out this field.';
                    } else {
                      return null;
                    }
                  },
                ),
              CustomTextFormField(
                hintText: 'Name',
                controller: ctrl.nameCtrl,
                title: 'Name on Card',
                onChanged: (data) => name.value = data,
                inputFormatters: [
                  AlphabeticFormatter(),
                ],
                validator: (v) {
                  if (v!.isEmpty) {
                    return 'please fill out this field.';
                  } else {
                    return null;
                  }
                },
              ),
              CustomTextFormField(
                hintText: 'Address',
                controller: ctrl.addressCtrl,
                title: 'Billing Address',
                validator: (v) {
                  if (v!.isEmpty) {
                    return 'please fill out this field.';
                  } else {
                    return null;
                  }
                },
              ),
              CustomTextFormField(
                hintText: 'Postal Code',
                controller: ctrl.postCodeCtrl,
                textInputType: const TextInputType.numberWithOptions(
                    signed: true, decimal: false),
                maxLength: 8,
                validator: (v) {
                  if (v!.isEmpty) {
                    return 'please fill out this field.';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
