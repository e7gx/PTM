import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      Get.rawSnackbar(
          messageText: const Text(
            '🛜  لايوجد اتصال بالانترنت ',
            textAlign: TextAlign.end,
            style: TextStyle(
              fontFamily: 'Cario',
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          borderRadius: 30.5,
          isDismissible: false,
          forwardAnimationCurve: Curves.easeOutBack,
          backgroundColor: Colors.lightBlueAccent,
          duration: const Duration(days: 1),
          icon: const Icon(
            Icons.wifi_off_sharp,
            color: Colors.white,
          ),
          // showProgressIndicator: true,
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          // borderColor: Colors.white,
          snackStyle: SnackStyle.GROUNDED);
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}
