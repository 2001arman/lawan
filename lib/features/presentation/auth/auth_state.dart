import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthState {
  var lobbyActiveAlignment = Alignment.centerLeft.obs;
  var lobbyTabActive = 'Login'.obs;
  List<String> lobbyTabBarTitle = [
    'Login',
    'Sign Up',
  ];
}