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

  /// `LogIn`
  String get loginNew {
    return Intl.message(
      'LogIn',
      name: 'loginNew',
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

  /// `Main Data`
  String get home_admin_MainData {
    return Intl.message(
      'Main Data',
      name: 'home_admin_MainData',
      desc: '',
      args: [],
    );
  }

  /// `Reports Received`
  String get home_admin_ReportsReceived {
    return Intl.message(
      'Reports Received',
      name: 'home_admin_ReportsReceived',
      desc: '',
      args: [],
    );
  }

  /// ` User Reports `
  String get home_admin_UserReports {
    return Intl.message(
      ' User Reports ',
      name: 'home_admin_UserReports',
      desc: '',
      args: [],
    );
  }

  /// ` It Support Reports`
  String get home_admin_SupportReports {
    return Intl.message(
      ' It Support Reports',
      name: 'home_admin_SupportReports',
      desc: '',
      args: [],
    );
  }

  /// ` Number Of Registered Assets`
  String get home_admin_NumOfRegAssets {
    return Intl.message(
      ' Number Of Registered Assets',
      name: 'home_admin_NumOfRegAssets',
      desc: '',
      args: [],
    );
  }

  /// ` Colleges Data `
  String get home_admin_CollegesData {
    return Intl.message(
      ' Colleges Data ',
      name: 'home_admin_CollegesData',
      desc: '',
      args: [],
    );
  }

  /// `Number Of Weekly Reports`
  String get home_admin_NumOfWeeklyReports {
    return Intl.message(
      'Number Of Weekly Reports',
      name: 'home_admin_NumOfWeeklyReports',
      desc: '',
      args: [],
    );
  }

  /// ` Total Number Of Reports`
  String get home_admin_TotalNumOfReports {
    return Intl.message(
      ' Total Number Of Reports',
      name: 'home_admin_TotalNumOfReports',
      desc: '',
      args: [],
    );
  }

  /// `College Of Sciences`
  String get home_admin_CollegeOfAppliedSciences {
    return Intl.message(
      'College Of Sciences',
      name: 'home_admin_CollegeOfAppliedSciences',
      desc: '',
      args: [],
    );
  }

  /// `Show Data`
  String get home_admin_ShowData {
    return Intl.message(
      'Show Data',
      name: 'home_admin_ShowData',
      desc: '',
      args: [],
    );
  }

  /// `College Of Computer`
  String get home_admin_CollegeOfComputer {
    return Intl.message(
      'College Of Computer',
      name: 'home_admin_CollegeOfComputer',
      desc: '',
      args: [],
    );
  }

  /// `College Of Business`
  String get home_admin_CollegeOfBusinessManagement {
    return Intl.message(
      'College Of Business',
      name: 'home_admin_CollegeOfBusinessManagement',
      desc: '',
      args: [],
    );
  }

  /// `College Of Business`
  String get home_admin_CollegeOfBusiness {
    return Intl.message(
      'College Of Business',
      name: 'home_admin_CollegeOfBusiness',
      desc: '',
      args: [],
    );
  }

  /// `Report Closed`
  String get home_admin_ReportClosed {
    return Intl.message(
      'Report Closed',
      name: 'home_admin_ReportClosed',
      desc: '',
      args: [],
    );
  }

  /// ` Home Page`
  String get home_page_admin_HomePage {
    return Intl.message(
      ' Home Page',
      name: 'home_page_admin_HomePage',
      desc: '',
      args: [],
    );
  }

  /// ` PTM\n To Make IT Easy`
  String get home_page_admin_PTMtoMake {
    return Intl.message(
      ' PTM\n To Make IT Easy',
      name: 'home_page_admin_PTMtoMake',
      desc: '',
      args: [],
    );
  }

  /// ` Personal Data`
  String get home_page_admin_PersonalData {
    return Intl.message(
      ' Personal Data',
      name: 'home_page_admin_PersonalData',
      desc: '',
      args: [],
    );
  }

  /// ` Information Panel  `
  String get home_page_admin_InformationPanel {
    return Intl.message(
      ' Information Panel  ',
      name: 'home_page_admin_InformationPanel',
      desc: '',
      args: [],
    );
  }

  /// `Maintenance`
  String get home_page_admin_Maintenance {
    return Intl.message(
      'Maintenance',
      name: 'home_page_admin_Maintenance',
      desc: '',
      args: [],
    );
  }

  /// ` Add Assets`
  String get home_page_admin_AddAssets {
    return Intl.message(
      ' Add Assets',
      name: 'home_page_admin_AddAssets',
      desc: '',
      args: [],
    );
  }

  /// ` Settings`
  String get home_page_admin_Settings {
    return Intl.message(
      ' Settings',
      name: 'home_page_admin_Settings',
      desc: '',
      args: [],
    );
  }

  /// ` Sign Out`
  String get home_page_admin_SignOut {
    return Intl.message(
      ' Sign Out',
      name: 'home_page_admin_SignOut',
      desc: '',
      args: [],
    );
  }

  /// `Main`
  String get home_page_admin_Main {
    return Intl.message(
      'Main',
      name: 'home_page_admin_Main',
      desc: '',
      args: [],
    );
  }

  /// `Users`
  String get home_page_admin_Users {
    return Intl.message(
      'Users',
      name: 'home_page_admin_Users',
      desc: '',
      args: [],
    );
  }

  /// ` Support Staff`
  String get home_page_admin_SupportStaff {
    return Intl.message(
      ' Support Staff',
      name: 'home_page_admin_SupportStaff',
      desc: '',
      args: [],
    );
  }

  /// `Add Report`
  String get home_page_admin_AddReport {
    return Intl.message(
      'Add Report',
      name: 'home_page_admin_AddReport',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get home_page_and_bar_PersonalInformation {
    return Intl.message(
      'Personal Information',
      name: 'home_page_and_bar_PersonalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Completed Maintenance`
  String get home_page_and_bar_CompletedMaintenance {
    return Intl.message(
      'Completed Maintenance',
      name: 'home_page_and_bar_CompletedMaintenance',
      desc: '',
      args: [],
    );
  }

  /// `Received Maintenance`
  String get home_page_and_bar_ReceivedMaintenance {
    return Intl.message(
      'Received Maintenance',
      name: 'home_page_and_bar_ReceivedMaintenance',
      desc: '',
      args: [],
    );
  }

  /// `Report Sent`
  String get home_page_and_bar_ReportSent {
    return Intl.message(
      'Report Sent',
      name: 'home_page_and_bar_ReportSent',
      desc: '',
      args: [],
    );
  }

  /// `The Ways To Contact`
  String get home_page_and_bar_TheWaysToContact {
    return Intl.message(
      'The Ways To Contact',
      name: 'home_page_and_bar_TheWaysToContact',
      desc: '',
      args: [],
    );
  }

  /// ` Problem Sloution Report `
  String get dashboard_ProblemSloutionReport {
    return Intl.message(
      ' Problem Sloution Report ',
      name: 'dashboard_ProblemSloutionReport',
      desc: '',
      args: [],
    );
  }

  /// ` Closed Report `
  String get dashboard_ClosedReport {
    return Intl.message(
      ' Closed Report ',
      name: 'dashboard_ClosedReport',
      desc: '',
      args: [],
    );
  }

  /// ` Open Report`
  String get dashboard_OpenReport {
    return Intl.message(
      ' Open Report',
      name: 'dashboard_OpenReport',
      desc: '',
      args: [],
    );
  }

  /// `Number Of Reports `
  String get dashboard_NumOfReport {
    return Intl.message(
      'Number Of Reports ',
      name: 'dashboard_NumOfReport',
      desc: '',
      args: [],
    );
  }

  /// ` Received Report`
  String get dashboard_ReceivedReport {
    return Intl.message(
      ' Received Report',
      name: 'dashboard_ReceivedReport',
      desc: '',
      args: [],
    );
  }

  /// ` Support Staff`
  String get dashboard_SupportStaff {
    return Intl.message(
      ' Support Staff',
      name: 'dashboard_SupportStaff',
      desc: '',
      args: [],
    );
  }

  /// ` Number Of Users `
  String get dashboard_NumOfUser {
    return Intl.message(
      ' Number Of Users ',
      name: 'dashboard_NumOfUser',
      desc: '',
      args: [],
    );
  }

  /// ` Number Of Assets `
  String get dashboard_NumOfAssets {
    return Intl.message(
      ' Number Of Assets ',
      name: 'dashboard_NumOfAssets',
      desc: '',
      args: [],
    );
  }

  /// ` Users Reports`
  String get dashboard_UserReport {
    return Intl.message(
      ' Users Reports',
      name: 'dashboard_UserReport',
      desc: '',
      args: [],
    );
  }

  /// `There Are No Reports`
  String get it_all_reports_NoReports {
    return Intl.message(
      'There Are No Reports',
      name: 'it_all_reports_NoReports',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get it_all_reports_Date {
    return Intl.message(
      'Date',
      name: 'it_all_reports_Date',
      desc: '',
      args: [],
    );
  }

  /// `Report Number`
  String get it_all_reports_NumOReports {
    return Intl.message(
      'Report Number',
      name: 'it_all_reports_NumOReports',
      desc: '',
      args: [],
    );
  }

  /// `Undefined`
  String get it_all_reports_Undefined {
    return Intl.message(
      'Undefined',
      name: 'it_all_reports_Undefined',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get it_all_reports_Location {
    return Intl.message(
      'Location',
      name: 'it_all_reports_Location',
      desc: '',
      args: [],
    );
  }

  /// `Show Reports`
  String get it_all_reports_ShowReports {
    return Intl.message(
      'Show Reports',
      name: 'it_all_reports_ShowReports',
      desc: '',
      args: [],
    );
  }

  /// `Report Details`
  String get it_report_ReportDetails {
    return Intl.message(
      'Report Details',
      name: 'it_report_ReportDetails',
      desc: '',
      args: [],
    );
  }

  /// `It Reports`
  String get it_report_ItReports {
    return Intl.message(
      'It Reports',
      name: 'it_report_ItReports',
      desc: '',
      args: [],
    );
  }

  /// `No Report Details`
  String get it_report_NoReportDetails {
    return Intl.message(
      'No Report Details',
      name: 'it_report_NoReportDetails',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'it_report_NumOfReport,' key

  /// `Number Of device`
  String get it_report_NumOfDevice {
    return Intl.message(
      'Number Of device',
      name: 'it_report_NumOfDevice',
      desc: '',
      args: [],
    );
  }

  /// ` Device `
  String get it_report_Device {
    return Intl.message(
      ' Device ',
      name: 'it_report_Device',
      desc: '',
      args: [],
    );
  }

  /// `No Description Available`
  String get it_report_NoDescriptionAvailable {
    return Intl.message(
      'No Description Available',
      name: 'it_report_NoDescriptionAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Date Of Report`
  String get it_report_DateOfReport {
    return Intl.message(
      'Date Of Report',
      name: 'it_report_DateOfReport',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get it_report_Location {
    return Intl.message(
      'Location',
      name: 'it_report_Location',
      desc: '',
      args: [],
    );
  }

  /// `Describe The Problem`
  String get it_report_DescribeTheProblem {
    return Intl.message(
      'Describe The Problem',
      name: 'it_report_DescribeTheProblem',
      desc: '',
      args: [],
    );
  }

  /// `Problem Solution`
  String get it_report_ProblemSolution {
    return Intl.message(
      'Problem Solution',
      name: 'it_report_ProblemSolution',
      desc: '',
      args: [],
    );
  }

  /// ` The Start Date Of The Report  `
  String get it_report_StartDateOfRrport {
    return Intl.message(
      ' The Start Date Of The Report  ',
      name: 'it_report_StartDateOfRrport',
      desc: '',
      args: [],
    );
  }

  /// `  The End Date Of The Report `
  String get it_report_EndDateOfReport {
    return Intl.message(
      '  The End Date Of The Report ',
      name: 'it_report_EndDateOfReport',
      desc: '',
      args: [],
    );
  }

  /// ` Building`
  String get it_report_Building {
    return Intl.message(
      ' Building',
      name: 'it_report_Building',
      desc: '',
      args: [],
    );
  }

  /// `Contact Information  `
  String get it_report_ContactInformation {
    return Intl.message(
      'Contact Information  ',
      name: 'it_report_ContactInformation',
      desc: '',
      args: [],
    );
  }

  /// `Details Of Report `
  String get show_reports_user_ditils_DetailsOfReport {
    return Intl.message(
      'Details Of Report ',
      name: 'show_reports_user_ditils_DetailsOfReport',
      desc: '',
      args: [],
    );
  }

  /// `User Report`
  String get show_reports_user_ditils_UserReport {
    return Intl.message(
      'User Report',
      name: 'show_reports_user_ditils_UserReport',
      desc: '',
      args: [],
    );
  }

  /// ` No Reports`
  String get show_reports_user_ditils_NoReports {
    return Intl.message(
      ' No Reports',
      name: 'show_reports_user_ditils_NoReports',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'show_reports_user_ditils-Date' key

  /// `Report No`
  String get show_reports_user_ditils_ReportNum {
    return Intl.message(
      'Report No',
      name: 'show_reports_user_ditils_ReportNum',
      desc: '',
      args: [],
    );
  }

  /// `Number of device`
  String get show_reports_user_ditils_NumOfDevice {
    return Intl.message(
      'Number of device',
      name: 'show_reports_user_ditils_NumOfDevice',
      desc: '',
      args: [],
    );
  }

  /// `No Device Num`
  String get show_reports_user_ditils_NoDeviceNum {
    return Intl.message(
      'No Device Num',
      name: 'show_reports_user_ditils_NoDeviceNum',
      desc: '',
      args: [],
    );
  }

  /// `Device`
  String get show_reports_user_ditils_Device {
    return Intl.message(
      'Device',
      name: 'show_reports_user_ditils_Device',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get show_reports_user_ditils_Location {
    return Intl.message(
      'Location',
      name: 'show_reports_user_ditils_Location',
      desc: '',
      args: [],
    );
  }

  /// `No Location`
  String get show_reports_user_ditils_NoLocation {
    return Intl.message(
      'No Location',
      name: 'show_reports_user_ditils_NoLocation',
      desc: '',
      args: [],
    );
  }

  /// `Description Of The Problem`
  String get show_reports_user_ditils_DescriptionOfTheProblem {
    return Intl.message(
      'Description Of The Problem',
      name: 'show_reports_user_ditils_DescriptionOfTheProblem',
      desc: '',
      args: [],
    );
  }

  /// `No Description`
  String get show_reports_user_ditils_NoDescription {
    return Intl.message(
      'No Description',
      name: 'show_reports_user_ditils_NoDescription',
      desc: '',
      args: [],
    );
  }

  /// `Problem`
  String get show_reports_user_ditils_Problem {
    return Intl.message(
      'Problem',
      name: 'show_reports_user_ditils_Problem',
      desc: '',
      args: [],
    );
  }

  /// `Delete The Report`
  String get show_reports_user_ditils_DeleteTheReport {
    return Intl.message(
      'Delete The Report',
      name: 'show_reports_user_ditils_DeleteTheReport',
      desc: '',
      args: [],
    );
  }

  /// `Are You Sure You Want To Delete The Report`
  String get show_reports_user_ditils_SureOFDelete {
    return Intl.message(
      'Are You Sure You Want To Delete The Report',
      name: 'show_reports_user_ditils_SureOFDelete',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get show_reports_user_ditils_Done {
    return Intl.message(
      'Done',
      name: 'show_reports_user_ditils_Done',
      desc: '',
      args: [],
    );
  }

  /// `The Repot Has Been Deleted`
  String get show_reports_user_ditils_TheRepotHasBeenDeleted {
    return Intl.message(
      'The Repot Has Been Deleted',
      name: 'show_reports_user_ditils_TheRepotHasBeenDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Undo`
  String get show_reports_user_ditils_Undo {
    return Intl.message(
      'Undo',
      name: 'show_reports_user_ditils_Undo',
      desc: '',
      args: [],
    );
  }

  /// `Building:`
  String get show_reports_user_ditils_building {
    return Intl.message(
      'Building:',
      name: 'show_reports_user_ditils_building',
      desc: '',
      args: [],
    );
  }

  /// `Contact Information `
  String get show_reports_user_ditils_ContactInformation {
    return Intl.message(
      'Contact Information ',
      name: 'show_reports_user_ditils_ContactInformation',
      desc: '',
      args: [],
    );
  }

  /// `User Report`
  String get user_reports_UserReport {
    return Intl.message(
      'User Report',
      name: 'user_reports_UserReport',
      desc: '',
      args: [],
    );
  }

  /// `Erorr`
  String get user_reports_Erorr {
    return Intl.message(
      'Erorr',
      name: 'user_reports_Erorr',
      desc: '',
      args: [],
    );
  }

  /// `No Report`
  String get user_reports_NoReport {
    return Intl.message(
      'No Report',
      name: 'user_reports_NoReport',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get user_reports_Date {
    return Intl.message(
      'Date',
      name: 'user_reports_Date',
      desc: '',
      args: [],
    );
  }

  /// `Report Number`
  String get user_reports_ReportNumber {
    return Intl.message(
      'Report Number',
      name: 'user_reports_ReportNumber',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get user_reports_Location {
    return Intl.message(
      'Location',
      name: 'user_reports_Location',
      desc: '',
      args: [],
    );
  }

  /// `Show Report`
  String get user_reports_ShowReport {
    return Intl.message(
      'Show Report',
      name: 'user_reports_ShowReport',
      desc: '',
      args: [],
    );
  }

  /// `Undefined  `
  String get user_reports_Undefined {
    return Intl.message(
      'Undefined  ',
      name: 'user_reports_Undefined',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get admin_data_FristName {
    return Intl.message(
      'First Name',
      name: 'admin_data_FristName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get admin_data_LastName {
    return Intl.message(
      'Last Name',
      name: 'admin_data_LastName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get admin_data_Email {
    return Intl.message(
      'Email',
      name: 'admin_data_Email',
      desc: '',
      args: [],
    );
  }

  /// `Opss`
  String get admin_data_Opss {
    return Intl.message(
      'Opss',
      name: 'admin_data_Opss',
      desc: '',
      args: [],
    );
  }

  /// `User Data`
  String get admin_data_UserData {
    return Intl.message(
      'User Data',
      name: 'admin_data_UserData',
      desc: '',
      args: [],
    );
  }

  /// `Admin`
  String get admin_data_Admin {
    return Intl.message(
      'Admin',
      name: 'admin_data_Admin',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get admin_data_Username {
    return Intl.message(
      'Username',
      name: 'admin_data_Username',
      desc: '',
      args: [],
    );
  }

  /// ` Job Position`
  String get admin_data_JobPosition {
    return Intl.message(
      ' Job Position',
      name: 'admin_data_JobPosition',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get admin_settings_Settings {
    return Intl.message(
      'Settings',
      name: 'admin_settings_Settings',
      desc: '',
      args: [],
    );
  }

  /// `Change Theme`
  String get admin_settings_ChangeTheme {
    return Intl.message(
      'Change Theme',
      name: 'admin_settings_ChangeTheme',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get admin_settings_Notifications {
    return Intl.message(
      'Notifications',
      name: 'admin_settings_Notifications',
      desc: '',
      args: [],
    );
  }

  /// `Edit Password`
  String get admin_settings_EditPassword {
    return Intl.message(
      'Edit Password',
      name: 'admin_settings_EditPassword',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get admin_settings_language {
    return Intl.message(
      'Language',
      name: 'admin_settings_language',
      desc: '',
      args: [],
    );
  }

  /// `Employee Data`
  String get it_user_data_EmployeeData {
    return Intl.message(
      'Employee Data',
      name: 'it_user_data_EmployeeData',
      desc: '',
      args: [],
    );
  }

  /// `User It`
  String get it_user_data_UserIt {
    return Intl.message(
      'User It',
      name: 'it_user_data_UserIt',
      desc: '',
      args: [],
    );
  }

  /// `No Report`
  String get it_user_data_NoReport {
    return Intl.message(
      'No Report',
      name: 'it_user_data_NoReport',
      desc: '',
      args: [],
    );
  }

  /// `Number Of Employee `
  String get it_user_data_NumberOfEmployee {
    return Intl.message(
      'Number Of Employee ',
      name: 'it_user_data_NumberOfEmployee',
      desc: '',
      args: [],
    );
  }

  /// `Firts Name`
  String get it_user_data_FirtsName {
    return Intl.message(
      'Firts Name',
      name: 'it_user_data_FirtsName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get it_user_data_LastName {
    return Intl.message(
      'Last Name',
      name: 'it_user_data_LastName',
      desc: '',
      args: [],
    );
  }

  /// `No Description`
  String get it_user_data_NoDescription {
    return Intl.message(
      'No Description',
      name: 'it_user_data_NoDescription',
      desc: '',
      args: [],
    );
  }

  /// `Email Of Employee`
  String get it_user_data_EmailOfEmployee {
    return Intl.message(
      'Email Of Employee',
      name: 'it_user_data_EmailOfEmployee',
      desc: '',
      args: [],
    );
  }

  /// `Are You Sure You Want To Delete The Employee?`
  String get it_user_data_SureOFDeleteTheEmployee {
    return Intl.message(
      'Are You Sure You Want To Delete The Employee?',
      name: 'it_user_data_SureOFDeleteTheEmployee',
      desc: '',
      args: [],
    );
  }

  /// `The Employee Has been Deleted`
  String get it_user_data_DoneDelete {
    return Intl.message(
      'The Employee Has been Deleted',
      name: 'it_user_data_DoneDelete',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get it_user_data_Done {
    return Intl.message(
      'Done',
      name: 'it_user_data_Done',
      desc: '',
      args: [],
    );
  }

  /// `Undo`
  String get it_user_data_Undo {
    return Intl.message(
      'Undo',
      name: 'it_user_data_Undo',
      desc: '',
      args: [],
    );
  }

  /// `Delete an Employee`
  String get it_user_data_DeleteEmployee {
    return Intl.message(
      'Delete an Employee',
      name: 'it_user_data_DeleteEmployee',
      desc: '',
      args: [],
    );
  }

  /// ` There was a Problem `
  String get it_user_data_SomeProblem {
    return Intl.message(
      ' There was a Problem ',
      name: 'it_user_data_SomeProblem',
      desc: '',
      args: [],
    );
  }

  /// `Erorr`
  String get it_user_Erorr {
    return Intl.message(
      'Erorr',
      name: 'it_user_Erorr',
      desc: '',
      args: [],
    );
  }

  /// `No Report`
  String get it_user_NoReport {
    return Intl.message(
      'No Report',
      name: 'it_user_NoReport',
      desc: '',
      args: [],
    );
  }

  /// `It Support Employee`
  String get it_user_ItSupportEmployee {
    return Intl.message(
      'It Support Employee',
      name: 'it_user_ItSupportEmployee',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get it_user_FirstName {
    return Intl.message(
      'First Name',
      name: 'it_user_FirstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get it_user_LastName {
    return Intl.message(
      'Last Name',
      name: 'it_user_LastName',
      desc: '',
      args: [],
    );
  }

  /// `Undefined`
  String get it_user_Undefined {
    return Intl.message(
      'Undefined',
      name: 'it_user_Undefined',
      desc: '',
      args: [],
    );
  }

  /// `Show Data`
  String get it_user_ShowData {
    return Intl.message(
      'Show Data',
      name: 'it_user_ShowData',
      desc: '',
      args: [],
    );
  }

  /// `Beneficiary Data`
  String get normal_user_data_BeneficiaryData {
    return Intl.message(
      'Beneficiary Data',
      name: 'normal_user_data_BeneficiaryData',
      desc: '',
      args: [],
    );
  }

  /// `No Report`
  String get normal_user_data_NoReport {
    return Intl.message(
      'No Report',
      name: 'normal_user_data_NoReport',
      desc: '',
      args: [],
    );
  }

  /// `Beneficiary Number`
  String get normal_user_data_BeneficiaryNumber {
    return Intl.message(
      'Beneficiary Number',
      name: 'normal_user_data_BeneficiaryNumber',
      desc: '',
      args: [],
    );
  }

  /// `Email Of Beneficiary`
  String get normal_user_data_BeneficiaryEmail {
    return Intl.message(
      'Email Of Beneficiary',
      name: 'normal_user_data_BeneficiaryEmail',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get normal_user_data_LastName {
    return Intl.message(
      'Last Name',
      name: 'normal_user_data_LastName',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get normal_user_data_FirstName {
    return Intl.message(
      'First Name',
      name: 'normal_user_data_FirstName',
      desc: '',
      args: [],
    );
  }

  /// `No Description`
  String get normal_user_data_NoDescription {
    return Intl.message(
      'No Description',
      name: 'normal_user_data_NoDescription',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get normal_user_data_Email {
    return Intl.message(
      'Email',
      name: 'normal_user_data_Email',
      desc: '',
      args: [],
    );
  }

  /// `Are You Sure You Want To Delete The Beneficiary ?`
  String get normal_user_data_SureDeleteBeneficiary {
    return Intl.message(
      'Are You Sure You Want To Delete The Beneficiary ?',
      name: 'normal_user_data_SureDeleteBeneficiary',
      desc: '',
      args: [],
    );
  }

  /// `The Beneficiary Has been Deleted`
  String get normal_user_data_DoneDeleteBeneficiary {
    return Intl.message(
      'The Beneficiary Has been Deleted',
      name: 'normal_user_data_DoneDeleteBeneficiary',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get normal_user_data_Done {
    return Intl.message(
      'Done',
      name: 'normal_user_data_Done',
      desc: '',
      args: [],
    );
  }

  /// `Undo`
  String get normal_user_data_Undo {
    return Intl.message(
      'Undo',
      name: 'normal_user_data_Undo',
      desc: '',
      args: [],
    );
  }

  /// `Delete The Beneficiary`
  String get normal_user_data_DeleteTheBeneficiary {
    return Intl.message(
      'Delete The Beneficiary',
      name: 'normal_user_data_DeleteTheBeneficiary',
      desc: '',
      args: [],
    );
  }

  /// ` There was a Problem `
  String get normal_user_data_SomeProblem {
    return Intl.message(
      ' There was a Problem ',
      name: 'normal_user_data_SomeProblem',
      desc: '',
      args: [],
    );
  }

  /// `Erorr`
  String get user_normal_Erorr {
    return Intl.message(
      'Erorr',
      name: 'user_normal_Erorr',
      desc: '',
      args: [],
    );
  }

  /// `No Report`
  String get user_normal_NoReport {
    return Intl.message(
      'No Report',
      name: 'user_normal_NoReport',
      desc: '',
      args: [],
    );
  }

  /// `Beneficiary`
  String get user_normal_Beneficiary {
    return Intl.message(
      'Beneficiary',
      name: 'user_normal_Beneficiary',
      desc: '',
      args: [],
    );
  }

  /// `Undefined`
  String get user_normal_Undefined {
    return Intl.message(
      'Undefined',
      name: 'user_normal_Undefined',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get user_normal_LastName {
    return Intl.message(
      'Last Name',
      name: 'user_normal_LastName',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get user_normal_FirstName {
    return Intl.message(
      'First Name',
      name: 'user_normal_FirstName',
      desc: '',
      args: [],
    );
  }

  /// `Show Data`
  String get user_normal_ShowData {
    return Intl.message(
      'Show Data',
      name: 'user_normal_ShowData',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login_page_it_Login {
    return Intl.message(
      'Login',
      name: 'login_page_it_Login',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get login_page_it_Email {
    return Intl.message(
      'Email',
      name: 'login_page_it_Email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get login_page_it_Password {
    return Intl.message(
      'Password',
      name: 'login_page_it_Password',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password ?`
  String get login_page_it_ForgetPassword {
    return Intl.message(
      'Forget Password ?',
      name: 'login_page_it_ForgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please Fill The Email And Password Fields`
  String get login_page_it_PleaseFill {
    return Intl.message(
      'Please Fill The Email And Password Fields',
      name: 'login_page_it_PleaseFill',
      desc: '',
      args: [],
    );
  }

  /// `Agree`
  String get login_page_it_agree {
    return Intl.message(
      'Agree',
      name: 'login_page_it_agree',
      desc: '',
      args: [],
    );
  }

  /// `Please Wait...`
  String get login_page_it_PleaseWait {
    return Intl.message(
      'Please Wait...',
      name: 'login_page_it_PleaseWait',
      desc: '',
      args: [],
    );
  }

  /// `inCorrect Try Again \n Password or Email`
  String get login_page_it_inCorrectTryAgain {
    return Intl.message(
      'inCorrect Try Again \n Password or Email',
      name: 'login_page_it_inCorrectTryAgain',
      desc: '',
      args: [],
    );
  }

  /// ` User Not Found`
  String get login_page_it_UserNotFound {
    return Intl.message(
      ' User Not Found',
      name: 'login_page_it_UserNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect Password`
  String get login_page_it_IncorrectPassword {
    return Intl.message(
      'Incorrect Password',
      name: 'login_page_it_IncorrectPassword',
      desc: '',
      args: [],
    );
  }

  /// `Check The Data And Try Again`
  String get login_page_it_CheckAndTry {
    return Intl.message(
      'Check The Data And Try Again',
      name: 'login_page_it_CheckAndTry',
      desc: '',
      args: [],
    );
  }

  /// `New Account`
  String get login_page_it_NewAccount {
    return Intl.message(
      'New Account',
      name: 'login_page_it_NewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Admin`
  String get login_page_it_Admin {
    return Intl.message(
      'Admin',
      name: 'login_page_it_Admin',
      desc: '',
      args: [],
    );
  }

  /// `The Verification Link Has Been Sent Successfully`
  String get rest_password_SentLink {
    return Intl.message(
      'The Verification Link Has Been Sent Successfully',
      name: 'rest_password_SentLink',
      desc: '',
      args: [],
    );
  }

  /// `Agree`
  String get rest_password_agree {
    return Intl.message(
      'Agree',
      name: 'rest_password_agree',
      desc: '',
      args: [],
    );
  }

  /// `The Email Entered Must Be Verified`
  String get rest_password_MustBeVerified {
    return Intl.message(
      'The Email Entered Must Be Verified',
      name: 'rest_password_MustBeVerified',
      desc: '',
      args: [],
    );
  }

  /// `Password Reset`
  String get rest_password_PasswordReset {
    return Intl.message(
      'Password Reset',
      name: 'rest_password_PasswordReset',
      desc: '',
      args: [],
    );
  }

  /// `You Can Change Your Password From Here And An Email Will Be Sent To You`
  String get rest_password_changePasswordAndSentEmail {
    return Intl.message(
      'You Can Change Your Password From Here And An Email Will Be Sent To You',
      name: 'rest_password_changePasswordAndSentEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get rest_password_Email {
    return Intl.message(
      'Email',
      name: 'rest_password_Email',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get rest_password_Verify {
    return Intl.message(
      'Verify',
      name: 'rest_password_Verify',
      desc: '',
      args: [],
    );
  }

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

  /// `Search For Page`
  String get home_SearchForPage {
    return Intl.message(
      'Search For Page',
      name: 'home_SearchForPage',
      desc: '',
      args: [],
    );
  }

  /// `Today Reports ⚡🔧`
  String get home_TodayReports {
    return Intl.message(
      'Today Reports ⚡🔧',
      name: 'home_TodayReports',
      desc: '',
      args: [],
    );
  }

  /// `My Maintenance Today 🚀`
  String get home_MyMaintenanceToday {
    return Intl.message(
      'My Maintenance Today 🚀',
      name: 'home_MyMaintenanceToday',
      desc: '',
      args: [],
    );
  }

  /// `Reports 📑📝`
  String get home_Reports {
    return Intl.message(
      'Reports 📑📝',
      name: 'home_Reports',
      desc: '',
      args: [],
    );
  }

  /// `Erorr`
  String get home_Erorr {
    return Intl.message(
      'Erorr',
      name: 'home_Erorr',
      desc: '',
      args: [],
    );
  }

  /// `No Reports`
  String get home_NoReports {
    return Intl.message(
      'No Reports',
      name: 'home_NoReports',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Device`
  String get home_UnknownDevice {
    return Intl.message(
      'Unknown Device',
      name: 'home_UnknownDevice',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Problem`
  String get home_UnknownProblem {
    return Intl.message(
      'Unknown Problem',
      name: 'home_UnknownProblem',
      desc: '',
      args: [],
    );
  }

  /// `Problem Solution Report`
  String get dashboard_ProblemSolutionReport {
    return Intl.message(
      'Problem Solution Report',
      name: 'dashboard_ProblemSolutionReport',
      desc: '',
      args: [],
    );
  }

  /// ` Reports Received`
  String get dashboard_ReportsReceived {
    return Intl.message(
      ' Reports Received',
      name: 'dashboard_ReportsReceived',
      desc: '',
      args: [],
    );
  }

  /// ` Reports Closed`
  String get dashboard_ReportsClosed {
    return Intl.message(
      ' Reports Closed',
      name: 'dashboard_ReportsClosed',
      desc: '',
      args: [],
    );
  }

  /// `Average Solution Time`
  String get dashboard_AverageSolutionTime {
    return Intl.message(
      'Average Solution Time',
      name: 'dashboard_AverageSolutionTime',
      desc: '',
      args: [],
    );
  }

  /// `Employee Evaluation`
  String get dashboard_EmployeeEvaluation {
    return Intl.message(
      'Employee Evaluation',
      name: 'dashboard_EmployeeEvaluation',
      desc: '',
      args: [],
    );
  }

  /// `Completed Reports`
  String get dashboard_CompletedReports {
    return Intl.message(
      'Completed Reports',
      name: 'dashboard_CompletedReports',
      desc: '',
      args: [],
    );
  }

  /// `My Reviews`
  String get dashboard_MyReviews {
    return Intl.message(
      'My Reviews',
      name: 'dashboard_MyReviews',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get navbar_drawer_HomePage {
    return Intl.message(
      'Home',
      name: 'navbar_drawer_HomePage',
      desc: '',
      args: [],
    );
  }

  /// `PTM \n To Make IT Esay`
  String get navbar_drawer_PTM2Make {
    return Intl.message(
      'PTM \n To Make IT Esay',
      name: 'navbar_drawer_PTM2Make',
      desc: '',
      args: [],
    );
  }

  /// `Add Technical Assets`
  String get navbar_drawer_AddAssets {
    return Intl.message(
      'Add Technical Assets',
      name: 'navbar_drawer_AddAssets',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get navbar_drawer_PersonalInfo {
    return Intl.message(
      'Personal Information',
      name: 'navbar_drawer_PersonalInfo',
      desc: '',
      args: [],
    );
  }

  /// ` Preformsnce Indicator`
  String get navbar_drawer_GeneralPreformsnceIndicator {
    return Intl.message(
      ' Preformsnce Indicator',
      name: 'navbar_drawer_GeneralPreformsnceIndicator',
      desc: '',
      args: [],
    );
  }

  /// `Application Settings`
  String get navbar_drawer_ApplicationSettings {
    return Intl.message(
      'Application Settings',
      name: 'navbar_drawer_ApplicationSettings',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get navbar_drawer_Reports {
    return Intl.message(
      'Reports',
      name: 'navbar_drawer_Reports',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get navbar_drawer_SignOut {
    return Intl.message(
      'Sign Out',
      name: 'navbar_drawer_SignOut',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get navbar_drawer_Main {
    return Intl.message(
      'Home',
      name: 'navbar_drawer_Main',
      desc: '',
      args: [],
    );
  }

  /// `QrCode`
  String get navbar_drawer_QrCode {
    return Intl.message(
      'QrCode',
      name: 'navbar_drawer_QrCode',
      desc: '',
      args: [],
    );
  }

  /// `Devices`
  String get navbar_drawer_Devices {
    return Intl.message(
      'Devices',
      name: 'navbar_drawer_Devices',
      desc: '',
      args: [],
    );
  }

  /// `Maintenance`
  String get navbar_drawer_Maintenance {
    return Intl.message(
      'Maintenance',
      name: 'navbar_drawer_Maintenance',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get navbar_drawer_Rrport {
    return Intl.message(
      'Reports',
      name: 'navbar_drawer_Rrport',
      desc: '',
      args: [],
    );
  }

  /// `Device Information`
  String get business_collage_DeviceInfo {
    return Intl.message(
      'Device Information',
      name: 'business_collage_DeviceInfo',
      desc: '',
      args: [],
    );
  }

  /// `College Of Business Administration, Umm Al-Qura University`
  String get business_collage_CollegeOfBusiness {
    return Intl.message(
      'College Of Business Administration, Umm Al-Qura University',
      name: 'business_collage_CollegeOfBusiness',
      desc: '',
      args: [],
    );
  }

  /// `Erorr`
  String get business_collage_Erorr {
    return Intl.message(
      'Erorr',
      name: 'business_collage_Erorr',
      desc: '',
      args: [],
    );
  }

  /// `Device Brand`
  String get business_collage_DeviceBrand {
    return Intl.message(
      'Device Brand',
      name: 'business_collage_DeviceBrand',
      desc: '',
      args: [],
    );
  }

  /// `Device Location`
  String get business_collage_DeviceLocation {
    return Intl.message(
      'Device Location',
      name: 'business_collage_DeviceLocation',
      desc: '',
      args: [],
    );
  }

  /// `Device HardDisk`
  String get business_collage_DeviceHardDisk {
    return Intl.message(
      'Device HardDisk',
      name: 'business_collage_DeviceHardDisk',
      desc: '',
      args: [],
    );
  }

  /// `Device CPU`
  String get business_collage_DeviceCPU {
    return Intl.message(
      'Device CPU',
      name: 'business_collage_DeviceCPU',
      desc: '',
      args: [],
    );
  }

  /// `Ministry Number`
  String get business_collage_ministrynumber {
    return Intl.message(
      'Ministry Number',
      name: 'business_collage_ministrynumber',
      desc: '',
      args: [],
    );
  }

  /// `Serial Number`
  String get business_collage_serialnumber {
    return Intl.message(
      'Serial Number',
      name: 'business_collage_serialnumber',
      desc: '',
      args: [],
    );
  }

  /// `Selected Option`
  String get business_collage_selectedoption {
    return Intl.message(
      'Selected Option',
      name: 'business_collage_selectedoption',
      desc: '',
      args: [],
    );
  }

  /// `Mac Address`
  String get business_collage_macddress {
    return Intl.message(
      'Mac Address',
      name: 'business_collage_macddress',
      desc: '',
      args: [],
    );
  }

  /// `No Data Available`
  String get business_collage_NoDataAvailable {
    return Intl.message(
      'No Data Available',
      name: 'business_collage_NoDataAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Main Site`
  String get business_collage_MainSite {
    return Intl.message(
      'Main Site',
      name: 'business_collage_MainSite',
      desc: '',
      args: [],
    );
  }

  /// `Sub Site`
  String get business_collage_SubSite {
    return Intl.message(
      'Sub Site',
      name: 'business_collage_SubSite',
      desc: '',
      args: [],
    );
  }

  /// `Device Model`
  String get business_collage_DeviceModel {
    return Intl.message(
      'Device Model',
      name: 'business_collage_DeviceModel',
      desc: '',
      args: [],
    );
  }

  /// `Processor Type`
  String get business_collage_ProcessorType {
    return Intl.message(
      'Processor Type',
      name: 'business_collage_ProcessorType',
      desc: '',
      args: [],
    );
  }

  /// ` Hard Disk`
  String get business_collage_HardDisk {
    return Intl.message(
      ' Hard Disk',
      name: 'business_collage_HardDisk',
      desc: '',
      args: [],
    );
  }

  /// `Show Location`
  String get business_collage_ShowLocation {
    return Intl.message(
      'Show Location',
      name: 'business_collage_ShowLocation',
      desc: '',
      args: [],
    );
  }

  /// `College Of Computer , Umm Al-Qura University`
  String get business_collage_CollegeOfComputer {
    return Intl.message(
      'College Of Computer , Umm Al-Qura University',
      name: 'business_collage_CollegeOfComputer',
      desc: '',
      args: [],
    );
  }

  /// `College Of Islamic Law, Umm Al-Qura University`
  String get business_collage_CollegeOfIslamic {
    return Intl.message(
      'College Of Islamic Law, Umm Al-Qura University',
      name: 'business_collage_CollegeOfIslamic',
      desc: '',
      args: [],
    );
  }

  /// `College Of Applied Sciences, Umm Al-Qura University`
  String get business_collage_CollegeOfSciences {
    return Intl.message(
      'College Of Applied Sciences, Umm Al-Qura University',
      name: 'business_collage_CollegeOfSciences',
      desc: '',
      args: [],
    );
  }

  /// `From Here, You Can Review The College And All The Devices Within Them To Speed Up The Process Of Responding To Reports`
  String get Device_Location_DisplayCollegAndDevice {
    return Intl.message(
      'From Here, You Can Review The College And All The Devices Within Them To Speed Up The Process Of Responding To Reports',
      name: 'Device_Location_DisplayCollegAndDevice',
      desc: '',
      args: [],
    );
  }

  /// `Show Data`
  String get Device_Location_ShowData {
    return Intl.message(
      'Show Data',
      name: 'Device_Location_ShowData',
      desc: '',
      args: [],
    );
  }

  /// `College Of Computer`
  String get Device_Location_CollegeOfComputer {
    return Intl.message(
      'College Of Computer',
      name: 'Device_Location_CollegeOfComputer',
      desc: '',
      args: [],
    );
  }

  /// `College Of Business Management`
  String get Device_Location_CollageOfBusiness {
    return Intl.message(
      'College Of Business Management',
      name: 'Device_Location_CollageOfBusiness',
      desc: '',
      args: [],
    );
  }

  /// `Collage Of Islamic Law`
  String get Device_Location_CollageOfIslamic {
    return Intl.message(
      'Collage Of Islamic Law',
      name: 'Device_Location_CollageOfIslamic',
      desc: '',
      args: [],
    );
  }

  /// `Collage Of Applied Sciences`
  String get Device_Location_CollageOfAppliedSciences {
    return Intl.message(
      'Collage Of Applied Sciences',
      name: 'Device_Location_CollageOfAppliedSciences',
      desc: '',
      args: [],
    );
  }

  /// `Open Pdf`
  String get pdf_Open {
    return Intl.message(
      'Open Pdf',
      name: 'pdf_Open',
      desc: '',
      args: [],
    );
  }

  /// `QR`
  String get qrcode_sccaner_QR {
    return Intl.message(
      'QR',
      name: 'qrcode_sccaner_QR',
      desc: '',
      args: [],
    );
  }

  /// `Device Information`
  String get qrcode_sccaner_DeviceInfo {
    return Intl.message(
      'Device Information',
      name: 'qrcode_sccaner_DeviceInfo',
      desc: '',
      args: [],
    );
  }

  /// `Ignore`
  String get qrcode_sccaner_Ignore {
    return Intl.message(
      'Ignore',
      name: 'qrcode_sccaner_Ignore',
      desc: '',
      args: [],
    );
  }

  /// `Verification Page`
  String get password_assets_VerificationPage {
    return Intl.message(
      'Verification Page',
      name: 'password_assets_VerificationPage',
      desc: '',
      args: [],
    );
  }

  /// `Password Access Widget`
  String get password_assets_PasswordAccessWidget {
    return Intl.message(
      'Password Access Widget',
      name: 'password_assets_PasswordAccessWidget',
      desc: '',
      args: [],
    );
  }

  /// `The Password Is Incorrect`
  String get password_assets_IncorrectPassword {
    return Intl.message(
      'The Password Is Incorrect',
      name: 'password_assets_IncorrectPassword',
      desc: '',
      args: [],
    );
  }

  /// `Agree`
  String get password_assets_Agree {
    return Intl.message(
      'Agree',
      name: 'password_assets_Agree',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get password_assets_Verify {
    return Intl.message(
      'Verify',
      name: 'password_assets_Verify',
      desc: '',
      args: [],
    );
  }

  /// `College Of Computer`
  String get register_assets_CollegeOfComputer {
    return Intl.message(
      'College Of Computer',
      name: 'register_assets_CollegeOfComputer',
      desc: '',
      args: [],
    );
  }

  /// `College Of Business Management`
  String get register_assets_CollageOfBusiness {
    return Intl.message(
      'College Of Business Management',
      name: 'register_assets_CollageOfBusiness',
      desc: '',
      args: [],
    );
  }

  /// `Collage Of Islamic Law`
  String get register_assets_CollageOfIslamic {
    return Intl.message(
      'Collage Of Islamic Law',
      name: 'register_assets_CollageOfIslamic',
      desc: '',
      args: [],
    );
  }

  /// `Collage Of Applied Sciences`
  String get register_assets_CollageOfAppliedSciences {
    return Intl.message(
      'Collage Of Applied Sciences',
      name: 'register_assets_CollageOfAppliedSciences',
      desc: '',
      args: [],
    );
  }

  /// `Register A New Device`
  String get register_assets_RegisterNewDevice {
    return Intl.message(
      'Register A New Device',
      name: 'register_assets_RegisterNewDevice',
      desc: '',
      args: [],
    );
  }

  /// `Brand Name`
  String get register_assets_BrandName {
    return Intl.message(
      'Brand Name',
      name: 'register_assets_BrandName',
      desc: '',
      args: [],
    );
  }

  /// `Enter The Brand Name `
  String get register_assets_BrandNameEnter {
    return Intl.message(
      'Enter The Brand Name ',
      name: 'register_assets_BrandNameEnter',
      desc: '',
      args: [],
    );
  }

  /// `OS`
  String get register_assets_OS {
    return Intl.message(
      'OS',
      name: 'register_assets_OS',
      desc: '',
      args: [],
    );
  }

  /// `Enter your own`
  String get register_assets_ExtrsInfo {
    return Intl.message(
      'Enter your own',
      name: 'register_assets_ExtrsInfo',
      desc: '',
      args: [],
    );
  }

  /// `Enter OS Name`
  String get register_assets_EnterOs {
    return Intl.message(
      'Enter OS Name',
      name: 'register_assets_EnterOs',
      desc: '',
      args: [],
    );
  }

  /// `Proceessor`
  String get register_assets_Processor {
    return Intl.message(
      'Proceessor',
      name: 'register_assets_Processor',
      desc: '',
      args: [],
    );
  }

  /// `Enter The Processor Type`
  String get register_assets_ProcessorName {
    return Intl.message(
      'Enter The Processor Type',
      name: 'register_assets_ProcessorName',
      desc: '',
      args: [],
    );
  }

  /// `Hard Disk`
  String get register_assets_HardDisk {
    return Intl.message(
      'Hard Disk',
      name: 'register_assets_HardDisk',
      desc: '',
      args: [],
    );
  }

  /// `Enter The Hard Disk Type`
  String get register_assets_HardDiskNAme {
    return Intl.message(
      'Enter The Hard Disk Type',
      name: 'register_assets_HardDiskNAme',
      desc: '',
      args: [],
    );
  }

  /// `Mac Address`
  String get register_assets_MacAddress {
    return Intl.message(
      'Mac Address',
      name: 'register_assets_MacAddress',
      desc: '',
      args: [],
    );
  }

  /// `Enter The Mac Address`
  String get register_assets_EnterMAcAddress {
    return Intl.message(
      'Enter The Mac Address',
      name: 'register_assets_EnterMAcAddress',
      desc: '',
      args: [],
    );
  }

  /// `Ministerial Number`
  String get register_assets_MinisterialNumber {
    return Intl.message(
      'Ministerial Number',
      name: 'register_assets_MinisterialNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter The Ministerial Number`
  String get register_assets_EnterMinisterialNumber {
    return Intl.message(
      'Enter The Ministerial Number',
      name: 'register_assets_EnterMinisterialNumber',
      desc: '',
      args: [],
    );
  }

  /// `Serial Number`
  String get register_assets_SerialNumber {
    return Intl.message(
      'Serial Number',
      name: 'register_assets_SerialNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter Device Location`
  String get register_assets_EnterDeviceLocation {
    return Intl.message(
      'Enter Device Location',
      name: 'register_assets_EnterDeviceLocation',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get register_assets_Location {
    return Intl.message(
      'Location',
      name: 'register_assets_Location',
      desc: '',
      args: [],
    );
  }

  /// `Enter The Serial Number`
  String get register_assets_EnterSerialNumber {
    return Intl.message(
      'Enter The Serial Number',
      name: 'register_assets_EnterSerialNumber',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get register_assets_Sent {
    return Intl.message(
      'Send',
      name: 'register_assets_Sent',
      desc: '',
      args: [],
    );
  }

  /// `To Be Able To Sumbit A Report \n Please Fill Out All Fields`
  String get register_assets_AbleToSumbitReport {
    return Intl.message(
      'To Be Able To Sumbit A Report \n Please Fill Out All Fields',
      name: 'register_assets_AbleToSumbitReport',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get register_assets_Ok {
    return Intl.message(
      'OK',
      name: 'register_assets_Ok',
      desc: '',
      args: [],
    );
  }

  /// `Thanks For Your Cooperation !`
  String get register_assets_Ty4Cooperation {
    return Intl.message(
      'Thanks For Your Cooperation !',
      name: 'register_assets_Ty4Cooperation',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get account_setting_Settings {
    return Intl.message(
      'Settings',
      name: 'account_setting_Settings',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get account_setting_Notifications {
    return Intl.message(
      'Notifications',
      name: 'account_setting_Notifications',
      desc: '',
      args: [],
    );
  }

  /// `Edit Password`
  String get account_setting_EditPassword {
    return Intl.message(
      'Edit Password',
      name: 'account_setting_EditPassword',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get account_setting_Language {
    return Intl.message(
      'Language',
      name: 'account_setting_Language',
      desc: '',
      args: [],
    );
  }

  /// `Change Theme`
  String get account_setting_ChangeTheme {
    return Intl.message(
      'Change Theme',
      name: 'account_setting_ChangeTheme',
      desc: '',
      args: [],
    );
  }

  /// ` Who We Are`
  String get account_setting_WhoAreWe {
    return Intl.message(
      ' Who We Are',
      name: 'account_setting_WhoAreWe',
      desc: '',
      args: [],
    );
  }

  /// `User Data`
  String get it_settings_UserData {
    return Intl.message(
      'User Data',
      name: 'it_settings_UserData',
      desc: '',
      args: [],
    );
  }

  /// `UserName`
  String get it_settings_UserName {
    return Intl.message(
      'UserName',
      name: 'it_settings_UserName',
      desc: '',
      args: [],
    );
  }

  /// `Job Number`
  String get it_settings_JobNumber {
    return Intl.message(
      'Job Number',
      name: 'it_settings_JobNumber',
      desc: '',
      args: [],
    );
  }

  /// `Company Name`
  String get it_settings_CompanyName {
    return Intl.message(
      'Company Name',
      name: 'it_settings_CompanyName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get it_settings_Email {
    return Intl.message(
      'Email',
      name: 'it_settings_Email',
      desc: '',
      args: [],
    );
  }

  /// `Job postion`
  String get it_settings_Jobpostion {
    return Intl.message(
      'Job postion',
      name: 'it_settings_Jobpostion',
      desc: '',
      args: [],
    );
  }

  /// `Technical Support Employee `
  String get it_settings_TechnicalSupportEmployee {
    return Intl.message(
      'Technical Support Employee ',
      name: 'it_settings_TechnicalSupportEmployee',
      desc: '',
      args: [],
    );
  }

  /// `Employee`
  String get it_settings_Employee {
    return Intl.message(
      'Employee',
      name: 'it_settings_Employee',
      desc: '',
      args: [],
    );
  }

  /// `First Name `
  String get it_settings_FirstName {
    return Intl.message(
      'First Name ',
      name: 'it_settings_FirstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get it_settings_LastName {
    return Intl.message(
      'Last Name',
      name: 'it_settings_LastName',
      desc: '',
      args: [],
    );
  }

  /// `Opss`
  String get it_settings_Opss {
    return Intl.message(
      'Opss',
      name: 'it_settings_Opss',
      desc: '',
      args: [],
    );
  }

  /// `There Is An Erorr, The Service Is Currently Unvailable`
  String get chat_main_ErorrInService {
    return Intl.message(
      'There Is An Erorr, The Service Is Currently Unvailable',
      name: 'chat_main_ErorrInService',
      desc: '',
      args: [],
    );
  }

  /// `I am Your Smart Assistant , Please Describe Your Problem, And I Will Try To Solve It`
  String get chat_main_IamSmartAssistant {
    return Intl.message(
      'I am Your Smart Assistant , Please Describe Your Problem, And I Will Try To Solve It',
      name: 'chat_main_IamSmartAssistant',
      desc: '',
      args: [],
    );
  }

  /// `Smart Assistant`
  String get chat_main_IamSmart {
    return Intl.message(
      'Smart Assistant',
      name: 'chat_main_IamSmart',
      desc: '',
      args: [],
    );
  }

  /// `Hello,`
  String get chat_main_Hello {
    return Intl.message(
      'Hello,',
      name: 'chat_main_Hello',
      desc: '',
      args: [],
    );
  }

  /// `Device Information`
  String get qr_sacnnerpage_DeviceInfo {
    return Intl.message(
      'Device Information',
      name: 'qr_sacnnerpage_DeviceInfo',
      desc: '',
      args: [],
    );
  }

  /// `Submit A Report`
  String get qr_sacnnerpage_SumbitReport {
    return Intl.message(
      'Submit A Report',
      name: 'qr_sacnnerpage_SumbitReport',
      desc: '',
      args: [],
    );
  }

  /// `Ignore`
  String get qr_sacnnerpage_Ignore {
    return Intl.message(
      'Ignore',
      name: 'qr_sacnnerpage_Ignore',
      desc: '',
      args: [],
    );
  }

  /// `Home Page`
  String get home_page_and_bar_HomePage {
    return Intl.message(
      'Home Page',
      name: 'home_page_and_bar_HomePage',
      desc: '',
      args: [],
    );
  }

  /// `PTM \n To Make It Easy`
  String get home_page_and_bar_PTM2Make {
    return Intl.message(
      'PTM \n To Make It Easy',
      name: 'home_page_and_bar_PTM2Make',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get home_page_and_bar_PersonalInfo {
    return Intl.message(
      'Personal Information',
      name: 'home_page_and_bar_PersonalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Maintenance`
  String get home_page_and_bar_Maintenance {
    return Intl.message(
      'Maintenance',
      name: 'home_page_and_bar_Maintenance',
      desc: '',
      args: [],
    );
  }

  /// ` Contact Us `
  String get home_page_and_bar_WayContact {
    return Intl.message(
      ' Contact Us ',
      name: 'home_page_and_bar_WayContact',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get home_page_and_bar_Settings {
    return Intl.message(
      'Settings',
      name: 'home_page_and_bar_Settings',
      desc: '',
      args: [],
    );
  }

  /// ` Sign Out`
  String get home_page_and_bar_SignOut {
    return Intl.message(
      ' Sign Out',
      name: 'home_page_and_bar_SignOut',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get home_page_and_bar_Reports {
    return Intl.message(
      'Reports',
      name: 'home_page_and_bar_Reports',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get home_page_and_bar_Chat {
    return Intl.message(
      'Chat',
      name: 'home_page_and_bar_Chat',
      desc: '',
      args: [],
    );
  }

  /// `Qr Scanner`
  String get home_page_and_bar_QrScanner {
    return Intl.message(
      'Qr Scanner',
      name: 'home_page_and_bar_QrScanner',
      desc: '',
      args: [],
    );
  }

  /// `Ways To Contact With Us`
  String get how_are_we_WayContact {
    return Intl.message(
      'Ways To Contact With Us',
      name: 'how_are_we_WayContact',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get how_are_we_Email {
    return Intl.message(
      'Email',
      name: 'how_are_we_Email',
      desc: '',
      args: [],
    );
  }

  /// `phone number`
  String get how_are_we_phonenumber {
    return Intl.message(
      'phone number',
      name: 'how_are_we_phonenumber',
      desc: '',
      args: [],
    );
  }

  /// `Twitter`
  String get how_are_we_Twitter {
    return Intl.message(
      'Twitter',
      name: 'how_are_we_Twitter',
      desc: '',
      args: [],
    );
  }

  /// `User Data`
  String get user_data_UserData {
    return Intl.message(
      'User Data',
      name: 'user_data_UserData',
      desc: '',
      args: [],
    );
  }

  /// `UserName`
  String get user_data_UserName {
    return Intl.message(
      'UserName',
      name: 'user_data_UserName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get user_data_Email {
    return Intl.message(
      'Email',
      name: 'user_data_Email',
      desc: '',
      args: [],
    );
  }

  /// `Beneficiary`
  String get user_data_Beneficiary {
    return Intl.message(
      'Beneficiary',
      name: 'user_data_Beneficiary',
      desc: '',
      args: [],
    );
  }

  /// `Job Position`
  String get user_data_JobPostion {
    return Intl.message(
      'Job Position',
      name: 'user_data_JobPostion',
      desc: '',
      args: [],
    );
  }

  /// `To Be Able To Help You \n Please Fill Out All Fields`
  String get user_report_details_page_FillFields {
    return Intl.message(
      'To Be Able To Help You \n Please Fill Out All Fields',
      name: 'user_report_details_page_FillFields',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get user_report_details_page_Ok {
    return Intl.message(
      'OK',
      name: 'user_report_details_page_Ok',
      desc: '',
      args: [],
    );
  }

  /// `The Soultion Will Be Provided As Soon As Possible \n Thank You For Your Cooperation`
  String get user_report_details_page_solutionProvided {
    return Intl.message(
      'The Soultion Will Be Provided As Soon As Possible \n Thank You For Your Cooperation',
      name: 'user_report_details_page_solutionProvided',
      desc: '',
      args: [],
    );
  }

  /// `The Report Has Been Sent`
  String get user_report_details_page_ReportSent {
    return Intl.message(
      'The Report Has Been Sent',
      name: 'user_report_details_page_ReportSent',
      desc: '',
      args: [],
    );
  }

  /// `Submit A Report`
  String get user_report_details_page_SubmitReport {
    return Intl.message(
      'Submit A Report',
      name: 'user_report_details_page_SubmitReport',
      desc: '',
      args: [],
    );
  }

  /// `All Fields Must Be Filled It With Correct Data So That We Can Help You As Quickly As Possible`
  String get user_report_details_page_FillWithCorrectInfo {
    return Intl.message(
      'All Fields Must Be Filled It With Correct Data So That We Can Help You As Quickly As Possible',
      name: 'user_report_details_page_FillWithCorrectInfo',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get user_report_details_page_Location {
    return Intl.message(
      'Location',
      name: 'user_report_details_page_Location',
      desc: '',
      args: [],
    );
  }

  /// `Enter Laboratory Name`
  String get user_report_details_page_EnterLabName {
    return Intl.message(
      'Enter Laboratory Name',
      name: 'user_report_details_page_EnterLabName',
      desc: '',
      args: [],
    );
  }

  /// `Entre Device Number`
  String get user_report_details_page_EntreDeviceNumber {
    return Intl.message(
      'Entre Device Number',
      name: 'user_report_details_page_EntreDeviceNumber',
      desc: '',
      args: [],
    );
  }

  /// `Device Number`
  String get user_report_details_page_DeviceNumber {
    return Intl.message(
      'Device Number',
      name: 'user_report_details_page_DeviceNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter A Description Of The Problem`
  String get user_report_details_page_EnterDecriptionOfProblem {
    return Intl.message(
      'Enter A Description Of The Problem',
      name: 'user_report_details_page_EnterDecriptionOfProblem',
      desc: '',
      args: [],
    );
  }

  /// `Description Of Problem`
  String get user_report_details_page_DescriptionOfProblem {
    return Intl.message(
      'Description Of Problem',
      name: 'user_report_details_page_DescriptionOfProblem',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get user_report_details_page_Sent {
    return Intl.message(
      'Send',
      name: 'user_report_details_page_Sent',
      desc: '',
      args: [],
    );
  }

  /// `To Help You As Quickly As Possible \n Here is A report To It Support`
  String get user_report_first_page_ToHelpYouQuickly {
    return Intl.message(
      'To Help You As Quickly As Possible \n Here is A report To It Support',
      name: 'user_report_first_page_ToHelpYouQuickly',
      desc: '',
      args: [],
    );
  }

  /// `Submit Report`
  String get user_report_first_page_SubmitReport {
    return Intl.message(
      'Submit Report',
      name: 'user_report_first_page_SubmitReport',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get setting_page_Settings {
    return Intl.message(
      'Settings',
      name: 'setting_page_Settings',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get setting_page_Notifications {
    return Intl.message(
      'Notifications',
      name: 'setting_page_Notifications',
      desc: '',
      args: [],
    );
  }

  /// `Edit Password`
  String get setting_page_EditPassword {
    return Intl.message(
      'Edit Password',
      name: 'setting_page_EditPassword',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get setting_page_Language {
    return Intl.message(
      'Language',
      name: 'setting_page_Language',
      desc: '',
      args: [],
    );
  }

  /// `Change Theme`
  String get setting_page_ChangeTheme {
    return Intl.message(
      'Change Theme',
      name: 'setting_page_ChangeTheme',
      desc: '',
      args: [],
    );
  }

  /// `Report Details`
  String get it_display_report_page_ReportDetails {
    return Intl.message(
      'Report Details',
      name: 'it_display_report_page_ReportDetails',
      desc: '',
      args: [],
    );
  }

  /// `Erorr`
  String get it_display_report_page_Erorr {
    return Intl.message(
      'Erorr',
      name: 'it_display_report_page_Erorr',
      desc: '',
      args: [],
    );
  }

  /// `No Report Details`
  String get it_display_report_page_NoReportDetails {
    return Intl.message(
      'No Report Details',
      name: 'it_display_report_page_NoReportDetails',
      desc: '',
      args: [],
    );
  }

  /// ` Report Number`
  String get it_display_report_page_ReportNum {
    return Intl.message(
      ' Report Number',
      name: 'it_display_report_page_ReportNum',
      desc: '',
      args: [],
    );
  }

  /// `Device Number `
  String get it_display_report_page_DeviceNum {
    return Intl.message(
      'Device Number ',
      name: 'it_display_report_page_DeviceNum',
      desc: '',
      args: [],
    );
  }

  /// `Device`
  String get it_display_report_page_Device {
    return Intl.message(
      'Device',
      name: 'it_display_report_page_Device',
      desc: '',
      args: [],
    );
  }

  /// `No Descripiton Available`
  String get it_display_report_page_NoDescription {
    return Intl.message(
      'No Descripiton Available',
      name: 'it_display_report_page_NoDescription',
      desc: '',
      args: [],
    );
  }

  /// `Start Date Of Report`
  String get it_display_report_page_StartDateOfReport {
    return Intl.message(
      'Start Date Of Report',
      name: 'it_display_report_page_StartDateOfReport',
      desc: '',
      args: [],
    );
  }

  /// `End Date Of Report`
  String get it_display_report_page_EndDateOfReport {
    return Intl.message(
      'End Date Of Report',
      name: 'it_display_report_page_EndDateOfReport',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get it_display_report_page_Date {
    return Intl.message(
      'Date',
      name: 'it_display_report_page_Date',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get it_display_report_page_Location {
    return Intl.message(
      'Location',
      name: 'it_display_report_page_Location',
      desc: '',
      args: [],
    );
  }

  /// `No Location`
  String get it_display_report_page_NoLocation {
    return Intl.message(
      'No Location',
      name: 'it_display_report_page_NoLocation',
      desc: '',
      args: [],
    );
  }

  /// `Laboratory Location`
  String get it_display_report_page_LabLocation {
    return Intl.message(
      'Laboratory Location',
      name: 'it_display_report_page_LabLocation',
      desc: '',
      args: [],
    );
  }

  /// `Contact Information`
  String get it_display_report_page_ConatctInformation {
    return Intl.message(
      'Contact Information',
      name: 'it_display_report_page_ConatctInformation',
      desc: '',
      args: [],
    );
  }

  /// `Descripiton Of The Problem `
  String get it_display_report_page_DescriptionOfTheProblem {
    return Intl.message(
      'Descripiton Of The Problem ',
      name: 'it_display_report_page_DescriptionOfTheProblem',
      desc: '',
      args: [],
    );
  }

  /// `problem solution`
  String get it_display_report_page_ProblemSolution {
    return Intl.message(
      'problem solution',
      name: 'it_display_report_page_ProblemSolution',
      desc: '',
      args: [],
    );
  }

  /// `Problem Sloution Report`
  String get it_display_reports_page_ProblemSolutionReports {
    return Intl.message(
      'Problem Sloution Report',
      name: 'it_display_reports_page_ProblemSolutionReports',
      desc: '',
      args: [],
    );
  }

  /// `Erorr`
  String get it_display_reports_page_Erorr {
    return Intl.message(
      'Erorr',
      name: 'it_display_reports_page_Erorr',
      desc: '',
      args: [],
    );
  }

  /// `No Reports`
  String get it_display_reports_page_NoReports {
    return Intl.message(
      'No Reports',
      name: 'it_display_reports_page_NoReports',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get it_display_reports_page_Date {
    return Intl.message(
      'Date',
      name: 'it_display_reports_page_Date',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get it_display_reports_page_Location {
    return Intl.message(
      'Location',
      name: 'it_display_reports_page_Location',
      desc: '',
      args: [],
    );
  }

  /// `Undefined `
  String get it_display_reports_page_Undefined {
    return Intl.message(
      'Undefined ',
      name: 'it_display_reports_page_Undefined',
      desc: '',
      args: [],
    );
  }

  /// `Show Report`
  String get it_display_reports_page_ShowReport {
    return Intl.message(
      'Show Report',
      name: 'it_display_reports_page_ShowReport',
      desc: '',
      args: [],
    );
  }

  /// `Report Details`
  String get it_display_report_received_ReportDetails {
    return Intl.message(
      'Report Details',
      name: 'it_display_report_received_ReportDetails',
      desc: '',
      args: [],
    );
  }

  /// `No Report Details   `
  String get it_display_report_received_NoReportDetails {
    return Intl.message(
      'No Report Details   ',
      name: 'it_display_report_received_NoReportDetails',
      desc: '',
      args: [],
    );
  }

  /// ` Report Number`
  String get it_display_report_received_ReportNum {
    return Intl.message(
      ' Report Number',
      name: 'it_display_report_received_ReportNum',
      desc: '',
      args: [],
    );
  }

  /// `No Location`
  String get it_display_report_received_NoLocation {
    return Intl.message(
      'No Location',
      name: 'it_display_report_received_NoLocation',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get it_display_report_received_Date {
    return Intl.message(
      'Date',
      name: 'it_display_report_received_Date',
      desc: '',
      args: [],
    );
  }

  /// `Device Number`
  String get it_display_report_received_DeviceNumber {
    return Intl.message(
      'Device Number',
      name: 'it_display_report_received_DeviceNumber',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get it_display_report_received_Location {
    return Intl.message(
      'Location',
      name: 'it_display_report_received_Location',
      desc: '',
      args: [],
    );
  }

  /// `No Device Number`
  String get it_display_report_received_NoDeviceNumber {
    return Intl.message(
      'No Device Number',
      name: 'it_display_report_received_NoDeviceNumber',
      desc: '',
      args: [],
    );
  }

  /// `Laboratory Location`
  String get it_display_report_received_LabLocation {
    return Intl.message(
      'Laboratory Location',
      name: 'it_display_report_received_LabLocation',
      desc: '',
      args: [],
    );
  }

  /// `Contact Information`
  String get it_display_report_received_ContactInformation {
    return Intl.message(
      'Contact Information',
      name: 'it_display_report_received_ContactInformation',
      desc: '',
      args: [],
    );
  }

  /// `Descripiton Of The  Problem`
  String get it_display_report_received_DescriptionOfTheProblem {
    return Intl.message(
      'Descripiton Of The  Problem',
      name: 'it_display_report_received_DescriptionOfTheProblem',
      desc: '',
      args: [],
    );
  }

  /// `No Description  Available`
  String get it_display_report_received_NoDescription {
    return Intl.message(
      'No Description  Available',
      name: 'it_display_report_received_NoDescription',
      desc: '',
      args: [],
    );
  }

  /// `Please Attach Details Of problem solution`
  String get it_display_report_received_AttachDetailsOfSolutionProblem {
    return Intl.message(
      'Please Attach Details Of problem solution',
      name: 'it_display_report_received_AttachDetailsOfSolutionProblem',
      desc: '',
      args: [],
    );
  }

  /// `You Must Write Report`
  String get it_display_report_received_YouMustWriteReport {
    return Intl.message(
      'You Must Write Report',
      name: 'it_display_report_received_YouMustWriteReport',
      desc: '',
      args: [],
    );
  }

  /// `Thanks For Your Cooperation`
  String get it_display_report_received_Thanks4YouCooperation {
    return Intl.message(
      'Thanks For Your Cooperation',
      name: 'it_display_report_received_Thanks4YouCooperation',
      desc: '',
      args: [],
    );
  }

  /// `Thanks`
  String get it_display_report_received_Thanks {
    return Intl.message(
      'Thanks',
      name: 'it_display_report_received_Thanks',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get it_display_report_received_Agree {
    return Intl.message(
      'OK',
      name: 'it_display_report_received_Agree',
      desc: '',
      args: [],
    );
  }

  /// `Finish The Order`
  String get it_display_report_received_FinishTheOrder {
    return Intl.message(
      'Finish The Order',
      name: 'it_display_report_received_FinishTheOrder',
      desc: '',
      args: [],
    );
  }

  /// `Return The Report`
  String get it_display_report_received_ReturnTheReport {
    return Intl.message(
      'Return The Report',
      name: 'it_display_report_received_ReturnTheReport',
      desc: '',
      args: [],
    );
  }

  /// `Here is the evaluation of the service provided to you by technical support. We hope that there is credibility in the evaluation process so that the matter does not affect the employees.`
  String get it_display_report_received_HereYouReturnTheReport {
    return Intl.message(
      'Here is the evaluation of the service provided to you by technical support. We hope that there is credibility in the evaluation process so that the matter does not affect the employees.',
      name: 'it_display_report_received_HereYouReturnTheReport',
      desc: '',
      args: [],
    );
  }

  /// `The Report Was Returned Successfully`
  String get it_display_report_received_TheReportWasReturnedSuccessfully {
    return Intl.message(
      'The Report Was Returned Successfully',
      name: 'it_display_report_received_TheReportWasReturnedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `The Reorder Has Been Completed`
  String get it_display_report_received_TheReorderHasBeenCompleted {
    return Intl.message(
      'The Reorder Has Been Completed',
      name: 'it_display_report_received_TheReorderHasBeenCompleted',
      desc: '',
      args: [],
    );
  }

  /// `No Reports`
  String get it_reports_received_NoReport {
    return Intl.message(
      'No Reports',
      name: 'it_reports_received_NoReport',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get it_reports_received_Date {
    return Intl.message(
      'Date',
      name: 'it_reports_received_Date',
      desc: '',
      args: [],
    );
  }

  /// `High`
  String get it_reports_received_High {
    return Intl.message(
      'High',
      name: 'it_reports_received_High',
      desc: '',
      args: [],
    );
  }

  /// `Mid`
  String get it_reports_received_Mid {
    return Intl.message(
      'Mid',
      name: 'it_reports_received_Mid',
      desc: '',
      args: [],
    );
  }

  /// `Low`
  String get it_reports_received_Low {
    return Intl.message(
      'Low',
      name: 'it_reports_received_Low',
      desc: '',
      args: [],
    );
  }

  /// `Report Number`
  String get it_reports_received_ReportNumber {
    return Intl.message(
      'Report Number',
      name: 'it_reports_received_ReportNumber',
      desc: '',
      args: [],
    );
  }

  /// `No Location`
  String get it_reports_received_NoLocation {
    return Intl.message(
      'No Location',
      name: 'it_reports_received_NoLocation',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get it_reports_received_Location {
    return Intl.message(
      'Location',
      name: 'it_reports_received_Location',
      desc: '',
      args: [],
    );
  }

  /// `Report Date`
  String get it_reports_received_ReportDate {
    return Intl.message(
      'Report Date',
      name: 'it_reports_received_ReportDate',
      desc: '',
      args: [],
    );
  }

  /// `Report Location`
  String get it_reports_received_ReportLocation {
    return Intl.message(
      'Report Location',
      name: 'it_reports_received_ReportLocation',
      desc: '',
      args: [],
    );
  }

  /// `Dateils Report Number`
  String get device_dateils_report_DateilsReportNumber {
    return Intl.message(
      'Dateils Report Number',
      name: 'device_dateils_report_DateilsReportNumber',
      desc: '',
      args: [],
    );
  }

  /// `No Reports`
  String get device_dateils_report_NoReports {
    return Intl.message(
      'No Reports',
      name: 'device_dateils_report_NoReports',
      desc: '',
      args: [],
    );
  }

  /// `Report Number`
  String get device_dateils_report_ReportNumber {
    return Intl.message(
      'Report Number',
      name: 'device_dateils_report_ReportNumber',
      desc: '',
      args: [],
    );
  }

  /// `No Location`
  String get device_dateils_report_NoLocation {
    return Intl.message(
      'No Location',
      name: 'device_dateils_report_NoLocation',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get device_dateils_report_Date {
    return Intl.message(
      'Date',
      name: 'device_dateils_report_Date',
      desc: '',
      args: [],
    );
  }

  /// `Device Number`
  String get device_dateils_report_DeviceNumber {
    return Intl.message(
      'Device Number',
      name: 'device_dateils_report_DeviceNumber',
      desc: '',
      args: [],
    );
  }

  /// `Device`
  String get device_dateils_report_Device {
    return Intl.message(
      'Device',
      name: 'device_dateils_report_Device',
      desc: '',
      args: [],
    );
  }

  /// `No Device Number`
  String get device_dateils_report_NoDeviceNumber {
    return Intl.message(
      'No Device Number',
      name: 'device_dateils_report_NoDeviceNumber',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get device_dateils_report_Location {
    return Intl.message(
      'Location',
      name: 'device_dateils_report_Location',
      desc: '',
      args: [],
    );
  }

  /// `Contact Information`
  String get device_dateils_report_ContactInformation {
    return Intl.message(
      'Contact Information',
      name: 'device_dateils_report_ContactInformation',
      desc: '',
      args: [],
    );
  }

  /// `Laboratory Location`
  String get device_dateils_report_LabLocation {
    return Intl.message(
      'Laboratory Location',
      name: 'device_dateils_report_LabLocation',
      desc: '',
      args: [],
    );
  }

  /// `Descripiton Of The Problem`
  String get device_dateils_report_DescriptionOfProblem {
    return Intl.message(
      'Descripiton Of The Problem',
      name: 'device_dateils_report_DescriptionOfProblem',
      desc: '',
      args: [],
    );
  }

  /// `Problem`
  String get device_dateils_report_Problem {
    return Intl.message(
      'Problem',
      name: 'device_dateils_report_Problem',
      desc: '',
      args: [],
    );
  }

  /// `The Report Has Been Received Thanks For Your Cooperation`
  String get device_dateils_report_TheReportHasBeenReceivedTy4Cooperation {
    return Intl.message(
      'The Report Has Been Received Thanks For Your Cooperation',
      name: 'device_dateils_report_TheReportHasBeenReceivedTy4Cooperation',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get device_dateils_report_Agree {
    return Intl.message(
      'OK',
      name: 'device_dateils_report_Agree',
      desc: '',
      args: [],
    );
  }

  /// `The Order Has Been Received`
  String get device_dateils_report_TheOrderHasBeenReceived {
    return Intl.message(
      'The Order Has Been Received',
      name: 'device_dateils_report_TheOrderHasBeenReceived',
      desc: '',
      args: [],
    );
  }

  /// `Receiving The Order`
  String get device_dateils_report_ReceivingTheOrder {
    return Intl.message(
      'Receiving The Order',
      name: 'device_dateils_report_ReceivingTheOrder',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get device_display_reports_Previous {
    return Intl.message(
      'Previous',
      name: 'device_display_reports_Previous',
      desc: '',
      args: [],
    );
  }

  /// `Recent`
  String get device_display_reports_Recent {
    return Intl.message(
      'Recent',
      name: 'device_display_reports_Recent',
      desc: '',
      args: [],
    );
  }

  /// `No Reports`
  String get device_display_reports_NoReport {
    return Intl.message(
      'No Reports',
      name: 'device_display_reports_NoReport',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get device_display_reports_Date {
    return Intl.message(
      'Date',
      name: 'device_display_reports_Date',
      desc: '',
      args: [],
    );
  }

  /// `High`
  String get device_display_reports_High {
    return Intl.message(
      'High',
      name: 'device_display_reports_High',
      desc: '',
      args: [],
    );
  }

  /// `Mid`
  String get device_display_reports_Mid {
    return Intl.message(
      'Mid',
      name: 'device_display_reports_Mid',
      desc: '',
      args: [],
    );
  }

  /// `Low`
  String get device_display_reports_Low1 {
    return Intl.message(
      'Low',
      name: 'device_display_reports_Low1',
      desc: '',
      args: [],
    );
  }

  /// `Report Date`
  String get device_display_reports_ReportDate {
    return Intl.message(
      'Report Date',
      name: 'device_display_reports_ReportDate',
      desc: '',
      args: [],
    );
  }

  /// `No Location`
  String get device_display_reports_NoLocation {
    return Intl.message(
      'No Location',
      name: 'device_display_reports_NoLocation',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get device_display_reports_Location {
    return Intl.message(
      'Location',
      name: 'device_display_reports_Location',
      desc: '',
      args: [],
    );
  }

  /// `Report Number`
  String get device_display_reports_ReportNumber {
    return Intl.message(
      'Report Number',
      name: 'device_display_reports_ReportNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please fill out all fields`
  String get ditels_user_minitines_FillAllFields {
    return Intl.message(
      'Please fill out all fields',
      name: 'ditels_user_minitines_FillAllFields',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ditels_user_minitines_Ok {
    return Intl.message(
      'OK',
      name: 'ditels_user_minitines_Ok',
      desc: '',
      args: [],
    );
  }

  /// `Thanks For Your Cooperation`
  String get ditels_user_minitines_Thanks4YourCooperation {
    return Intl.message(
      'Thanks For Your Cooperation',
      name: 'ditels_user_minitines_Thanks4YourCooperation',
      desc: '',
      args: [],
    );
  }

  /// `Been Sent`
  String get ditels_user_minitines_BeenSent {
    return Intl.message(
      'Been Sent',
      name: 'ditels_user_minitines_BeenSent',
      desc: '',
      args: [],
    );
  }

  /// `Maintenance Details`
  String get ditels_user_minitines_MaintenanceDetails {
    return Intl.message(
      'Maintenance Details',
      name: 'ditels_user_minitines_MaintenanceDetails',
      desc: '',
      args: [],
    );
  }

  /// `Erorr`
  String get ditels_user_minitines_Erorr {
    return Intl.message(
      'Erorr',
      name: 'ditels_user_minitines_Erorr',
      desc: '',
      args: [],
    );
  }

  /// `No Details Maintenance`
  String get ditels_user_minitines_NoDetailsMaintenance {
    return Intl.message(
      'No Details Maintenance',
      name: 'ditels_user_minitines_NoDetailsMaintenance',
      desc: '',
      args: [],
    );
  }

  /// `Report Number`
  String get ditels_user_minitines_ReportNumber {
    return Intl.message(
      'Report Number',
      name: 'ditels_user_minitines_ReportNumber',
      desc: '',
      args: [],
    );
  }

  /// `Start Date Of Report`
  String get ditels_user_minitines_StartDateOfReport {
    return Intl.message(
      'Start Date Of Report',
      name: 'ditels_user_minitines_StartDateOfReport',
      desc: '',
      args: [],
    );
  }

  /// `End Date Of Report`
  String get ditels_user_minitines_EndDateOfReport {
    return Intl.message(
      'End Date Of Report',
      name: 'ditels_user_minitines_EndDateOfReport',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get ditels_user_minitines_Location {
    return Intl.message(
      'Location',
      name: 'ditels_user_minitines_Location',
      desc: '',
      args: [],
    );
  }

  /// `Building`
  String get ditels_user_minitines_Buliding {
    return Intl.message(
      'Building',
      name: 'ditels_user_minitines_Buliding',
      desc: '',
      args: [],
    );
  }

  /// `Descripiton Of The Problem`
  String get ditels_user_minitines_DescriptionOfProblem {
    return Intl.message(
      'Descripiton Of The Problem',
      name: 'ditels_user_minitines_DescriptionOfProblem',
      desc: '',
      args: [],
    );
  }

  /// `No Description Available`
  String get ditels_user_minitines_NoDescription {
    return Intl.message(
      'No Description Available',
      name: 'ditels_user_minitines_NoDescription',
      desc: '',
      args: [],
    );
  }

  /// `Conatct Information`
  String get ditels_user_minitines_ContactInformation {
    return Intl.message(
      'Conatct Information',
      name: 'ditels_user_minitines_ContactInformation',
      desc: '',
      args: [],
    );
  }

  /// `problem Solve`
  String get ditels_user_minitines_ProblemSolution {
    return Intl.message(
      'problem Solve',
      name: 'ditels_user_minitines_ProblemSolution',
      desc: '',
      args: [],
    );
  }

  /// `Service Evaluation`
  String get ditels_user_minitines_ServiceEvaluation {
    return Intl.message(
      'Service Evaluation',
      name: 'ditels_user_minitines_ServiceEvaluation',
      desc: '',
      args: [],
    );
  }

  /// `Here is the evaluation of the service provided to you by technical support. We hope that there is credibility in the evaluation process so that the matter does not affect the employees.`
  String get ditels_user_minitines_EvaluateTheServiceHonestly {
    return Intl.message(
      'Here is the evaluation of the service provided to you by technical support. We hope that there is credibility in the evaluation process so that the matter does not affect the employees.',
      name: 'ditels_user_minitines_EvaluateTheServiceHonestly',
      desc: '',
      args: [],
    );
  }

  /// `Enter The Service Description`
  String get ditels_user_minitines_EnterTheServiceDescription {
    return Intl.message(
      'Enter The Service Description',
      name: 'ditels_user_minitines_EnterTheServiceDescription',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get ditels_user_minitines_Sent {
    return Intl.message(
      'Send',
      name: 'ditels_user_minitines_Sent',
      desc: '',
      args: [],
    );
  }

  /// `Click Here To Show Contact Information`
  String get ditels_user_minitines_ClickHereToViewContactInformation {
    return Intl.message(
      'Click Here To Show Contact Information',
      name: 'ditels_user_minitines_ClickHereToViewContactInformation',
      desc: '',
      args: [],
    );
  }

  /// `Completed Maintenance`
  String get user_mainitines_CompletedMaintenance {
    return Intl.message(
      'Completed Maintenance',
      name: 'user_mainitines_CompletedMaintenance',
      desc: '',
      args: [],
    );
  }

  /// `Erorr`
  String get user_mainitines_Erorr {
    return Intl.message(
      'Erorr',
      name: 'user_mainitines_Erorr',
      desc: '',
      args: [],
    );
  }

  /// `No Reports`
  String get user_mainitines_NoReports {
    return Intl.message(
      'No Reports',
      name: 'user_mainitines_NoReports',
      desc: '',
      args: [],
    );
  }

  /// `Report Number`
  String get user_mainitines_ReportNumber {
    return Intl.message(
      'Report Number',
      name: 'user_mainitines_ReportNumber',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get user_mainitines_Location {
    return Intl.message(
      'Location',
      name: 'user_mainitines_Location',
      desc: '',
      args: [],
    );
  }

  /// `Undefined`
  String get user_mainitines_Undefined {
    return Intl.message(
      'Undefined',
      name: 'user_mainitines_Undefined',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get user_mainitines_Date {
    return Intl.message(
      'Date',
      name: 'user_mainitines_Date',
      desc: '',
      args: [],
    );
  }

  /// `Show Report`
  String get user_mainitines_ShowReport {
    return Intl.message(
      'Show Report',
      name: 'user_mainitines_ShowReport',
      desc: '',
      args: [],
    );
  }

  /// `Please fill out all fields`
  String get user_report_problem_ditels_FillAllFields {
    return Intl.message(
      'Please fill out all fields',
      name: 'user_report_problem_ditels_FillAllFields',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get user_report_problem_ditels_Ok {
    return Intl.message(
      'OK',
      name: 'user_report_problem_ditels_Ok',
      desc: '',
      args: [],
    );
  }

  /// `Thanks For Your Cooperation`
  String get user_report_problem_ditels_ThanksForYourCooperation {
    return Intl.message(
      'Thanks For Your Cooperation',
      name: 'user_report_problem_ditels_ThanksForYourCooperation',
      desc: '',
      args: [],
    );
  }

  /// `Sent Successfully`
  String get user_report_problem_ditels_SentSuccessfully {
    return Intl.message(
      'Sent Successfully',
      name: 'user_report_problem_ditels_SentSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Maintenance Received Not Completed`
  String get user_report_problem_ditels_TheMaintenanceReceivedIsNotCompleted {
    return Intl.message(
      'Maintenance Received Not Completed',
      name: 'user_report_problem_ditels_TheMaintenanceReceivedIsNotCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Erorr`
  String get user_report_problem_ditels_Erorr {
    return Intl.message(
      'Erorr',
      name: 'user_report_problem_ditels_Erorr',
      desc: '',
      args: [],
    );
  }

  /// `No Maintenance Dateils`
  String get user_report_problem_ditels_NoMaintenanceDateils {
    return Intl.message(
      'No Maintenance Dateils',
      name: 'user_report_problem_ditels_NoMaintenanceDateils',
      desc: '',
      args: [],
    );
  }

  /// `Report Number`
  String get user_report_problem_ditels_ReportNumber {
    return Intl.message(
      'Report Number',
      name: 'user_report_problem_ditels_ReportNumber',
      desc: '',
      args: [],
    );
  }

  /// `Report Date`
  String get user_report_problem_ditels_ReportDate {
    return Intl.message(
      'Report Date',
      name: 'user_report_problem_ditels_ReportDate',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get user_report_problem_ditels_Location {
    return Intl.message(
      'Location',
      name: 'user_report_problem_ditels_Location',
      desc: '',
      args: [],
    );
  }

  /// `Building`
  String get user_report_problem_ditels_Building {
    return Intl.message(
      'Building',
      name: 'user_report_problem_ditels_Building',
      desc: '',
      args: [],
    );
  }

  /// `Conatct Information`
  String get user_report_problem_ditels_ContactInformation {
    return Intl.message(
      'Conatct Information',
      name: 'user_report_problem_ditels_ContactInformation',
      desc: '',
      args: [],
    );
  }

  /// `Descripiton Of The Problem`
  String get user_report_problem_ditels_DescripitonOfTheProblem {
    return Intl.message(
      'Descripiton Of The Problem',
      name: 'user_report_problem_ditels_DescripitonOfTheProblem',
      desc: '',
      args: [],
    );
  }

  /// `No Description Available`
  String get user_report_problem_ditels_NoDescription {
    return Intl.message(
      'No Description Available',
      name: 'user_report_problem_ditels_NoDescription',
      desc: '',
      args: [],
    );
  }

  /// `Here is the evaluation of the service provided to you by technical support. We hope that there is credibility in the evaluation process so that the matter does not affect the employees.`
  String get user_report_problem_ditels_ServiceEvaluationHonestly {
    return Intl.message(
      'Here is the evaluation of the service provided to you by technical support. We hope that there is credibility in the evaluation process so that the matter does not affect the employees.',
      name: 'user_report_problem_ditels_ServiceEvaluationHonestly',
      desc: '',
      args: [],
    );
  }

  /// `Service Evaluation `
  String get user_report_problem_ditels_ServiceEvaluation {
    return Intl.message(
      'Service Evaluation ',
      name: 'user_report_problem_ditels_ServiceEvaluation',
      desc: '',
      args: [],
    );
  }

  /// `Enter The Service Description`
  String get user_report_problem_ditels_EnterTheServiceDescription {
    return Intl.message(
      'Enter The Service Description',
      name: 'user_report_problem_ditels_EnterTheServiceDescription',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get user_report_problem_ditels_Sent {
    return Intl.message(
      'Send',
      name: 'user_report_problem_ditels_Sent',
      desc: '',
      args: [],
    );
  }

  /// `Click Here To Show Contact Information`
  String get user_report_problem_ditels_ClickHereToShowContactInformation {
    return Intl.message(
      'Click Here To Show Contact Information',
      name: 'user_report_problem_ditels_ClickHereToShowContactInformation',
      desc: '',
      args: [],
    );
  }

  /// `Incompleted Maintenance`
  String get user_report_problem_InCompletedMaintenance {
    return Intl.message(
      'Incompleted Maintenance',
      name: 'user_report_problem_InCompletedMaintenance',
      desc: '',
      args: [],
    );
  }

  /// `Erorr`
  String get user_report_problem_Erorr {
    return Intl.message(
      'Erorr',
      name: 'user_report_problem_Erorr',
      desc: '',
      args: [],
    );
  }

  /// `No Reports`
  String get user_report_problem_NoReports {
    return Intl.message(
      'No Reports',
      name: 'user_report_problem_NoReports',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get user_report_problem_Date {
    return Intl.message(
      'Date',
      name: 'user_report_problem_Date',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get user_report_problem_Loaction {
    return Intl.message(
      'Location',
      name: 'user_report_problem_Loaction',
      desc: '',
      args: [],
    );
  }

  /// `Undefined`
  String get user_report_problem_Undefined {
    return Intl.message(
      'Undefined',
      name: 'user_report_problem_Undefined',
      desc: '',
      args: [],
    );
  }

  /// `Report Number`
  String get user_report_problem_ReportNumber {
    return Intl.message(
      'Report Number',
      name: 'user_report_problem_ReportNumber',
      desc: '',
      args: [],
    );
  }

  /// `ShowReport`
  String get user_report_problem_ShowReport {
    return Intl.message(
      'ShowReport',
      name: 'user_report_problem_ShowReport',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get user_minitines_send_view_Ok {
    return Intl.message(
      'OK',
      name: 'user_minitines_send_view_Ok',
      desc: '',
      args: [],
    );
  }

  /// `Please fill out all fields`
  String get user_minitines_send_view_FillAllFields {
    return Intl.message(
      'Please fill out all fields',
      name: 'user_minitines_send_view_FillAllFields',
      desc: '',
      args: [],
    );
  }

  /// `Thanks For Your Cooperation`
  String get user_minitines_send_view_ThanksForYourCooperation {
    return Intl.message(
      'Thanks For Your Cooperation',
      name: 'user_minitines_send_view_ThanksForYourCooperation',
      desc: '',
      args: [],
    );
  }

  /// `Sent Successfully`
  String get user_minitines_send_view_SentSuccessfully {
    return Intl.message(
      'Sent Successfully',
      name: 'user_minitines_send_view_SentSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Maintenance Dispatched Not Completed`
  String get user_minitines_send_view_TheMaintenanceDispatchedIsNotCompleted {
    return Intl.message(
      'Maintenance Dispatched Not Completed',
      name: 'user_minitines_send_view_TheMaintenanceDispatchedIsNotCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Erorr`
  String get user_minitines_send_view_Erorr {
    return Intl.message(
      'Erorr',
      name: 'user_minitines_send_view_Erorr',
      desc: '',
      args: [],
    );
  }

  /// `No Details Maintenance`
  String get user_minitines_send_view_NoMaintenanceDateils {
    return Intl.message(
      'No Details Maintenance',
      name: 'user_minitines_send_view_NoMaintenanceDateils',
      desc: '',
      args: [],
    );
  }

  /// `Report Number`
  String get user_minitines_send_view_ReportNumber {
    return Intl.message(
      'Report Number',
      name: 'user_minitines_send_view_ReportNumber',
      desc: '',
      args: [],
    );
  }

  /// `Report Date`
  String get user_minitines_send_view_ReportDate {
    return Intl.message(
      'Report Date',
      name: 'user_minitines_send_view_ReportDate',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get user_minitines_send_view_Location {
    return Intl.message(
      'Location',
      name: 'user_minitines_send_view_Location',
      desc: '',
      args: [],
    );
  }

  /// `Building`
  String get user_minitines_send_view_Building {
    return Intl.message(
      'Building',
      name: 'user_minitines_send_view_Building',
      desc: '',
      args: [],
    );
  }

  /// `Contact Information`
  String get user_minitines_send_view_ContactInformation {
    return Intl.message(
      'Contact Information',
      name: 'user_minitines_send_view_ContactInformation',
      desc: '',
      args: [],
    );
  }

  /// `Descripiton Of The Problem`
  String get user_minitines_send_view_DescripitonOfTheProblem {
    return Intl.message(
      'Descripiton Of The Problem',
      name: 'user_minitines_send_view_DescripitonOfTheProblem',
      desc: '',
      args: [],
    );
  }

  /// `No Description Available`
  String get user_minitines_send_view_NoDescription {
    return Intl.message(
      'No Description Available',
      name: 'user_minitines_send_view_NoDescription',
      desc: '',
      args: [],
    );
  }

  /// `Here is the evaluation of the service provided to you by technical support. We hope that there is credibility in the evaluation process so that the matter does not affect the employees.`
  String get user_minitines_send_view_ServiceEvaluationHonestly {
    return Intl.message(
      'Here is the evaluation of the service provided to you by technical support. We hope that there is credibility in the evaluation process so that the matter does not affect the employees.',
      name: 'user_minitines_send_view_ServiceEvaluationHonestly',
      desc: '',
      args: [],
    );
  }

  /// `Service Evaluation`
  String get user_minitines_send_view_ServiceEvaluation {
    return Intl.message(
      'Service Evaluation',
      name: 'user_minitines_send_view_ServiceEvaluation',
      desc: '',
      args: [],
    );
  }

  /// `Enter The Service Description`
  String get user_minitines_send_view_EnterTheServiceDescription {
    return Intl.message(
      'Enter The Service Description',
      name: 'user_minitines_send_view_EnterTheServiceDescription',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get user_minitines_send_view_Sent {
    return Intl.message(
      'Send',
      name: 'user_minitines_send_view_Sent',
      desc: '',
      args: [],
    );
  }

  /// `Click Here To Show Contact Information`
  String get user_minitines_send_view_ClickHereToShowContactInformation {
    return Intl.message(
      'Click Here To Show Contact Information',
      name: 'user_minitines_send_view_ClickHereToShowContactInformation',
      desc: '',
      args: [],
    );
  }

  /// `Report Sent`
  String get user_maintines_send_ReportsSent {
    return Intl.message(
      'Report Sent',
      name: 'user_maintines_send_ReportsSent',
      desc: '',
      args: [],
    );
  }

  /// `Erorr`
  String get user_maintines_send_Erorr {
    return Intl.message(
      'Erorr',
      name: 'user_maintines_send_Erorr',
      desc: '',
      args: [],
    );
  }

  /// `No Reports`
  String get user_maintines_send_NoReports {
    return Intl.message(
      'No Reports',
      name: 'user_maintines_send_NoReports',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get user_maintines_send_Date {
    return Intl.message(
      'Date',
      name: 'user_maintines_send_Date',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get user_maintines_send_Location {
    return Intl.message(
      'Location',
      name: 'user_maintines_send_Location',
      desc: '',
      args: [],
    );
  }

  /// `Report Number`
  String get user_maintines_send_ReportNumber {
    return Intl.message(
      'Report Number',
      name: 'user_maintines_send_ReportNumber',
      desc: '',
      args: [],
    );
  }

  /// `Undefined`
  String get user_maintines_send_Undefined {
    return Intl.message(
      'Undefined',
      name: 'user_maintines_send_Undefined',
      desc: '',
      args: [],
    );
  }

  /// `Show Report`
  String get user_maintines_send_ShowReport {
    return Intl.message(
      'Show Report',
      name: 'user_maintines_send_ShowReport',
      desc: '',
      args: [],
    );
  }

  /// ` College Of Computer `
  String get user_report_details_page_CollegeOfComputer {
    return Intl.message(
      ' College Of Computer ',
      name: 'user_report_details_page_CollegeOfComputer',
      desc: '',
      args: [],
    );
  }

  /// ` Collage Of Business`
  String get user_report_details_page_CollageOfBusiness {
    return Intl.message(
      ' Collage Of Business',
      name: 'user_report_details_page_CollageOfBusiness',
      desc: '',
      args: [],
    );
  }

  /// `Collage Of Islamic `
  String get user_report_details_page_CollageOfIslamic {
    return Intl.message(
      'Collage Of Islamic ',
      name: 'user_report_details_page_CollageOfIslamic',
      desc: '',
      args: [],
    );
  }

  /// `Collage Of Applied Sciences`
  String get user_report_details_page_CollageOfAppliedSciences {
    return Intl.message(
      'Collage Of Applied Sciences',
      name: 'user_report_details_page_CollageOfAppliedSciences',
      desc: '',
      args: [],
    );
  }

  /// `Please fill out all fields`
  String get user_report_details_page_ToHelpYouFillFields {
    return Intl.message(
      'Please fill out all fields',
      name: 'user_report_details_page_ToHelpYouFillFields',
      desc: '',
      args: [],
    );
  }

  /// `Solution will Provided Soon Thanks For Your Cooperation`
  String
      get user_report_details_page_SolutionProvidedSoonThanksForYourCooperation {
    return Intl.message(
      'Solution will Provided Soon Thanks For Your Cooperation',
      name:
          'user_report_details_page_SolutionProvidedSoonThanksForYourCooperation',
      desc: '',
      args: [],
    );
  }

  /// `Report Sent successfully`
  String get user_report_details_page_ReportSentsuccessfully {
    return Intl.message(
      'Report Sent successfully',
      name: 'user_report_details_page_ReportSentsuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Please Fill Fields With Valid Data`
  String get user_report_details_page_FillFieldsWithValidData {
    return Intl.message(
      'Please Fill Fields With Valid Data',
      name: 'user_report_details_page_FillFieldsWithValidData',
      desc: '',
      args: [],
    );
  }

  /// `Laboratory`
  String get user_report_details_page_Laboratory {
    return Intl.message(
      'Laboratory',
      name: 'user_report_details_page_Laboratory',
      desc: '',
      args: [],
    );
  }

  /// `Enter Name Of Laboratory`
  String get user_report_details_page_EnterNameOfLaboratory {
    return Intl.message(
      'Enter Name Of Laboratory',
      name: 'user_report_details_page_EnterNameOfLaboratory',
      desc: '',
      args: [],
    );
  }

  /// `Device`
  String get user_report_details_page_Device {
    return Intl.message(
      'Device',
      name: 'user_report_details_page_Device',
      desc: '',
      args: [],
    );
  }

  /// `Enter Device Number`
  String get user_report_details_page_EnterDeviceNumber {
    return Intl.message(
      'Enter Device Number',
      name: 'user_report_details_page_EnterDeviceNumber',
      desc: '',
      args: [],
    );
  }

  /// `Descripiton Of The Problem`
  String get user_report_details_page_DescriptionOfTheProblem {
    return Intl.message(
      'Descripiton Of The Problem',
      name: 'user_report_details_page_DescriptionOfTheProblem',
      desc: '',
      args: [],
    );
  }

  /// `Enter Description Of The Problem`
  String get user_report_details_page_EnterDescriptionOfTheProblem {
    return Intl.message(
      'Enter Description Of The Problem',
      name: 'user_report_details_page_EnterDescriptionOfTheProblem',
      desc: '',
      args: [],
    );
  }

  /// ` Enter Your Data`
  String get user_report_details_page_EnterYourData {
    return Intl.message(
      ' Enter Your Data',
      name: 'user_report_details_page_EnterYourData',
      desc: '',
      args: [],
    );
  }

  /// `Enter Full Name And Your Phone Number`
  String get user_report_details_page_EnterFullNameAndPhoneNumber {
    return Intl.message(
      'Enter Full Name And Your Phone Number',
      name: 'user_report_details_page_EnterFullNameAndPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `You Don't Have Admin Access`
  String get Admin_Access {
    return Intl.message(
      'You Don`t Have Admin Access',
      name: 'Admin_Access',
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
