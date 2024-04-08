import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    // ignore: avoid_print
    print('abdullah:$fCMToken');
  }
}

void initializeNotifications() async {
  // Create an instance of FirebaseApi
  final firebaseApi = FirebaseApi();
  // Call the initNotifications method
  await firebaseApi.initNotifications();
}

// Example usage of initializeNotifications on a certain action
void onCertainAction() {
  // Call initializeNotifications when the certain action occurs
  initializeNotifications();
}
