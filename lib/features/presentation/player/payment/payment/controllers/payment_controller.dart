import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/payment/payment/models/bank_model.dart';
import 'package:lawan/features/presentation/player/payment/payment/models/card_model.dart';

class PaymentController extends GetxController {
  TextEditingController cardNumberCtrl = TextEditingController();
  TextEditingController expDateCtrl = TextEditingController();
  TextEditingController cvvCtrl = TextEditingController();
  TextEditingController bankNameCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();
  TextEditingController postCodeCtrl = TextEditingController();

  // key for form
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //List Bank
  List<BankModel> bank = [
    BankModel(bankName: 'Maybank2u', iconBank: 'assets/banks/maybank.png'),
    BankModel(bankName: 'CIMB Clicks', iconBank: 'assets/banks/cimb.png'),
    BankModel(bankName: 'Public Bank', iconBank: 'assets/banks/public.png'),
    BankModel(bankName: 'RHB Now', iconBank: 'assets/banks/rhb.png'),
    BankModel(bankName: 'Ambank', iconBank: 'assets/banks/ambank.png'),
    BankModel(bankName: 'MyBSN', iconBank: 'assets/banks/bsn.png'),
    BankModel(
        bankName: 'Bank Rakyat', iconBank: 'assets/banks/bank_rakyat.png'),
    BankModel(bankName: 'UOB', iconBank: 'assets/banks/uob.png'),
    BankModel(bankName: 'Affin Bank', iconBank: 'assets/banks/affin.png'),
    BankModel(bankName: 'Bank Islam', iconBank: 'assets/banks/bank_islam.png'),
    BankModel(bankName: 'HSBC Online', iconBank: 'assets/banks/hsbc.png'),
    BankModel(
        bankName: 'Standard Chartered Bank', iconBank: 'assets/banks/scb.png'),
    BankModel(
        bankName: 'Kuwait Finance House', iconBank: 'assets/banks/kfh.png'),
    BankModel(bankName: 'Bank Muamalat', iconBank: 'assets/banks/muamalat.png'),
    BankModel(bankName: 'OCBC Online', iconBank: 'assets/banks/ocbc.png'),
    BankModel(
        bankName: 'Alliance Bank (Personal)',
        iconBank: 'assets/banks/alliance.png'),
    BankModel(
        bankName: 'Hong Leong Connect',
        iconBank: 'assets/banks/hong_leong.png'),
    BankModel(bankName: 'Agrobank', iconBank: 'assets/banks/agro.png'),
  ];

  var listCard = <CardModel>[].obs;
  var listBank = <BankModel>[].obs;
  var idx = 0.obs;

  void initPage() {
    listBank.addAll(bank);
    listBank.refresh();
  }

  bool _doValidate() {
    if (formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  void addCard() {
    if (_doValidate()) {
      listCard.add(
        CardModel(
          cardNumber: cardNumberCtrl.text,
          bankName: bankNameCtrl.text,
          ownerName: nameCtrl.text,
          expDate: expDateCtrl.text,
          cvv: cvvCtrl.text,
          address: addressCtrl.text,
          postCode: postCodeCtrl.text,
        ),
      );
      log('Success');
      clearData();
      Get.back();
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
}
