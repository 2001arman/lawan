import 'package:get/get.dart';

import '../../domain/session/session_model.dart';
import '../player/controller/player_main_state.dart';

class RefereeState {
  var selectedNavbarIndex = 0.obs;

  List<NavbarItem> listNavbarItem = [
    NavbarItem(name: 'Friendly', icon: 'assets/icons/session.svg'),
    NavbarItem(name: 'Ranked', icon: 'assets/icons/ranked.svg'),
  ];

  var sessionList = <SessionModel>[].obs;
}
