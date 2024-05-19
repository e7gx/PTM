import 'package:first_time/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:lottie/lottie.dart';

class QRScannerPageIT extends StatefulWidget {
  const QRScannerPageIT({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPageIT> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isCodeScanned = false; // متغير لتتبع إذا تم قراءة الكود

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (!isCodeScanned) {
        // التحقق إذا لم يتم قراءة الكود من قبل
        isCodeScanned = true; // تحديث الحالة إلى "تم القراءة"
        controller.pauseCamera(); // إيقاف الكاميرا لمنع قراءات متعددة

        // عرض النافذة المنبثقة مع البيانات
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35)),
              title: Lottie.asset(
                'assets/animation/like1.json',
                height: 200,
              ),
              contentTextStyle: const TextStyle(fontSize: 15),
              content: SelectableText(
                "${S.of(context).qr_sacnnerpage_DeviceInfo}${'\n'}${scanData.code}",
                style: const TextStyle(
                  color: Colors.teal,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cario',
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Center(
                    child: Text(
                      S.of(context).qr_sacnnerpage_Ignore,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.redAccent,
                          fontSize: 17,
                          fontFamily: 'Cario'),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    controller
                        .resumeCamera(); // استئناف الكاميرا عند الضغط على "حسنا"
                    isCodeScanned = false;
                  },
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
