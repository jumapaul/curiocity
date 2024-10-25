import 'package:get/get.dart';

import '../modules/auth/login_screen/bindings/login_screen_binding.dart';
import '../modules/auth/login_screen/views/login_screen_view.dart';
import '../modules/auth/sign_up_screen/bindings/sign_up_screen_binding.dart';
import '../modules/auth/sign_up_screen/views/sign_up_screen_view.dart';
import '../modules/auth/verify_email_screen/bindings/verify_email_screen_binding.dart';
import '../modules/auth/verify_email_screen/views/verify_email_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/on_board_screen/bindings/on_board_screen_binding.dart';
import '../modules/on_board_screen/views/on_board_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ON_BOARD_SCREEN;

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
  ];
}
