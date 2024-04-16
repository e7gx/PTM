import 'package:first_time/generated/l10n.dart';
import 'package:first_time/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:first_time/screen/introduction_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

class PPM extends StatelessWidget {
  const PPM({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // locale: const Locale('en'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      // locale: Get.deviceLocale,
      home: const OnBoardingPage(),
    );
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
