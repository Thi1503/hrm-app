import 'package:dio_log_sds/http_log_list_widget.dart';
import 'package:do_an_application/features/home/view/home_page.dart';
import 'package:do_an_application/features/individual/history_explanation/view/history_explanation_page.dart';
import 'package:do_an_application/features/individual/worksheet/view/worksheet_page.dart';
import 'package:do_an_application/features/login/view/login_page.dart';
import 'package:do_an_application/features/main/view/main_page.dart';
import 'package:do_an_application/features/profile/view/profile_page.dart';
import 'package:do_an_application/features/propose/overtime/overtime_form/view/overtime_form_page.dart';
import 'package:do_an_application/features/propose/overtime/overtime_list/view/overtime_list_page.dart';
import 'package:do_an_application/features/propose/register_leave/register_leave_form/view/register_leave_form_page.dart';
import 'package:do_an_application/features/propose/register_leave/register_leave_list/view/register_leave_page.dart';
import 'package:do_an_application/features/propose/register_remote/register_remote_form/view/register_remote_form_page.dart';
import 'package:do_an_application/features/propose/register_remote/register_remote_list/view/register_remote_list_page.dart';
import 'package:do_an_application/features/propose/timekeeping_explanation/timekeeping_explanation_form/view/timekeeping_explanation_form_page.dart';
import 'package:do_an_application/features/propose/timekeeping_explanation/timekeeping_explanation_list/view/timekeeping_explanation_list_page.dart';
import 'package:do_an_application/features/update_account_info/view/update_account_info_page.dart';
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
      name: AppRoute.routeRegisterLeaveForm,
      page: () => RegisterLeaveFormPage(),
    ),
    GetPage(
      name: AppRoute.routeOverTimeList,
      page: () => OvertimeListPage(),
    ),
    GetPage(
      name: AppRoute.routeOverTimeForm,
      page: () => OvertimeFormPage(),
    ),
    GetPage(
      name: AppRoute.routeRegisterRemoteList,
      page: () => RegisterRemoteListPage(),
    ),
    GetPage(
      name: AppRoute.routeRegisterRemoteForm,
      page: () => RegisterRemoteFormPage(),
    ),
    GetPage(
      name: AppRoute.routeTimekeepingExplanationList,
      page: () => TimekeepingExplanationListPage(),
    ),
    GetPage(
      name: AppRoute.routeTimekeepingExplanationForm,
      page: () => TimekeepingExplanationFormPage(),
    ),
    GetPage(
      name: AppRoute.routeHistoryExplanation,
      page: () => HistoryExplanationPage(),
    ),
    GetPage(
      name: AppRoute.routeUpdateAccountInfo,
      page: () => UpdateAccountInfoPage(),
    ),
    GetPage(
      name: AppRoute.routeWorkSheet,
      page: () => WorksheetPage(),
    ),
    GetPage(
      name: AppRoute.routeDioLog,
      page: () => HttpLogListWidget(),
    ),
  ];
}
