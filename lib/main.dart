import 'package:first_time/controller/connection/dependency_injection.dart';
import 'package:first_time/notification/notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_time/App/ppm.dart';
import 'firebase/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const PPM());
  DependencyInjection.init();
}
