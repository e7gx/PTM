// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message(
      'About Us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `We are students from Umm Al-Qura University and we aim to assist establishments through our application`
  String get aboutUsDescription {
    return Intl.message(
      'We are students from Umm Al-Qura University and we aim to assist establishments through our application',
      name: 'aboutUsDescription',
      desc: '',
      args: [],
    );
  }

  /// `What We Offer`
  String get whatWeOffer {
    return Intl.message(
      'What We Offer',
      name: 'whatWeOffer',
      desc: '',
      args: [],
    );
  }

  /// `Simplify the management of your establishment and increase its efficiency with an easy interface and advanced tools to improve performance and save a lot of time`
  String get whatWeOfferDescription {
    return Intl.message(
      'Simplify the management of your establishment and increase its efficiency with an easy interface and advanced tools to improve performance and save a lot of time',
      name: 'whatWeOfferDescription',
      desc: '',
      args: [],
    );
  }

  /// `How It Will Affect`
  String get howItWillAffect {
    return Intl.message(
      'How It Will Affect',
      name: 'howItWillAffect',
      desc: '',
      args: [],
    );
  }

  /// `Enhances communication and collaboration, helps in making better decisions, and increases efficiency in managing your establishment better`
  String get howItWillAffectDescription {
    return Intl.message(
      'Enhances communication and collaboration, helps in making better decisions, and increases efficiency in managing your establishment better',
      name: 'howItWillAffectDescription',
      desc: '',
      args: [],
    );
  }

  /// `Facility Inventory`
  String get facilityInventory {
    return Intl.message(
      'Facility Inventory',
      name: 'facilityInventory',
      desc: '',
      args: [],
    );
  }

  /// `Inventorying devices facilitates documenting and tracking your establishment's devices for effective management, better customer service, and easy maintenance`
  String get facilityInventoryDescription {
    return Intl.message(
      'Inventorying devices facilitates documenting and tracking your establishment\'s devices for effective management, better customer service, and easy maintenance',
      name: 'facilityInventoryDescription',
      desc: '',
      args: [],
    );
  }

  /// `Better Communication!`
  String get betterCommunication {
    return Intl.message(
      'Better Communication!',
      name: 'betterCommunication',
      desc: '',
      args: [],
    );
  }

  /// `Communication combines the benefits of effective communication and ease of use to improve understanding and coordinate efforts to increase productivity`
  String get betterCommunicationDescription {
    return Intl.message(
      'Communication combines the benefits of effective communication and ease of use to improve understanding and coordinate efforts to increase productivity',
      name: 'betterCommunicationDescription',
      desc: '',
      args: [],
    );
  }

  /// `Login Now!`
  String get login {
    return Intl.message(
      'Login Now!',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Log in to the application to benefit from good communication and the advantages of managing technical assets`
  String get loginDescription {
    return Intl.message(
      'Log in to the application to benefit from good communication and the advantages of managing technical assets',
      name: 'loginDescription',
      desc: '',
      args: [],
    );
  }

  /// `Let's go for a different experience`
  String get first {
    return Intl.message(
      'Let\'s go for a different experience',
      name: 'first',
      desc: '',
      args: [],
    );
  }

  /// ` Welcome`
  String get welcome {
    return Intl.message(
      ' Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Technical Support IT`
  String get ItOrUser_It {
    return Intl.message(
      'Technical Support IT',
      name: 'ItOrUser_It',
      desc: '',
      args: [],
    );
  }

  /// `beneficiary the service`
  String get ItOrUser_User {
    return Intl.message(
      'beneficiary the service',
      name: 'ItOrUser_User',
      desc: '',
      args: [],
    );
  }

  /// `LogIn`
  String get LoginAppBar {
    return Intl.message(
      'LogIn',
      name: 'LoginAppBar',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get Forgot_password {
    return Intl.message(
      'Forgot Password?',
      name: 'Forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `You Don't Have Accont?`
  String get createAccontQ {
    return Intl.message(
      'You Don\'t Have Accont?',
      name: 'createAccontQ',
      desc: '',
      args: [],
    );
  }

  /// `Creat Now!`
  String get createAccontA {
    return Intl.message(
      'Creat Now!',
      name: 'createAccontA',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in both\n email and password fields`
  String get LoginAlertEmailPassword {
    return Intl.message(
      'Please fill in both\n email and password fields',
      name: 'LoginAlertEmailPassword',
      desc: '',
      args: [],
    );
  }

  /// `Okay`
  String get Okay {
    return Intl.message(
      'Okay',
      name: 'Okay',
      desc: '',
      args: [],
    );
  }

  /// `Please verify data`
  String get validData {
    return Intl.message(
      'Please verify data',
      name: 'validData',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get Loading {
    return Intl.message(
      'Loading...',
      name: 'Loading',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get Skip {
    return Intl.message(
      'Skip',
      name: 'Skip',
      desc: '',
      args: [],
    );
  }

  /// `Problem solution`
  String get problem {
    return Intl.message(
      'Problem solution',
      name: 'problem',
      desc: '',
      args: [],
    );
  }

  /// `Type the problem solution`
  String get problemSolve {
    return Intl.message(
      'Type the problem solution',
      name: 'problemSolve',
      desc: '',
      args: [],
    );
  }

  /// `Admin`
  String get Admin {
    return Intl.message(
      'Admin',
      name: 'Admin',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
