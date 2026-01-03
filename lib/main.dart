import 'package:do_an_application/generated/locales.g.dart';
import 'package:do_an_application/routes/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'base/base.dart';
import 'const/all_const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  AppColors.init();

  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStr.appName,
      translationsKeys: AppTranslation.translations,
      locale: const Locale('vi', 'VN'),
      supportedLocales: const [Locale('vi', 'VN')],
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      initialRoute: '/',
      getPages: AppRouter.routes,
      theme: getThemeByAppTheme(false),
      darkTheme: getThemeByAppTheme(),
      themeMode: AppColors.isDarkMode ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
