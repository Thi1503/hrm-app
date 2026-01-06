import 'package:do_an_application/features/home/view/home_page.dart';
import 'package:do_an_application/features/login/view/login_page.dart';
import 'package:do_an_application/features/main/view/main_page.dart';
import 'package:do_an_application/features/profile/view/profile_page.dart';
import 'package:do_an_application/features/register_leave/register_leave_action/view/register_leave_page.dart';
import 'package:do_an_application/features/register_leave/register_leave_detail/view/register_leave_detail_page.dart';
import 'package:do_an_application/routes/app_route.dart';
import 'package:get/get.dart';

import '../features/splash/splash_page.dart';

abstract class AppRouter {
  const AppRouter._();

  static final routes = <GetPage>[
    GetPage(
      name: AppRoute.routeMain,
      page: () => MainPage(),
    ),
    GetPage(
      name: '/',
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoute.routeLogin,
      page: () => LoginPage(),
    ),
    GetPage(
      name: AppRoute.routeHome,
      page: () => HomePage(),
    ),
    GetPage(
      name: AppRoute.routeProfile,
      page: () => ProfilePage(),
    ),
    GetPage(
      name: AppRoute.routeRegisterLeave,
      page: () => RegisterLeavePage(),
    ),
    GetPage(
      name: AppRoute.routeRegisterLeaveDetail,
      page: () => RegisterLeaveDetailPage(),
    ),
  ];
}
