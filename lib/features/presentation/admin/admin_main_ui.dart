// ignore_for_file: deprecated_member_use

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/admin/pages/arena/admin_arena_ui.dart';
import 'package:lawan/features/presentation/admin/pages/arena/controller/admin_arena_logic.dart';
import 'package:lawan/features/presentation/admin/pages/sales/sales_ui.dart';
import 'package:lawan/features/presentation/admin/pages/session/session_ui.dart';
import 'package:lawan/features/presentation/player/ui/player_main_ui.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/bottom_navbar_item.dart';
import 'package:lawan/utility/shared/widgets/buttons/custom_button.dart';
import 'package:lawan/utility/shared/widgets/navigations/custom_appbar_profile.dart';
import 'package:lawan/utility/shared/widgets/navigations/custom_bottom_navbar.dart';

import 'controller/admin_main_logic.dart';

class AdminMainUi extends StatelessWidget {
  static const namePath = '/main_page';
  final logic = Get.find<AdminMainLogic>();
  final arenaLogic = Get.find<AdminArenaLogic>();
  final arenaState = Get.find<AdminArenaLogic>().state;

  AdminMainUi({super.key});

  @override
  Widget build(BuildContext context) {
    Widget customNavbar() {
      return Obx(
        () => Visibility(
          visible: arenaState.isEditing.value,
          replacement: CustomBottomNavbar(
            navbarItemWidget: Obx(
              () => Row(
                children: [
                  BottomNavbarItem(
                    title: 'Session',
                    isActive: logic.selectedNavbarIndex.value == 0,
                    icon: 'assets/icons/session.svg',
                    onTap: () => logic.selectedNavbarIndex.value = 0,
                  ),
                  const SizedBox(width: 4),
                  BottomNavbarItem(
                    title: 'Arena',
                    isActive: logic.selectedNavbarIndex.value == 1,
                    icon: 'assets/icons/arena.svg',
                    onTap: () => logic.selectedNavbarIndex.value = 1,
                  ),
                  const SizedBox(width: 4),
                  BottomNavbarItem(
                    title: 'Sales',
                    isActive: logic.selectedNavbarIndex.value == 2,
                    icon: 'assets/icons/sales.svg',
                    onTap: () => logic.selectedNavbarIndex.value = 2,
                  ),
                ],
              ),
            ),
          ),
          child: Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  kBlackColor.withOpacity(0),
                  kBlackColor.withOpacity(0.3),
                ],
              ),
            ),
          ).blurred(
            blur: 2,
            blurColor: kModalColor,
            colorOpacity: 0,
            overlay: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      isBlack: false,
                      onTap: arenaLogic.updateCancel,
                      title: 'Cancel',
                      backgroundColor: Colors.transparent,
                      textColor: kBlackColor,
                    ),
                  ),
                  SizedBox(width: defaultMargin),
                  Expanded(
                    child: CustomButton(
                      isBlack: true,
                      onTap: arenaLogic.saveUpdate,
                      title: 'Save and Update',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Obx(
              () => Visibility(
                visible: logic.selectedNavbarIndex.value == 2,
                child: Container(
                  width: double.infinity,
                  height: Get.height * 0.4,
                  decoration: BoxDecoration(
                    gradient: backgroundGradient,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: MediaQuery.paddingOf(context).top),
                CustomAppbarProfile(
                  onTap: () => Get.offAndToNamed(PlayerMainUi.namePath),
                ),
                Expanded(
                  child: Obx(() {
                    switch (logic.selectedNavbarIndex.value) {
                      case 0:
                        return SessionUi();
                      case 2:
                        return SalesUi();
                      default:
                        return AdminArenaUi();
                    }
                  }),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: customNavbar(),
            ),
          ],
        ),
      ),
    );
  }
}
