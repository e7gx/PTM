import 'package:flutter/material.dart';
import 'package:first_time/theme/theme.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:first_time/generated/l10n.dart';
import 'package:first_time/screen/introduction_screen.dart';
import 'package:provider/provider.dart';

class PPM extends StatelessWidget {
  const PPM({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) => GetMaterialApp(
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
          themeMode: ThemeProvider.themeMode,
          // locale: Get.deviceLocale,
          home: const OnBoardingPage(),
        ),
      ),
    );
  }
}

bool isArabic() {
  final currentLocale = Intl.getCurrentLocale();
  // print('Current Locale: $currentLocale');
  return currentLocale == 'ar';
}
