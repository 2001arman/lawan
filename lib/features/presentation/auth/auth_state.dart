import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthState {
  var lobbyActiveAlignment = Alignment.centerLeft.obs;
  var lobbyTabActive = 'Login'.obs;
  List<String> lobbyTabBarTitle = [
    'Login',
    'Sign Up',
  ];

  RxDouble heightContainer = (442.0).obs;

  List<String> listLoginIcon = [
    'assets/icons/mail.svg',
    'assets/icons/Apple.svg',
    'assets/icons/Facebook.svg',
    'assets/icons/Google.svg',
  ];

  var loginPhone = true.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();
}
