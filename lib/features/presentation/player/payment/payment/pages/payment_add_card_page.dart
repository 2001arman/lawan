import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/utility/shared/widgets/buttons/gradient_button.dart';

import '../../../../../../utility/shared/constants/constants_ui.dart';
import '../../../../../../utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import '../../../../../../utility/shared/widgets/custom_text_form_fields.dart';
import '../../../../../../utility/shared/widgets/payment/card_widget.dart';
import '../controllers/payment_controller.dart';

class PaymentAddCardPage extends StatelessWidget {
  static const String namePath = '/payment_add_card_page';
  final ctrl = Get.find<PaymentController>();
  PaymentAddCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Row(
          children: [
            Icon(
              Icons.credit_card,
              color: kDarkgreyColor,
              size: 20,
            ),
            const SizedBox(width: 10),
            Text(
              'Add Card',
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
          widget: Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: kBlackColor,
          ),
        ),
      ),
      body: Column(
        children: [
          const CardWidget(
            icon: "assets/icons/mastercard.svg",
            expDate: "09/23",
            cardNumber: '1234567812345678',
            cardOwner: 'Malinna',
            cardType: 'Debit Card',
          ),
          Expanded(child: _buildForm()),
          Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
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

  Widget _buildForm() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      child: SingleChildScrollView(
        controller: ScrollController(),
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: ctrl.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'Card Number',
                controller: ctrl.cardNumberCtrl,
                title: 'Card Number',
                textInputType: TextInputType.number,
                validator: (v) {
                  if (v!.isEmpty) {
                    return 'please fill out this field.';
                  } else if (v.length != 16) {
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
                      textInputType: TextInputType.number,
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
              CustomTextFormField(
                hintText: 'Bank Name',
                controller: ctrl.bankNameCtrl,
                title: 'Bank Name',
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
                textInputType: TextInputType.number,
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
