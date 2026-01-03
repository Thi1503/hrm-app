import 'package:do_an_application/features/login/view/login_page.dart';
import 'package:do_an_application/routes/app_route.dart';
import 'package:get/get.dart';

import '../features/splash/splash_page.dart';

abstract class AppRouter {
  const AppRouter._();

  static final routes = <GetPage>[
    GetPage(
      name: '/',
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoute.routeLogin,
      page: () => LoginPage(),
    ),
  ];
}
