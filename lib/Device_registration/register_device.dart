import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottie/lottie.dart';
import 'package:first_time/style/style.dart';

class RegisterDevice extends StatefulWidget {
  const RegisterDevice({super.key});

  @override
  State<RegisterDevice> createState() => RegisterDeviceState();
}

class RegisterDeviceState extends State<RegisterDevice> {
  final TextEditingController locationController = TextEditingController();
  final TextEditingController itreportController = TextEditingController();
  final TextEditingController userreportNumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          textAlign: TextAlign.center,
          '       الصفحة الرئيسية',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24, //  تغيير هذه القيمة لتكون الحجم
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.cyan,
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 4,
        toolbarHeight: 50,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Lottie.asset(
                'animation/signup1.json',
                fit: BoxFit.contain,
                height: 300,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 0),
                  buildTextField(
                      userreportNumController, 'رقم البلاغ', 'أدخل رقم البلاغ'),
                  const SizedBox(height: 30),
                  buildTextField(
                      locationController, 'موقع الجهاز', 'أدخل اسم المعمل'),
                  const SizedBox(height: 30),
                  buildTextField(
                      itreportController, 'حل المشكلة', 'أدخل حل المشكلة'),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () => _submitReport(context),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 40)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.cyan[400]),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                      ),
                      child: const Text(
                        'إرسال',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void uploadReport(String location, String report, String numberReport) {
  var reportData = {
    'date': Timestamp.now(),
    'user_report_num': numberReport,
    'location': location,
    'it_report_solution': report
  };

  FirebaseFirestore.instance
      .collection('IT_Reports')
      .add(reportData)
      .then((documentReference) {
    // ignore: avoid_print
    print('Document added with ID: ${documentReference.id}');
    // Handle successful upload here
  }).catchError((e) {
    // ignore: avoid_print
    print(e);
  });
}

void _submitReport(BuildContext context) {
  TextEditingController locationController = TextEditingController();
  TextEditingController itreportController = TextEditingController();
  TextEditingController userreportNumController = TextEditingController();

  if (userreportNumController.text.isEmpty ||
      locationController.text.isEmpty ||
      itreportController.text.isEmpty) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Lottie.asset(
            'animation/WOR.json',
            height: 290,
          ),
          content: const Text(
              '      يرجى تعبئة جميع الحقول\n         لنتمكن من رفع التقرير',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic)),
          actions: <Widget>[
            TextButton(
              child: const Text('حسنا',
                  style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  } else {
    uploadReport(
      locationController.text,
      itreportController.text,
      userreportNumController.text,
    );
  }
}
