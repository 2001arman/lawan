import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:lawan/features/presentation/admin/admin_main_binding.dart';
import 'package:lawan/features/presentation/admin/admin_main_ui.dart';
import 'package:lawan/features/presentation/admin/bank/admin_bank_binding.dart';
import 'package:lawan/features/presentation/admin/bank/admin_bank_ui.dart';
import 'package:lawan/features/presentation/auth/auth_binding.dart';
import 'package:lawan/features/presentation/auth/auth_ui.dart';
import 'package:lawan/features/presentation/auth/forgot-password/forgot_password_binding.dart';
import 'package:lawan/features/presentation/auth/forgot-password/forgot_password_ui.dart';
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
import 'package:lawan/features/presentation/profile/edit-profile/edit_profile_binding.dart';
import 'package:lawan/features/presentation/profile/edit-profile/edit_profile_ui.dart';
import 'package:lawan/features/presentation/profile/feedback/feedback_binding.dart';
import 'package:lawan/features/presentation/profile/feedback/feedback_ui.dart';
import 'package:lawan/features/presentation/profile/find-friend/find_friend_binding.dart';
import 'package:lawan/features/presentation/profile/find-friend/find_friend_ui.dart';
import 'package:lawan/features/presentation/profile/lineup/lineup_binding.dart';
import 'package:lawan/features/presentation/profile/lineup/lineup_ui.dart';
import 'package:lawan/features/presentation/profile/notifications/notifications_binding.dart';
import 'package:lawan/features/presentation/profile/notifications/notifications_ui.dart';
import 'package:lawan/features/presentation/profile/profile_binding.dart';
import 'package:lawan/features/presentation/profile/profile_ui.dart';
import 'package:lawan/features/presentation/profile/qr-profile/qr_profile_ui.dart';
import 'package:lawan/features/presentation/referee/referee_binding.dart';
import 'package:lawan/features/presentation/referee/referee_ui.dart';
import 'package:lawan/features/presentation/settings/ads/ads_binding.dart';
import 'package:lawan/features/presentation/settings/ads/ads_checkout/ads_checkout_ui.dart';
import 'package:lawan/features/presentation/settings/ads/ads_choose/ads_choose_binding.dart';
import 'package:lawan/features/presentation/settings/ads/ads_choose/ads_choose_ui.dart';
import 'package:lawan/features/presentation/settings/ads/ads_create/ads_create_binding.dart';
import 'package:lawan/features/presentation/settings/ads/ads_create/ads_create_ui.dart';
import 'package:lawan/features/presentation/settings/ads/ads_topup/ads_topup_binding.dart';
import 'package:lawan/features/presentation/settings/ads/ads_topup/ads_topup_ui.dart';
import 'package:lawan/features/presentation/settings/ads/ads_ui.dart';
import 'package:lawan/features/presentation/settings/balance/balance_binding.dart';
import 'package:lawan/features/presentation/settings/balance/balance_ui.dart';
import 'package:lawan/features/presentation/settings/balance/checkout/balance_checkout_binding.dart';
import 'package:lawan/features/presentation/settings/balance/checkout/balance_checkout_ui.dart';
import 'package:lawan/features/presentation/settings/comming-soon/comming_soon_ui.dart';
import 'package:lawan/features/presentation/settings/notification_setting/notification_setting_binding.dart';
import 'package:lawan/features/presentation/settings/notification_setting/notification_setting_ui.dart';
import 'package:lawan/features/presentation/settings/personal_details/personal_details_binding.dart';
import 'package:lawan/features/presentation/settings/personal_details/personal_details_ui.dart';
import 'package:lawan/features/presentation/settings/privacy_and_security/privacy_and_security_binding.dart';
import 'package:lawan/features/presentation/settings/privacy_and_security/privacy_and_security_ui.dart';
import 'package:lawan/features/presentation/settings/settings_binding.dart';
import 'package:lawan/features/presentation/settings/settings_ui.dart';

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
    GetPage(
      name: ForgotPasswordUi.namePath,
      page: () => ForgotPasswordUi(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: FeedbackUi.namePath,
      page: () => FeedbackUi(),
      binding: FeedbackBinding(),
    ),
    GetPage(
      name: ProfileUi.namePath,
      page: () => ProfileUi(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: SettingsUi.namePath,
      page: () => SettingsUi(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: PersonalDetailsUi.namePath,
      page: () => PersonalDetailsUi(),
      binding: PersonalDetailsBinding(),
    ),
    GetPage(
      name: PrivacyAndSecurityUi.namePath,
      page: () => PrivacyAndSecurityUi(),
      binding: PrivacyAndSecurityBinding(),
    ),
    GetPage(
      name: NotificationSettingUi.namePath,
      page: () => NotificationSettingUi(),
      binding: NotificationSettingBinding(),
    ),
    GetPage(
      name: BalanceUi.namePath,
      page: () => BalanceUi(),
      binding: BalanceBinding(),
    ),
    GetPage(
      name: BalanceCheckoutUi.namePath,
      page: () => BalanceCheckoutUi(),
      binding: BalanceCheckoutBinding(),
    ),
    GetPage(
      name: EditProfileUi.namePath,
      page: () => EditProfileUi(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: NotificationsUi.namePath,
      page: () => NotificationsUi(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: FindFriendUi.namePath,
      page: () => FindFriendUi(),
      binding: FindFriendBinding(),
    ),
    GetPage(
      name: AdsUi.namePath,
      page: () => AdsUi(),
      binding: AdsBinding(),
    ),
    GetPage(
      name: AdsTopupUi.namePath,
      page: () => AdsTopupUi(),
      binding: AdsTopupBinding(),
    ),
    GetPage(
      name: AdsChooseUi.namePath,
      page: () => AdsChooseUi(),
      binding: AdsChooseBinding(),
    ),
    GetPage(
      name: AdsCheckoutUi.namePath,
      page: () => const AdsCheckoutUi(),
    ),
    GetPage(
      name: AdsCreateUi.namePath,
      page: () => AdsCreateUi(),
      binding: AdsCreateBinding(),
    ),
    GetPage(
      name: LineupUi.namePath,
      page: () => LineupUi(),
      binding: LineupBinding(),
    ),
    GetPage(
      name: CommingSoonUi.namePath,
      page: () => const CommingSoonUi(),
    ),
  ];
}
