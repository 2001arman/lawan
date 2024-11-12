import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:lawan/features/presentation/admin/admin_main_binding.dart';
import 'package:lawan/features/presentation/admin/admin_main_ui.dart';
import 'package:lawan/features/presentation/admin/bank/admin_bank_binding.dart';
import 'package:lawan/features/presentation/admin/bank/admin_bank_ui.dart';
import 'package:lawan/features/presentation/auth/auth_binding.dart';
import 'package:lawan/features/presentation/auth/auth_ui.dart';
import 'package:lawan/features/presentation/auth/information/auth_information_binding.dart';
import 'package:lawan/features/presentation/auth/information/auth_information_ui.dart';
import 'package:lawan/features/presentation/auth/information/recovery/auth_recovery_binding.dart';
import 'package:lawan/features/presentation/auth/information/recovery/auth_recovery_ui.dart';
import 'package:lawan/features/presentation/lobby/lobby_binding.dart';
import 'package:lawan/features/presentation/lobby/lobby_ui.dart';
import 'package:lawan/features/presentation/player/club/create-club/create_club_binding.dart';
import 'package:lawan/features/presentation/player/club/create-club/create_club_ui.dart';
import 'package:lawan/features/presentation/player/payment/checkout/controller/checkout_binding.dart';
import 'package:lawan/features/presentation/player/payment/checkout/ui/checkout_ui.dart';
import 'package:lawan/features/presentation/player/payment/payment/add_card/payment_add_card_binding.dart';
import 'package:lawan/features/presentation/player/player_main_binding.dart';
import 'package:lawan/features/presentation/player/payment/payment/payment_binding.dart';
import 'package:lawan/features/presentation/player/payment/payment/add_card/payment_add_card_page.dart';
import 'package:lawan/features/presentation/player/payment/payment/payment_page.dart';
import 'package:lawan/features/presentation/player/player_main_ui.dart';
import 'package:lawan/features/presentation/qr-profile/qr_profile_ui.dart';
import 'package:lawan/features/presentation/referee/referee_binding.dart';
import 'package:lawan/features/presentation/referee/referee_ui.dart';

class AppRoute {
  static const initialRoute = PlayerMainUi.namePath;
  static final routes = [
    GetPage(
      name: AdminMainUi.namePath,
      page: () => AdminMainUi(),
      binding: AdminMainBinding(),
    ),
    GetPage(
      name: PlayerMainUi.namePath,
      page: () => PlayerMainUi(),
      binding: PlayerMainBinding(),
    ),
    GetPage(
      name: CheckoutUi.namePath,
      page: () => CheckoutUi(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: PaymentPage.namePath,
      page: () => PaymentPage(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: PaymentAddCardPage.namePath,
      page: () => PaymentAddCardPage(),
      binding: PaymentAddCardBinding(),
    ),
    GetPage(
      name: LobbyUi.namePath,
      page: () => LobbyUi(),
      binding: LobbyBinding(),
    ),
    GetPage(
      name: AuthUi.namePath,
      page: () => AuthUi(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AuthInformationUi.namePath,
      page: () => AuthInformationUi(),
      binding: AuthInformationBinding(),
    ),
    GetPage(
      name: AuthRecoveryUi.namePath,
      page: () => AuthRecoveryUi(),
      binding: AuthRecoveryBinding(),
    ),
    GetPage(
      name: QrProfileUi.namePath,
      page: () => const QrProfileUi(),
    ),
    GetPage(
      name: CreateClubUi.namePath,
      page: () => CreateClubUi(),
      binding: CreateClubBinding(),
    ),
    GetPage(
      name: RefereeUi.namePath,
      page: () => RefereeUi(),
      binding: RefereeBinding(),
    ),
    GetPage(
      name: AdminBankUi.namePath,
      page: () => AdminBankUi(),
      binding: AdminBankBinding(),
    ),
  ];
}
