import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/payment/payment/models/card_model.dart';

class PaymentAddCardLogic extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController cardNumberCtrl = TextEditingController();
  TextEditingController expDateCtrl = TextEditingController();
  TextEditingController cvvCtrl = TextEditingController();
  TextEditingController bankNameCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();
  TextEditingController postCodeCtrl = TextEditingController();
  bool isAdmin = false;
  late void Function(CardModel data) functionLogic;

  @override
  onInit() {
    isAdmin = Get.arguments[0];
    functionLogic = Get.arguments[1];
    super.onInit();
  }

  bool _doValidate() {
    if (formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  void clearData() {
    cardNumberCtrl.clear();
    bankNameCtrl.clear();
    nameCtrl.clear();
    expDateCtrl.clear();
    cvvCtrl.clear();
    addressCtrl.clear();
    postCodeCtrl.clear();
  }

  void addCard() {
    if (_doValidate()) {
      final card = CardModel(
        cardNumber: cardNumberCtrl.text,
        bankName: bankNameCtrl.text,
        ownerName: nameCtrl.text,
        expDate: expDateCtrl.text,
        cvv: cvvCtrl.text,
        address: addressCtrl.text,
        postCode: postCodeCtrl.text,
      );
      functionLogic(card);
      clearData();
    }
  }

  @override
  void dispose() {
    clearData();
    super.dispose();
  }
}
