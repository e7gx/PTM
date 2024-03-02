import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Reports/user_report_details_page.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isCodeScanned = false; // متغير لتتبع إذا تم قراءة الكود

  @override
  Widget build(BuildContext context) {
    final Uri whatsApp = Uri.parse('https://wa.me/9660549970539');

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onPressed: () async {
          launchUrl(whatsApp);
        },
        backgroundColor: Colors.white,
        child: Container(
          child: Lottie.asset('assets/animation/Whatsapp.json'),
        ),
      ),
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
                'Device Information ' '\n' ' ${scanData.code}',
                style: const TextStyle(
                  color: Colors.teal,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cario',
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Center(
                    child: Text(
                      'تقديم بلاغ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.tealAccent,
                          fontSize: 18,
                          fontFamily: 'Cario'),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailsPage()),
                    );
                  },
                ),
                TextButton(
                  child: const Center(
                    child: Text(
                      'اهمال',
                      textAlign: TextAlign.center,
                      style: TextStyle(
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
