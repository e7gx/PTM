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

  /// `Search for a page`
  String get home_admin_SearchForpage {
    return Intl.message(
      'Search for a page',
      name: 'home_admin_SearchForpage',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'home_admin.MainData' key

  // skipped getter for the 'home_admin.ReportsReceived' key

  // skipped getter for the 'home_admin.UserReports' key

  // skipped getter for the 'home_admin.SupportReports' key

  // skipped getter for the 'home_admin.NumOfRegAssets' key

  // skipped getter for the 'home_admin.CollegesData' key

  // skipped getter for the 'home_admin.NumOfWeeklyReports' key

  // skipped getter for the 'home_admin.TotalNumOfReports' key

  // skipped getter for the 'home_admin.CollegeOfAppliedSciences' key

  // skipped getter for the 'home_admin.DataReview' key

  // skipped getter for the 'home_admin.CollegeOfComputer' key

  // skipped getter for the 'home_admin.CollegeOfBusinessManagement' key

  // skipped getter for the 'home_page_admin.HomePage' key

  // skipped getter for the 'home_page_admin.PTMtoMake' key

  // skipped getter for the 'home_page_admin.PersonalData' key

  // skipped getter for the 'home_page_admin.InformationPanel' key

  // skipped getter for the 'home_page_admin.Maintenance' key

  // skipped getter for the 'home_page_admin.AddAssets' key

  // skipped getter for the 'home_page_admin.Settings' key

  // skipped getter for the 'home_page_admin.SignOut' key

  // skipped getter for the 'home_page_admin.Main' key

  // skipped getter for the 'home_page_admin.Users' key

  // skipped getter for the 'home_page_admin.SupportStaff' key

  // skipped getter for the 'home_page_admin.Reports' key

  // skipped getter for the 'home_page_and_bar.PersonalInformation' key

  // skipped getter for the 'home_page_and_bar.CompletedMaintenance' key

  // skipped getter for the 'home_page_and_bar.ReceivedMaintenance' key

  // skipped getter for the 'home_page_and_bar.ReportSent' key

  // skipped getter for the 'home_page_and_bar.TheWaysToContact' key

  // skipped getter for the 'dashboard.ProblemSloutionReport' key

  // skipped getter for the 'dashboard.ClosedReport' key

  // skipped getter for the 'dashboard.OpenReport' key

  // skipped getter for the 'dashboard.NumOfReport' key

  // skipped getter for the 'dashboard.ReceivedReport' key

  // skipped getter for the 'dashboard.SupportStaff' key

  // skipped getter for the 'dashboard.NumOfUser' key

  // skipped getter for the 'dashboard.NumOfAssets' key

  // skipped getter for the 'dashboard.UserReport' key

  // skipped getter for the 'it_all_reports.NoReports' key

  // skipped getter for the 'it_all_reports.Date' key

  // skipped getter for the 'it_all_reports.NumOReports' key

  // skipped getter for the 'it_all_reports.Undefined' key

  // skipped getter for the 'it_all_reports.Location' key

  // skipped getter for the 'it_all_reports.ShowReports' key

  // skipped getter for the 'it_report.ReportDetails' key

  // skipped getter for the 'it_report.ItReports' key

  // skipped getter for the 'it_report.NoReportDetails' key

  // skipped getter for the 'it_report.NumOfReport,' key

  // skipped getter for the 'it_report.NumOfDevice' key

  // skipped getter for the 'it_report.Device' key

  // skipped getter for the 'it_report.NoDescriptionAvailable' key

  // skipped getter for the 'it_report.DateOfReport' key

  // skipped getter for the 'it_report.Location' key

  // skipped getter for the 'it_report.DescribeTheProblem' key

  // skipped getter for the 'it_report.ProblemSolution' key

  // skipped getter for the 'it_report.StartDateOfRrport' key

  // skipped getter for the 'it_report.EndDateOfReport' key

  // skipped getter for the 'it_report.Building' key

  // skipped getter for the 'it_report.ContactInformation' key

  // skipped getter for the 'show_reports_user_ditils.DetailsOfReport' key

  // skipped getter for the 'show_reports_user_ditils.UserReport' key

  // skipped getter for the 'show_reports_user_ditils.NoReports' key

  // skipped getter for the 'show_reports_user_ditils.Date' key

  // skipped getter for the 'show_reports_user_ditils.ReportNum' key

  // skipped getter for the 'show_reports_user_ditils.NumOfDevice' key

  // skipped getter for the 'show_reports_user_ditils.NoDeviceNum' key

  // skipped getter for the 'show_reports_user_ditils.Device' key

  // skipped getter for the 'show_reports_user_ditils.Location' key

  // skipped getter for the 'show_reports_user_ditils.NoLocation' key

  // skipped getter for the 'show_reports_user_ditils.DescriptionOfTheProblem' key

  // skipped getter for the 'show_reports_user_ditils.NoDescription' key

  // skipped getter for the 'show_reports_user_ditils.Problem' key

  // skipped getter for the 'show_reports_user_ditils.DeleteTheReport' key

  // skipped getter for the 'show_reports_user_ditils.SureOFDelete' key

  // skipped getter for the 'show_reports_user_ditils.Done' key

  // skipped getter for the 'show_reports_user_ditils.TheRepotHasBeenDeleted' key

  // skipped getter for the 'show_reports_user_ditils.Undo' key

  // skipped getter for the 'show_reports_user_ditils.building' key

  // skipped getter for the 'show_reports_user_ditils.ContactInformation' key

  // skipped getter for the 'user_reports.UserReport' key

  // skipped getter for the 'user_reports.Erorr' key

  // skipped getter for the 'user_reports.NoReport' key

  // skipped getter for the 'user_reports.Date' key

  // skipped getter for the 'user_reports.ReportNumber' key

  // skipped getter for the 'user_reports.Location' key

  // skipped getter for the 'user_reports.ShowReport' key

  // skipped getter for the 'user_reports.Undefined' key

  // skipped getter for the 'admin_data.FristName' key

  // skipped getter for the 'admin_data.LastName' key

  // skipped getter for the 'admin_data.Email' key

  // skipped getter for the 'admin_data.Opss' key

  // skipped getter for the 'admin_data.UserData' key

  // skipped getter for the 'admin_data.Admin' key

  // skipped getter for the 'admin_data.Username' key

  // skipped getter for the 'admin_data.JobPosition' key

  // skipped getter for the 'admin_settings.Settings' key

  // skipped getter for the 'admin_settings.ChangeTheme' key

  // skipped getter for the 'admin_settings.Notifications' key

  // skipped getter for the 'admin_settings.EditPassword' key

  // skipped getter for the 'admin_settings.language' key

  // skipped getter for the 'it_user_data.EmployeeData' key

  // skipped getter for the 'it_user_data.UserIt' key

  // skipped getter for the 'it_user_data.NoReport' key

  // skipped getter for the 'it_user_data.NumberOfEmployee' key

  // skipped getter for the 'it_user_data.FirtsName' key

  // skipped getter for the 'it_user_data.LastName' key

  // skipped getter for the 'it_user_data.NoDescription' key

  // skipped getter for the 'it_user_data.EmailOfEmployee' key

  // skipped getter for the 'it_user_data.SureOFDeleteTheEmployee' key

  // skipped getter for the 'it_user_data.DoneDelete' key

  // skipped getter for the 'it_user_data.Done' key

  // skipped getter for the 'it_user_data.Undo' key

  // skipped getter for the 'it_user_data.DeleteEmployee' key

  // skipped getter for the 'it_user_data.SomeProblem' key

  // skipped getter for the 'it_user.Erorr' key

  // skipped getter for the 'it_user.NoReport' key

  // skipped getter for the 'it_user.ItSupportEmployee' key

  // skipped getter for the 'it_user.FirstName' key

  // skipped getter for the 'it_user.LastName' key

  // skipped getter for the 'it_user.Undefined' key

  // skipped getter for the 'it_user.ShowData' key

  // skipped getter for the 'normal_user_data.BeneficiaryData' key

  // skipped getter for the 'normal_user_data.NoReport' key

  // skipped getter for the 'normal_user_data.BeneficiaryNumber' key

  // skipped getter for the 'normal_user_data.BeneficiaryEmail' key

  // skipped getter for the 'normal_user_data.LastName' key

  // skipped getter for the 'normal_user_data.FirstName' key

  // skipped getter for the 'normal_user_data.NoDescription' key

  // skipped getter for the 'normal_user_data.Email' key

  // skipped getter for the 'normal_user_data.SureDeleteBeneficiary' key

  // skipped getter for the 'normal_user_data.DoneDeleteBeneficiary' key

  // skipped getter for the 'normal_user_data.Done' key

  // skipped getter for the 'normal_user_data.Undo' key

  // skipped getter for the 'normal_user_data.DeleteTheBeneficiary' key

  // skipped getter for the 'normal_user_data.SomeProblem' key

  // skipped getter for the 'user_normal.Erorr' key

  // skipped getter for the 'user_normal.NoReport' key

  // skipped getter for the 'user_normal.Beneficiary' key

  // skipped getter for the 'user_normal.Undefined' key

  // skipped getter for the 'user_normal.LastName' key

  // skipped getter for the 'user_normal.FirstName' key

  // skipped getter for the 'user_normal.ShowData' key

  // skipped getter for the 'login_page_it.Login' key

  // skipped getter for the 'login_page_it.Email' key

  // skipped getter for the 'login_page_it.Password' key

  // skipped getter for the 'login_page_it.ForgetPassword' key

  // skipped getter for the 'login_page_it.PleaseFill' key

  // skipped getter for the 'login_page_it.agree' key

  // skipped getter for the 'login_page_it.PleaseWait' key

  // skipped getter for the 'login_page_it.inCorrectTryAgain' key

  // skipped getter for the 'login_page_it.UserNotFound' key

  // skipped getter for the 'login_page_it.IncorrectPassword' key

  // skipped getter for the 'login_page_it.CheckAndTry' key

  // skipped getter for the 'login_page_it.NewAccount' key

  // skipped getter for the 'login_page_it.Admin' key

  // skipped getter for the 'rest_password.SentLink' key

  // skipped getter for the 'rest_password.agree' key

  // skipped getter for the 'rest_password.MustBeVerified' key

  // skipped getter for the 'rest_password.PasswordReset' key

  // skipped getter for the 'rest_password.changePasswordAndSentEmail' key

  // skipped getter for the 'rest_password.Email' key

  // skipped getter for the 'rest_password.Verify' key

  /// `Please Enter A Valid Email`
  String get signup_pageValidEmail {
    return Intl.message(
      'Please Enter A Valid Email',
      name: 'signup_pageValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `The Confirmed Password Must Be Match With Password`
  String get signup_pageConfirmedMatch {
    return Intl.message(
      'The Confirmed Password Must Be Match With Password',
      name: 'signup_pageConfirmedMatch',
      desc: '',
      args: [],
    );
  }

  /// `Please Wait...`
  String get signup_pagePleaseWait {
    return Intl.message(
      'Please Wait...',
      name: 'signup_pagePleaseWait',
      desc: '',
      args: [],
    );
  }

  /// `An Erorr Occurred, Please Try Again`
  String get signup_pageErorrTryAgain {
    return Intl.message(
      'An Erorr Occurred, Please Try Again',
      name: 'signup_pageErorrTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Weak Password`
  String get signup_pageWeakPassword {
    return Intl.message(
      'Weak Password',
      name: 'signup_pageWeakPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email Already in Use`
  String get signup_pageEmailAlreadyUsed {
    return Intl.message(
      'Email Already in Use',
      name: 'signup_pageEmailAlreadyUsed',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get signup_pageFirstNAme {
    return Intl.message(
      'First Name',
      name: 'signup_pageFirstNAme',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get signup_pageLastName {
    return Intl.message(
      'Last Name',
      name: 'signup_pageLastName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get signup_pageEmail {
    return Intl.message(
      'Email',
      name: 'signup_pageEmail',
      desc: '',
      args: [],
    );
  }

  /// `User ID`
  String get signup_pageUID {
    return Intl.message(
      'User ID',
      name: 'signup_pageUID',
      desc: '',
      args: [],
    );
  }

  /// `Erorr`
  String get signup_pageErorr {
    return Intl.message(
      'Erorr',
      name: 'signup_pageErorr',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get signup_pageOk {
    return Intl.message(
      'OK',
      name: 'signup_pageOk',
      desc: '',
      args: [],
    );
  }

  /// `Sigup For New Account`
  String get signup_pageSignUpNewAccount {
    return Intl.message(
      'Sigup For New Account',
      name: 'signup_pageSignUpNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get signup_pagePassword {
    return Intl.message(
      'Password',
      name: 'signup_pagePassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirme Password`
  String get signup_pageConfirmPassword {
    return Intl.message(
      'Confirme Password',
      name: 'signup_pageConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Registration`
  String get signup_pageNewRegistration {
    return Intl.message(
      'New Registration',
      name: 'signup_pageNewRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Please Fill Out All Fields `
  String get signup_pageFillFields {
    return Intl.message(
      'Please Fill Out All Fields ',
      name: 'signup_pageFillFields',
      desc: '',
      args: [],
    );
  }

  /// `My Smart Assistant`
  String get ai_chat_pageSmartAssistant {
    return Intl.message(
      'My Smart Assistant',
      name: 'ai_chat_pageSmartAssistant',
      desc: '',
      args: [],
    );
  }

  /// `Please Describe The Problem, And I Will Try To Help You \n Hello, I'am Your Smart Assistant`
  String get ai_chat_pageDescribeProblem {
    return Intl.message(
      'Please Describe The Problem, And I Will Try To Help You \n Hello, I`am Your Smart Assistant',
      name: 'ai_chat_pageDescribeProblem',
      desc: '',
      args: [],
    );
  }

  /// `Hello...`
  String get ai_chat_pageHello {
    return Intl.message(
      'Hello...',
      name: 'ai_chat_pageHello',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get network_controllerNoInternet {
    return Intl.message(
      'No Internet Connection',
      name: 'network_controllerNoInternet',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'home.SearchForPage' key

  // skipped getter for the 'home.TodayReports' key

  // skipped getter for the 'home.MyMaintenanceToday' key

  // skipped getter for the 'home.Reports' key

  // skipped getter for the 'home.Erorr' key

  // skipped getter for the 'home.NoReports' key

  // skipped getter for the 'home.UnknownDevice' key

  // skipped getter for the 'home.UnknownProblem' key

  // skipped getter for the 'dashboard.ProblemSolutionReport' key

  // skipped getter for the 'dashboard.ReportsReceived' key

  // skipped getter for the 'dashboard.ReportsClosed' key

  // skipped getter for the 'dashboard.AverageSolutionTime' key

  // skipped getter for the 'dashboard.EmployeeEvaluation' key

  // skipped getter for the 'dashboard.CompletedReports' key

  // skipped getter for the 'dashboard.MyReviews' key

  // skipped getter for the 'navbar_drawer.HomePage' key

  // skipped getter for the 'navbar_drawer.PTM2Make' key

  // skipped getter for the 'navbar_drawer.AddAssets' key

  // skipped getter for the 'navbar_drawer.PersonalInfo' key

  // skipped getter for the 'navbar_drawer.GeneralPreformsnceIndicator' key

  // skipped getter for the 'navbar_drawer.ApplicationSettings' key

  // skipped getter for the 'navbar_drawer.Reports' key

  // skipped getter for the 'navbar_drawer.SignOut' key

  // skipped getter for the 'navbar_drawer.Main' key

  // skipped getter for the 'navbar_drawer.QrCode' key

  // skipped getter for the 'navbar_drawer.Devices' key

  // skipped getter for the 'navbar_drawer.Maintenance' key

  // skipped getter for the 'navbar_drawer.Rrport' key

  // skipped getter for the 'business_collage.DeviceInfo' key

  // skipped getter for the 'business_collage.CollegeOfBusiness' key

  // skipped getter for the 'business_collage.Erorr' key

  // skipped getter for the 'business_collage.DeviceBrand' key

  // skipped getter for the 'business_collage.DeviceLocation' key

  // skipped getter for the 'business_collage.DeviceHardDisk' key

  // skipped getter for the 'business_collage.DeviceCPU' key

  // skipped getter for the 'business_collage.ministrynumber' key

  // skipped getter for the 'business_collage.serialnumber' key

  // skipped getter for the 'business_collage.selectedoption' key

  // skipped getter for the 'business_collage.macddress' key

  // skipped getter for the 'business_collage.NoDataAvailable' key

  // skipped getter for the 'business_collage.MainSite' key

  // skipped getter for the 'business_collage.SubSite' key

  // skipped getter for the 'business_collage.DeviceModel' key

  // skipped getter for the 'business_collage.ProcessorType' key

  // skipped getter for the 'business_collage.HardDisk' key

  // skipped getter for the 'business_collage.ShowLocation' key

  // skipped getter for the 'business_collage.CollegeOfComputer' key

  // skipped getter for the 'business_collage.CollegeOfIslamic' key

  // skipped getter for the 'business_collage.CollegeOfSciences' key

  // skipped getter for the 'Device_Location.DisplayCollegAndDevice' key

  // skipped getter for the 'Device_Location.ShowData' key

  // skipped getter for the 'Device_Location.CollegeOfComputer' key

  // skipped getter for the 'Device_Location.CollageOfBusiness' key

  // skipped getter for the 'Device_Location.CollageOfIslamic' key

  // skipped getter for the 'Device_Location.CollageOfAppliedSciences' key

  // skipped getter for the 'pdf.Open' key

  // skipped getter for the 'qrcode_sccaner.QR' key

  // skipped getter for the 'qrcode_sccaner.DeviceInfo' key

  // skipped getter for the 'qrcode_sccaner.Ignore' key

  // skipped getter for the 'password_assets.VerificationPage' key

  // skipped getter for the 'password_assets.PasswordAccessWidget' key

  // skipped getter for the 'password_assets.IncorrectPassword' key

  // skipped getter for the 'password_assets.Agree' key

  // skipped getter for the 'password_assets.Verify' key

  // skipped getter for the 'register_assets.CollegeOfComputer' key

  // skipped getter for the 'register_assets.CollageOfBusiness' key

  // skipped getter for the 'register_assets.CollageOfIslamic' key

  // skipped getter for the 'register_assets.CollageOfAppliedSciences' key

  // skipped getter for the 'register_assets.RegisterNewDevice' key

  // skipped getter for the 'register_assets.BrandName' key

  // skipped getter for the 'register_assets.BrandNameEnter' key

  // skipped getter for the 'register_assets.OS' key

  // skipped getter for the 'register_assets.EnterOs' key

  // skipped getter for the 'register_assets.Processor' key

  // skipped getter for the 'register_assets.ProcessorName' key

  // skipped getter for the 'register_assets.HardDisk' key

  // skipped getter for the 'register_assets.HardDiskNAme' key

  // skipped getter for the 'register_assets.MacAddress' key

  // skipped getter for the 'register_assets.EnterMAcAddress' key

  // skipped getter for the 'register_assets.MinisterialNumber' key

  // skipped getter for the 'register_assets.EnterMinisterialNumber' key

  // skipped getter for the 'register_assets.SerialNumber' key

  // skipped getter for the 'register_assets.EnterSerialNumber' key

  // skipped getter for the 'register_assets.Sent' key

  // skipped getter for the 'register_assets.AbleToSumbitReport' key

  // skipped getter for the 'register_assets.Ok' key

  // skipped getter for the 'register_assets.Ty4Cooperation' key

  // skipped getter for the 'account_setting.Settings' key

  // skipped getter for the 'account_setting.Notifications' key

  // skipped getter for the 'account_setting.EditPassword' key

  // skipped getter for the 'account_setting.Language' key

  // skipped getter for the 'account_setting.ChangeTheme' key

  // skipped getter for the 'account_setting.WhoAreWe' key

  // skipped getter for the 'it_settings.UserData' key

  // skipped getter for the 'it_settings.UserName' key

  // skipped getter for the 'it_settings.JobNumber' key

  // skipped getter for the 'it_settings.CompanyName' key

  // skipped getter for the 'it_settings.Email' key

  // skipped getter for the 'it_settings.Jobpostion' key

  // skipped getter for the 'it_settings.TechnicalSupportEmployee' key

  // skipped getter for the 'it_settings.Employee' key

  // skipped getter for the 'it_settings.FirstName' key

  // skipped getter for the 'it_settings.LastName' key

  // skipped getter for the 'it_settings.Opss' key

  // skipped getter for the 'chat_main.ErorrInService' key

  // skipped getter for the 'chat_main.IamSmartAssistant' key

  // skipped getter for the 'chat_main.Hello' key

  // skipped getter for the 'qr_sacnnerpage.DeviceInfo' key

  // skipped getter for the 'qr_sacnnerpage.SumbitReport' key

  // skipped getter for the 'qr_sacnnerpage.Ignore' key

  // skipped getter for the 'home_page_and_bar.HomePage' key

  // skipped getter for the 'home_page_and_bar.PTM2Make' key

  // skipped getter for the 'home_page_and_bar.PersonalInfo' key

  // skipped getter for the 'home_page_and_bar.Maintenance' key

  // skipped getter for the 'home_page_and_bar.WayContact' key

  // skipped getter for the 'home_page_and_bar.Settings' key

  // skipped getter for the 'home_page_and_bar.SignOut' key

  // skipped getter for the 'home_page_and_bar.Reports' key

  // skipped getter for the 'home_page_and_bar.Chat' key

  // skipped getter for the 'home_page_and_bar.QrScanner' key

  // skipped getter for the 'how_are_we.WayContact' key

  // skipped getter for the 'how_are_we.Email' key

  // skipped getter for the 'how_are_we.CintactWithUs' key

  // skipped getter for the 'how_are_we.Twitter' key

  // skipped getter for the 'user_data.UserData' key

  // skipped getter for the 'user_data.UserName' key

  // skipped getter for the 'user_data.Email' key

  // skipped getter for the 'user_data.Beneficiary' key

  // skipped getter for the 'user_data.JobPostion' key

  // skipped getter for the 'user_report_details_page.FillFields' key

  // skipped getter for the 'user_report_details_page.Ok' key

  // skipped getter for the 'user_report_details_page.solutionProvided' key

  // skipped getter for the 'user_report_details_page.ReportSent' key

  // skipped getter for the 'user_report_details_page.SubmitReport' key

  // skipped getter for the 'user_report_details_page.FillWithCorrectInfo' key

  // skipped getter for the 'user_report_details_page.Location' key

  // skipped getter for the 'user_report_details_page.EnterLabName' key

  // skipped getter for the 'user_report_details_page.EntreDeviceNumber' key

  // skipped getter for the 'user_report_details_page.DeviceNumber' key

  // skipped getter for the 'user_report_details_page.EnterDecriptionOfProblem' key

  // skipped getter for the 'user_report_details_page.DescriptionOfProblem' key

  // skipped getter for the 'user_report_details_page.Sent' key

  // skipped getter for the 'user_report_first_page.ToHelpYouQuickly' key

  // skipped getter for the 'user_report_first_page.SubmitReport' key

  // skipped getter for the 'setting_page.Settings' key

  // skipped getter for the 'setting_page.Notifications' key

  // skipped getter for the 'setting_page.EditPassword' key

  // skipped getter for the 'setting_page.Language' key

  // skipped getter for the 'setting_page.ChangeTheme' key

  // skipped getter for the 'it_display_report_page.ReportDetails' key

  // skipped getter for the 'it_display_report_page.Erorr' key

  // skipped getter for the 'it_display_report_page.NoReportDetails' key

  // skipped getter for the 'it_display_report_page.ReportNum' key

  // skipped getter for the 'it_display_report_page.DeviceNum' key

  // skipped getter for the 'it_display_report_page.Device' key

  // skipped getter for the 'it_display_report_page.NoDescription' key

  // skipped getter for the 'it_display_report_page.StartDateOfReport' key

  // skipped getter for the 'it_display_report_page.EndDateOfReport' key

  // skipped getter for the 'it_display_report_page.Date' key

  // skipped getter for the 'it_display_report_page.Location' key

  // skipped getter for the 'it_display_report_page.NoLocation' key

  // skipped getter for the 'it_display_report_page.LabLocation' key

  // skipped getter for the 'it_display_report_page.ConatctInformation' key

  // skipped getter for the 'it_display_report_page.DescriptionOfTheProblem' key

  // skipped getter for the 'it_display_report_page.ProblemSolution' key

  // skipped getter for the 'it_display_reports_page.ProblemSolutionReports' key

  // skipped getter for the 'it_display_reports_page.Erorr' key

  // skipped getter for the 'it_display_reports_page.NoReports' key

  // skipped getter for the 'it_display_reports_page.Date' key

  // skipped getter for the 'it_display_reports_page.Location' key

  // skipped getter for the 'it_display_reports_page.Undefined' key

  // skipped getter for the 'it_display_reports_page.ShowReport' key

  // skipped getter for the 'it_display_report_received.ReportDetails' key

  // skipped getter for the 'it_display_report_received.NoReportDetails' key

  // skipped getter for the 'it_display_report_received.ReportNum' key

  // skipped getter for the 'it_display_report_received.NoLocation' key

  // skipped getter for the 'it_display_report_received.Date' key

  // skipped getter for the 'it_display_report_received.DeviceNumber' key

  // skipped getter for the 'it_display_report_received.Location' key

  // skipped getter for the 'it_display_report_received.NoDeviceNumber' key

  // skipped getter for the 'it_display_report_received.LabLocation' key

  // skipped getter for the 'it_display_report_received.ContactInformation' key

  // skipped getter for the 'it_display_report_received.DescriptionOfTheProblem' key

  // skipped getter for the 'it_display_report_received.NoDescription' key

  // skipped getter for the 'it_display_report_received.AttachDetailsOfSolutionProblem' key

  // skipped getter for the 'it_display_report_received.YouMustWriteReport' key

  // skipped getter for the 'it_display_report_received.Thanks4YouCooperation' key

  // skipped getter for the 'it_display_report_received.Thanks' key

  // skipped getter for the 'it_display_report_received.Agree' key

  // skipped getter for the 'it_display_report_received.FinishTheOrder' key

  // skipped getter for the 'it_display_report_received.ReturnTheReport' key

  // skipped getter for the 'it_display_report_received.HereYouReturnTheReport' key

  // skipped getter for the 'it_display_report_received.TheReportWasReturnedSuccessfully' key

  // skipped getter for the 'it_display_report_received.TheReorderHasBeenCompleted' key

  // skipped getter for the 'it_reports_received.NoReport' key

  // skipped getter for the 'it_reports_received.Date' key

  // skipped getter for the 'it_reports_received.High' key

  // skipped getter for the 'it_reports_received.Mid' key

  // skipped getter for the 'it_reports_received.Low' key

  // skipped getter for the 'it_reports_received.ReportNumber' key

  // skipped getter for the 'it_reports_received.NoLocation' key

  // skipped getter for the 'it_reports_received.Location' key

  // skipped getter for the 'it_reports_received.ReportDate' key

  // skipped getter for the 'it_reports_received.ReportLocation' key

  // skipped getter for the 'device_dateils_report.DateilsReportNumber' key

  // skipped getter for the 'device_dateils_report.NoReports' key

  // skipped getter for the 'device_dateils_report.ReportNumber' key

  // skipped getter for the 'device_dateils_report.NoLocation' key

  // skipped getter for the 'device_dateils_report.Date' key

  // skipped getter for the 'device_dateils_report.DeviceNumber' key

  // skipped getter for the 'device_dateils_report.Device' key

  // skipped getter for the 'device_dateils_report.NoDeviceNumber' key

  // skipped getter for the 'device_dateils_report.Location' key

  // skipped getter for the 'device_dateils_report.ContactInformation' key

  // skipped getter for the 'device_dateils_report.LabLocation' key

  // skipped getter for the 'device_dateils_report.DescriptionOfProblem' key

  // skipped getter for the 'device_dateils_report.Problem' key

  // skipped getter for the 'device_dateils_report.TheReportHasBeenReceivedTy4Cooperation' key

  // skipped getter for the 'device_dateils_report.Agree' key

  // skipped getter for the 'device_dateils_report.TheOrderHasBeenReceived' key

  // skipped getter for the 'device_dateils_report.ReceivingTheOrder' key

  // skipped getter for the 'device_display_reports.Previous' key

  // skipped getter for the 'device_display_reports.Recent' key

  // skipped getter for the 'device_display_reports.NoReport' key

  // skipped getter for the 'device_display_reports.Date' key

  // skipped getter for the 'device_display_reports.High' key

  // skipped getter for the 'device_display_reports.Mid' key

  // skipped getter for the 'device_display_reports.Low' key

  // skipped getter for the 'device_display_reports.ReportDate' key

  // skipped getter for the 'device_display_reports.NoLocation' key

  // skipped getter for the 'device_display_reports.Location' key

  // skipped getter for the 'device_display_reports.ReportNumber' key

  // skipped getter for the 'ditels_user_minitines.FillAllFields' key

  // skipped getter for the 'ditels_user_minitines.Ok' key

  // skipped getter for the 'ditels_user_minitines.Thanks4YourCooperation' key

  // skipped getter for the 'ditels_user_minitines.BeenSent' key

  // skipped getter for the 'ditels_user_minitines.MaintenanceDetails' key

  // skipped getter for the 'ditels_user_minitines.Erorr' key

  // skipped getter for the 'ditels_user_minitines.NoDetailsMaintenance' key

  // skipped getter for the 'ditels_user_minitines.ReportNumber' key

  // skipped getter for the 'ditels_user_minitines.StartDateOfReport' key

  // skipped getter for the 'ditels_user_minitines.EndDateOfReport' key

  // skipped getter for the 'ditels_user_minitines.Location' key

  // skipped getter for the 'ditels_user_minitines.Buliding' key

  // skipped getter for the 'ditels_user_minitines.DescriptionOfProblem' key

  // skipped getter for the 'ditels_user_minitines.NoDescription' key

  // skipped getter for the 'ditels_user_minitines.ContactInformation' key

  // skipped getter for the 'ditels_user_minitines.ProblemSolution' key

  // skipped getter for the 'ditels_user_minitines.ServiceEvaluation' key

  // skipped getter for the 'ditels_user_minitines.EvaluateTheServiceHonestly' key

  // skipped getter for the 'ditels_user_minitines.EnterTheServiceDescription' key

  // skipped getter for the 'ditels_user_minitines.Sent' key

  // skipped getter for the 'ditels_user_minitines.ClickHereToViewContactInformation' key

  // skipped getter for the 'user_mainitines.CompletedMaintenance' key

  // skipped getter for the 'user_mainitines.Erorr' key

  // skipped getter for the 'user_mainitines.NoReports' key

  // skipped getter for the 'user_mainitines.ReportNumber' key

  // skipped getter for the 'user_mainitines.Location' key

  // skipped getter for the 'user_mainitines.Undefined' key

  // skipped getter for the 'user_mainitines.Date' key

  // skipped getter for the 'user_mainitines.ShowReport' key

  // skipped getter for the 'user_report_problem_ditels.FillAllFields' key

  // skipped getter for the 'user_report_problem_ditels.Ok' key

  // skipped getter for the 'user_report_problem_ditels.ThanksForYourCooperation' key

  // skipped getter for the 'user_report_problem_ditels.SentSuccessfully' key

  // skipped getter for the 'user_report_problem_ditels.TheMaintenanceReceivedIsNotCompleted' key

  // skipped getter for the 'user_report_problem_ditels.Erorr' key

  // skipped getter for the 'user_report_problem_ditels.NoMaintenanceDateils' key

  // skipped getter for the 'user_report_problem_ditels.ReportNumber' key

  // skipped getter for the 'user_report_problem_ditels.ReportDate' key

  // skipped getter for the 'user_report_problem_ditels.Location' key

  // skipped getter for the 'user_report_problem_ditels.Building' key

  // skipped getter for the 'user_report_problem_ditels.ContactInformation' key

  // skipped getter for the 'user_report_problem_ditels.DescripitonOfTheProblem' key

  // skipped getter for the 'user_report_problem_ditels.NoDescription' key

  // skipped getter for the 'user_report_problem_ditels.ServiceEvaluationHonestly' key

  // skipped getter for the 'user_report_problem_ditels.ServiceEvaluation' key

  // skipped getter for the 'user_report_problem_ditels.EnterTheServiceDescription' key

  // skipped getter for the 'user_report_problem_ditels.Sent' key

  // skipped getter for the 'user_report_problem_ditels.ClickHereToShowContactInformation' key

  // skipped getter for the 'user_report_problem.InCompletedMaintenance' key

  // skipped getter for the 'user_report_problem.Erorr' key

  // skipped getter for the 'user_report_problem.NoReports' key

  // skipped getter for the 'user_report_problem.Date' key

  // skipped getter for the 'user_report_problem.Loaction' key

  // skipped getter for the 'user_report_problem.Undefined' key

  // skipped getter for the 'user_report_problem.ReportNumber' key

  // skipped getter for the 'user_report_problem.ShowReport' key

  // skipped getter for the 'user_minitines_send_view.Ok' key

  /// `Please fill out all fields`
  String get user_minitines_send_viewFillAllFields {
    return Intl.message(
      'Please fill out all fields',
      name: 'user_minitines_send_viewFillAllFields',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'user_minitines_send_view.ThanksForYourCooperation' key

  // skipped getter for the 'user_minitines_send_view.SentSuccessfully' key

  // skipped getter for the 'user_minitines_send_view.TheMaintenanceDispatchedIsNotCompleted' key

  // skipped getter for the 'user_minitines_send_view.Erorr' key

  // skipped getter for the 'user_minitines_send_view.NoMaintenanceDateils' key

  // skipped getter for the 'user_minitines_send_view.ReportNumber' key

  // skipped getter for the 'user_minitines_send_view.ReportDate' key

  // skipped getter for the 'user_minitines_send_view.Location' key

  // skipped getter for the 'user_minitines_send_view.Building' key

  // skipped getter for the 'user_minitines_send_view.ContactInformation' key

  // skipped getter for the 'user_minitines_send_view.DescripitonOfTheProblem' key

  // skipped getter for the 'user_minitines_send_view.NoDescription' key

  // skipped getter for the 'user_minitines_send_view.ServiceEvaluationHonestly' key

  // skipped getter for the 'user_minitines_send_view.ServiceEvaluation' key

  // skipped getter for the 'user_minitines_send_view.EnterTheServiceDescription' key

  // skipped getter for the 'user_minitines_send_view.Sent' key

  // skipped getter for the 'user_minitines_send_view.ClickHereToShowContactInformation' key

  // skipped getter for the 'user_maintines_send.ReportsSent' key

  // skipped getter for the 'user_maintines_send.Erorr' key

  // skipped getter for the 'user_maintines_send.NoReports' key

  // skipped getter for the 'user_maintines_send.Date' key

  // skipped getter for the 'user_maintines_send.Location' key

  // skipped getter for the 'user_maintines_send.ReportNumber' key

  // skipped getter for the 'user_maintines_send.Undefined' key

  // skipped getter for the 'user_maintines_send.ShowReport' key

  // skipped getter for the 'user_report_details_page.CollegeOfComputer' key

  // skipped getter for the 'user_report_details_page.CollageOfBusiness' key

  // skipped getter for the 'user_report_details_page.CollageOfIslamic' key

  // skipped getter for the 'user_report_details_page.CollageOfAppliedSciences' key

  // skipped getter for the 'user_report_details_page.ToHelpYouFillFields' key

  // skipped getter for the 'user_report_details_page.SolutionProvidedSoonThanksForYourCooperation' key

  // skipped getter for the 'user_report_details_page.ReportSentsuccessfully' key

  // skipped getter for the 'user_report_details_page.FillFieldsWithValidData' key

  // skipped getter for the 'user_report_details_page.Laboratory' key

  // skipped getter for the 'user_report_details_page.EnterNameOfLaboratory' key

  // skipped getter for the 'user_report_details_page.Device' key

  // skipped getter for the 'user_report_details_page.EnterDeviceNumber' key

  // skipped getter for the 'user_report_details_page.DescriptionOfTheProblem' key

  // skipped getter for the 'user_report_details_page.EnterDescriptionOfTheProblem' key

  // skipped getter for the 'user_report_details_page.EnterYourData' key

  // skipped getter for the 'user_report_details_page.EnterFullNameAndPhoneNumber' key
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
