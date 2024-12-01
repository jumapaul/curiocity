import 'package:get/get.dart';

import '../data/providers/shared_preferences.dart';
import '../modules/auth/login_screen/bindings/login_screen_binding.dart';
import '../modules/auth/login_screen/views/login_screen_view.dart';
import '../modules/auth/reset_email_screen/bindings/reset_email_screen_binding.dart';
import '../modules/auth/reset_email_screen/views/reset_email_screen_view.dart';
import '../modules/auth/reset_otp_screen/bindings/reset_otp_screen_binding.dart';
import '../modules/auth/reset_otp_screen/views/reset_otp_screen_view.dart';
import '../modules/auth/reset_password/bindings/reset_password_binding.dart';
import '../modules/auth/reset_password/views/reset_password_view.dart';
import '../modules/auth/sign_up_screen/bindings/sign_up_screen_binding.dart';
import '../modules/auth/sign_up_screen/views/sign_up_screen_view.dart';
import '../modules/auth/verify_email_screen/bindings/verify_email_screen_binding.dart';
import '../modules/auth/verify_email_screen/views/verify_email_screen_view.dart';
import '../modules/create_post/bindings/create_post_binding.dart';
import '../modules/create_post/views/create_post_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/on_board_screen/bindings/on_board_screen_binding.dart';
import '../modules/on_board_screen/views/on_board_screen_view.dart';
import '../modules/preferences/preference_notification/bindings/preference_notification_binding.dart';
import '../modules/preferences/preference_notification/views/preference_notification_view.dart';
import '../modules/preferences/user_category_preference/bindings/user_category_preference_binding.dart';
import '../modules/preferences/user_category_preference/views/user_category_preference_view.dart';
import '../modules/preferences/user_topic_preference/bindings/user_topic_preference_binding.dart';
import '../modules/preferences/user_topic_preference/views/user_topic_preference_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/setting_up_profile/bindings/setting_up_profile_binding.dart';
import '../modules/setting_up_profile/views/setting_up_profile_view.dart';
import '../modules/success/bindings/success_binding.dart';
import '../modules/success/views/success_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const on_board = Routes.ON_BOARD_SCREEN;
  static const login = Routes.LOGIN_SCREEN;
  static const home = Routes.HOME;

  static Future<String> getInitialRoute() async {
    final isOnBoarded = await SharedPreferenceHelper.getOnBoardState();

    return isOnBoarded ? login : on_board;
    // return home;
  }

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ON_BOARD_SCREEN,
      page: () => const OnBoardScreenView(),
      binding: OnBoardScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => const LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP_SCREEN,
      page: () => const SignUpScreenView(),
      binding: SignUpScreenBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_EMAIL_SCREEN,
      page: () => const VerifyEmailScreenView(),
      binding: VerifyEmailScreenBinding(),
    ),
    GetPage(
      name: _Paths.USER_CATEGORY_PREFERENCE,
      page: () => const UserCategoryPreferenceView(),
      binding: UserCategoryPreferenceBinding(),
    ),
    GetPage(
      name: _Paths.USER_TOPIC_PREFERENCE,
      page: () => const UserTopicPreferenceView(),
      binding: UserTopicPreferenceBinding(),
    ),
    GetPage(
      name: _Paths.SETTING_UP_PROFILE,
      page: () => const SettingUpProfileView(),
      binding: SettingUpProfileBinding(),
    ),
    GetPage(
      name: _Paths.PREFERENCE_NOTIFICATION,
      page: () => const PreferenceNotificationView(),
      binding: PreferenceNotificationBinding(),
    ),
    GetPage(
      name: _Paths.RESET_OTP_SCREEN,
      page: () => const ResetOtpScreenView(),
      binding: ResetOtpScreenBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.RESET_EMAIL_SCREEN,
      page: () => const ResetEmailScreenView(),
      binding: ResetEmailScreenBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_POST,
      page: () => const CreatePostView(),
      binding: CreatePostBinding(),
    ),
    GetPage(
      name: _Paths.SUCCESS,
      page: () => const SuccessView(),
      binding: SuccessBinding(),
    ),
  ];
}
