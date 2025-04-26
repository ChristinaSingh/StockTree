import 'package:get/get.dart';

import '../modules/about_screen/bindings/about_screen_binding.dart';
import '../modules/about_screen/views/about_screen_view.dart';

import '../modules/forgote_pass_screen/bindings/forgote_pass_screen_binding.dart';
import '../modules/forgote_pass_screen/views/forgote_pass_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/kyc_fill_details_screen/bindings/kyc_fill_details_screen_binding.dart';
import '../modules/kyc_fill_details_screen/views/kyc_fill_details_screen_view.dart';
import '../modules/kyc_otp_verfy/bindings/kyc_otp_verfy_binding.dart';
import '../modules/kyc_otp_verfy/views/kyc_otp_verfy_view.dart';
import '../modules/kyc_screen/bindings/kyc_screen_binding.dart';
import '../modules/kyc_screen/views/kyc_screen_view.dart';
import '../modules/kyc_upload_document/bindings/kyc_upload_document_binding.dart';
import '../modules/kyc_upload_document/views/kyc_upload_document_view.dart';
import '../modules/memberShip_screen/bindings/member_ship_screen_binding.dart';
import '../modules/memberShip_screen/views/member_ship_screen_view.dart';
import '../modules/nav_bar/bindings/nav_bar_binding.dart';
import '../modules/nav_bar/views/nav_bar_view.dart';
import '../modules/notification_screen/bindings/notification_screen_binding.dart';
import '../modules/notification_screen/views/notification_screen_view.dart';
import '../modules/onboarding_screen/bindings/onboarding_screen_binding.dart';
import '../modules/onboarding_screen/views/onboarding_screen_view.dart';
import '../modules/password_reset/bindings/password_reset_binding.dart';
import '../modules/password_reset/views/password_reset_view.dart';
import '../modules/payment_screen/bindings/payment_screen_binding.dart';
import '../modules/payment_screen/views/payment_screen_view.dart';
import '../modules/profile_edit_screen/bindings/profile_edit_screen_binding.dart';
import '../modules/profile_edit_screen/views/profile_edit_screen_view.dart';
import '../modules/profile_screen/bindings/profile_screen_binding.dart';
import '../modules/profile_screen/views/profile_screen_view.dart';
import '../modules/research_detail_screen/bindings/research_detail_screen_binding.dart';
import '../modules/research_detail_screen/views/research_detail_screen_view.dart';
import '../modules/research_screen/bindings/research_screen_binding.dart';
import '../modules/research_screen/views/research_screen_view.dart';
import '../modules/search_screen/bindings/search_screen_binding.dart';
import '../modules/search_screen/views/search_screen_view.dart';
import '../modules/sign-in-screen/bindings/sign_in_screen_binding.dart';
import '../modules/sign-in-screen/views/sign_in_screen_view.dart';
import '../modules/sign-up-screen/bindings/sign_up_screen_binding.dart';
import '../modules/sign-up-screen/views/sign_up_screen_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/stock_details_screen/bindings/stock_details_screen_binding.dart';
import '../modules/stock_details_screen/views/stock_details_screen_view.dart';
import '../modules/success_screen_kyc/bindings/success_screen_kyc_binding.dart';
import '../modules/success_screen_kyc/views/success_screen_kyc_view.dart';
import '../modules/success_screen_memberShip/bindings/success_screen_member_ship_binding.dart';
import '../modules/success_screen_memberShip/views/success_screen_member_ship_view.dart';
import '../modules/support_notification/bindings/support_notification_binding.dart';
import '../modules/support_notification/views/support_notification_view.dart';
import '../modules/support_screen/bindings/support_screen_binding.dart';
import '../modules/support_screen/views/support_screen_view.dart';
import '../modules/trades_detail_screen/bindings/trades_detail_screen_binding.dart';
import '../modules/trades_detail_screen/views/trades_detail_screen_view.dart';
import '../modules/trades_screen/bindings/trades_screen_binding.dart';
import '../modules/trades_screen/views/trades_screen_view.dart';
import '../modules/update_profile_screen/bindings/update_profile_screen_binding.dart';
import '../modules/update_profile_screen/views/update_profile_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING_SCREEN,
      page: () => const OnboardingScreenView(),
      binding: OnboardingScreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN_SCREEN,
      page: () => const SignInScreenView(),
      binding: SignInScreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP_SCREEN,
      page: () => const SignUpScreenView(),
      binding: SignUpScreenBinding(),
    ),
    GetPage(
      name: _Paths.NAV_BAR,
      page: () => const NavBarView(),
      binding: NavBarBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_SCREEN,
      page: () => const SearchScreenView(),
      binding: SearchScreenBinding(),
    ),
    GetPage(
      name: _Paths.TRADES_SCREEN,
      page: () => const TradesScreenView(),
      binding: TradesScreenBinding(),
    ),
    GetPage(
      name: _Paths.RESEARCH_SCREEN,
      page: () => const ResearchScreenView(),
      binding: ResearchScreenBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_SCREEN,
      page: () => const ProfileScreenView(),
      binding: ProfileScreenBinding(),
    ),
    GetPage(
      name: _Paths.STOCK_DETAILS_SCREEN,
      page: () => const StockDetailsScreenView(),
      binding: StockDetailsScreenBinding(),
    ),
    GetPage(
      name: _Paths.RESEARCH_DETAIL_SCREEN,
      page: () => const ResearchDetailScreenView(),
      binding: ResearchDetailScreenBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_PROFILE_SCREEN,
      page: () => const UpdateProfileScreenView(),
      binding: UpdateProfileScreenBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT_SCREEN,
      page: () => const AboutScreenView(),
      binding: AboutScreenBinding(),
    ),
    GetPage(
      name: _Paths.SUPPORT_SCREEN,
      page: () => const SupportScreenView(),
      binding: SupportScreenBinding(),
    ),
    GetPage(
      name: _Paths.SUPPORT_NOTIFICATION,
      page: () => const SupportNotificationView(),
      binding: SupportNotificationBinding(),
    ),
    GetPage(
      name: _Paths.MEMBER_SHIP_SCREEN,
      page: () => const MemberShipScreenView(),
      binding: MemberShipScreenBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_SCREEN,
      page: () => const PaymentScreenView(),
      binding: PaymentScreenBinding(),
    ),
    GetPage(
      name: _Paths.SUCCESS_SCREEN_MEMBER_SHIP,
      page: () => const SuccessScreenMemberShipView(),
      binding: SuccessScreenMemberShipBinding(),
    ),
    GetPage(
      name: _Paths.KYC_SCREEN,
      page: () => const KycScreenView(),
      binding: KycScreenBinding(),
    ),
    GetPage(
      name: _Paths.SUCCESS_SCREEN_KYC,
      page: () => const SuccessScreenKycView(),
      binding: SuccessScreenKycBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION_SCREEN,
      page: () => const NotificationScreenView(),
      binding: NotificationScreenBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_EDIT_SCREEN,
      page: () => const ProfileEditScreenView(),
      binding: ProfileEditScreenBinding(),
    ),
    GetPage(
      name: _Paths.KYC_FILL_DETAILS_SCREEN,
      page: () => const KycFillDetailsScreenView(),
      binding: KycFillDetailsScreenBinding(),
    ),
    GetPage(
      name: _Paths.KYC_UPLOAD_DOCUMENT,
      page: () => const KycUploadDocumentView(),
      binding: KycUploadDocumentBinding(),
    ),
    GetPage(
      name: _Paths.KYC_OTP_VERFY,
      page: () => const KycOtpVerfyView(),
      binding: KycOtpVerfyBinding(),
    ),
    GetPage(
      name: _Paths.FORGOTE_PASS_SCREEN,
      page: () => const ForgotePassScreenView(),
      binding: ForgotePassScreenBinding(),
    ),
    GetPage(
      name: _Paths.PASSWORD_RESET,
      page: () => const PasswordResetView(),
      binding: PasswordResetBinding(),
    ),
    GetPage(
      name: _Paths.TRADES_DETAIL_SCREEN,
      page: () => const TradesDetailScreenView(),
      binding: TradesDetailScreenBinding(),
    ),
  ];
}
